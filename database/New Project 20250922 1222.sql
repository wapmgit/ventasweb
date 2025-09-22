-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.33


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema svweb
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ svweb;
USE svweb;

--
-- Table structure for table `svweb`.`ajustes`
--

DROP TABLE IF EXISTS `ajustes`;
CREATE TABLE `ajustes` (
  `idajuste` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(80) NOT NULL,
  `responsable` varchar(30) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `monto` float(11,2) NOT NULL,
  PRIMARY KEY (`idajuste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`ajustes`
--

/*!40000 ALTER TABLE `ajustes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajustes` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`apartado`
--

DROP TABLE IF EXISTS `apartado`;
CREATE TABLE `apartado` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idvendedor` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(10) NOT NULL,
  `serie_comprobante` varchar(15) NOT NULL,
  `num_comprobante` int(11) NOT NULL,
  `flibre` int(11) DEFAULT '0',
  `control` varchar(10) DEFAULT NULL,
  `tasa` float(9,3) DEFAULT '0.000',
  `total_venta` float(11,2) NOT NULL,
  `base` float(9,3) DEFAULT '0.000',
  `total_iva` float(9,3) DEFAULT '0.000',
  `texe` float(9,3) DEFAULT '0.000',
  `descuento` double(15,3) DEFAULT '0.000',
  `dias` int(11) DEFAULT '0',
  `incremento` int(11) DEFAULT '0',
  `total_pagar` float(9,3) DEFAULT '0.000',
  `recargo` float(9,3) DEFAULT '0.000',
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  `impuesto` int(11) NOT NULL,
  `saldo` float(11,2) NOT NULL,
  `obs` varchar(80) DEFAULT NULL,
  `mret` float(9,3) DEFAULT '0.000',
  `estado` varchar(10) NOT NULL,
  `devolu` int(11) NOT NULL,
  `comision` double(8,3) DEFAULT '0.000',
  `montocomision` float(9,3) DEFAULT NULL,
  `idcomision` int(11) DEFAULT '0',
  `user` varchar(15) NOT NULL,
  `impor` int(11) DEFAULT '0',
  PRIMARY KEY (`idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`apartado`
--

/*!40000 ALTER TABLE `apartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `apartado` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `idarticulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` double(9,3) NOT NULL,
  `apartado` float(9,3) DEFAULT '0.000',
  `descripcion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unidad` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fraccion` float(9,3) NOT NULL DEFAULT '1.000',
  `volumen` float(9,3) DEFAULT '0.000',
  `grados` float(9,3) DEFAULT '0.000',
  `showlista` int(11) DEFAULT '1',
  `imagen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ninguna.jpg',
  `estado` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `utilidad` double(9,2) NOT NULL,
  `precio1` double(9,2) NOT NULL,
  `precio2` double(9,2) NOT NULL,
  `precio_t` double(18,3) DEFAULT NULL,
  `util2` double(9,3) NOT NULL,
  `costo` double(9,3) NOT NULL,
  `costo_t` double(9,3) NOT NULL DEFAULT '0.000',
  `iva` int(11) NOT NULL,
  `serial` int(11) DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idarticulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svweb`.`articulos`
--

/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`bancos`
--

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos` (
  `idbanco` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `cuentaban` varchar(25) DEFAULT NULL,
  `tipocta` varchar(20) DEFAULT NULL,
  `titular` varchar(50) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idbanco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`bancos`
--

/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `condicion` int(11) NOT NULL,
  `licor` int(11) DEFAULT '0',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `rif` varchar(20) DEFAULT NULL,
  `codpais` varchar(4) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `licencia` varchar(10) DEFAULT NULL,
  `status` varchar(3) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `casa` varchar(50) DEFAULT NULL,
  `avenida` varchar(50) DEFAULT NULL,
  `barrio` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `entidad` varchar(50) DEFAULT NULL,
  `codpostal` varchar(50) DEFAULT NULL,
  `tipo_cliente` int(11) NOT NULL,
  `diascredito` int(11) DEFAULT '0',
  `tipo_precio` int(11) NOT NULL,
  `retencion` int(11) DEFAULT '0',
  `vendedor` int(11) DEFAULT NULL,
  `creado` date DEFAULT NULL,
  `lastfact` date DEFAULT NULL,
  `tipo` varchar(2) DEFAULT 'C',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`comisiones`
--

DROP TABLE IF EXISTS `comisiones`;
CREATE TABLE `comisiones` (
  `id_comision` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendedor` int(11) DEFAULT NULL,
  `montoventas` float(9,3) DEFAULT NULL,
  `montocomision` float(9,3) DEFAULT NULL,
  `pendiente` float(9,3) DEFAULT '0.000',
  `fecha` date DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_comision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`comisiones`
--

/*!40000 ALTER TABLE `comisiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `comisiones` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL AUTO_INCREMENT,
  `idproveedor` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(20) NOT NULL,
  `num_comprobante` varchar(20) NOT NULL,
  `fecha_hora` date NOT NULL,
  `emision` date DEFAULT NULL,
  `impuesto` int(11) NOT NULL,
  `total` float(11,2) NOT NULL,
  `base` float(9,3) DEFAULT NULL,
  `miva` float(9,3) DEFAULT NULL,
  `exento` float(9,3) DEFAULT NULL,
  `saldo` float(11,2) NOT NULL,
  `retenido` float(9,3) DEFAULT '0.000',
  `condicion` varchar(15) NOT NULL,
  `estatus` varchar(15) NOT NULL DEFAULT '0',
  `tasa` float(9,3) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcompra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`compras`
--

/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
CREATE TABLE `comprobante` (
  `idrecibo` int(11) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) NOT NULL DEFAULT '0',
  `idgasto` int(11) DEFAULT '0',
  `idnota` int(11) DEFAULT '0',
  `monto` float(11,2) NOT NULL,
  `idpago` int(11) NOT NULL,
  `idbanco` varchar(20) NOT NULL,
  `id_banco` int(11) DEFAULT '0',
  `recibido` float(12,3) NOT NULL,
  `tasab` float(11,2) NOT NULL,
  `tasap` float(9,3) NOT NULL,
  `referencia` varchar(20) DEFAULT NULL,
  `aux` varchar(15) DEFAULT NULL,
  `fecha_comp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idrecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`comprobante`
--

/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`ctascon`
--

DROP TABLE IF EXISTS `ctascon`;
CREATE TABLE `ctascon` (
  `idcod` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) CHARACTER SET utf8 NOT NULL,
  `descrip` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tipo` double(2,0) NOT NULL DEFAULT '0',
  `inactiva` double(1,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `idcod` (`idcod`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`ctascon`
--

/*!40000 ALTER TABLE `ctascon` DISABLE KEYS */;
INSERT INTO `ctascon` (`idcod`,`codigo`,`descrip`,`tipo`,`inactiva`) VALUES 
 (1,'0001000100','Ingreso Ventas ',1,0),
 (2,'0001002122','Ingreso Cobranza',1,0),
 (6,'001-165456-4545','PRESTAMO CLIENTES',2,0),
 (3,'00120121020','Pago a Proveedores',2,0),
 (8,'00200010002','Pago Comisiones',2,0),
 (10,'00213','NOTA ADMINISTRATIVA(C/D)',2,0),
 (4,'00213452124','EGRESO GASTOS',2,0),
 (7,'0021355','EGRESO PAGO COMPRAS',2,0),
 (9,'00213556','INGRESO NOTA ADMINISTRATIVA',1,0),
 (11,'00256687','OTROS INGRESOS',1,0),
 (5,'01525451','Transferencias Bancos',3,0);
/*!40000 ALTER TABLE `ctascon` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`datacsv`
--

DROP TABLE IF EXISTS `datacsv`;
CREATE TABLE `datacsv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idarticulo` int(11) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `costo` float(9,3) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`datacsv`
--

/*!40000 ALTER TABLE `datacsv` DISABLE KEYS */;
/*!40000 ALTER TABLE `datacsv` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`detalle_ajustes`
--

DROP TABLE IF EXISTS `detalle_ajustes`;
CREATE TABLE `detalle_ajustes` (
  `iddetalle_ajuste` int(11) NOT NULL AUTO_INCREMENT,
  `idajuste` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `tipo_ajuste` varchar(15) NOT NULL,
  `cantidad` float(9,3) NOT NULL,
  `costo` float(11,2) NOT NULL,
  `valorizado` float(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ajuste`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`detalle_ajustes`
--

/*!40000 ALTER TABLE `detalle_ajustes` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ajustes` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`detalle_apartado`
--

DROP TABLE IF EXISTS `detalle_apartado`;
CREATE TABLE `detalle_apartado` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `costoarticulo` float(9,3) DEFAULT NULL,
  `cantidad` float(7,2) NOT NULL,
  `precio_venta` float(11,3) NOT NULL,
  `descuento` float(7,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  PRIMARY KEY (`iddetalle_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`detalle_apartado`
--

/*!40000 ALTER TABLE `detalle_apartado` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_apartado` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE `detalle_compras` (
  `iddetalle_compra` int(11) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` float(11,2) NOT NULL,
  `precio_compra` float(11,2) NOT NULL,
  `precio_tasa` float(9,3) DEFAULT NULL,
  `precio_venta` float(11,2) DEFAULT NULL,
  `subtotal` float(9,3) DEFAULT '0.000',
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`iddetalle_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`detalle_compras`
--

/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`detalle_devolucion`
--

DROP TABLE IF EXISTS `detalle_devolucion`;
CREATE TABLE `detalle_devolucion` (
  `iddetalle_devolucion` int(11) NOT NULL AUTO_INCREMENT,
  `iddevolucion` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` float(11,2) NOT NULL,
  `descuento` float(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_devolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`detalle_devolucion`
--

/*!40000 ALTER TABLE `detalle_devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_devolucion` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`detalle_devolucioncompras`
--

DROP TABLE IF EXISTS `detalle_devolucioncompras`;
CREATE TABLE `detalle_devolucioncompras` (
  `iddetalle` int(11) NOT NULL AUTO_INCREMENT,
  `iddevolucion` int(11) NOT NULL,
  `codarticulo` int(11) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`iddetalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`detalle_devolucioncompras`
--

/*!40000 ALTER TABLE `detalle_devolucioncompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_devolucioncompras` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE `detalle_pedido` (
  `iddetalle_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `costoarticulo` float(9,3) DEFAULT NULL,
  `cantidad` float(7,2) NOT NULL,
  `precio_venta` float(11,2) NOT NULL,
  `descuento` float(7,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  PRIMARY KEY (`iddetalle_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`detalle_pedido`
--

/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `costoarticulo` float(9,3) DEFAULT NULL,
  `cantidad` float(7,2) NOT NULL,
  `precio_venta` float(11,3) NOT NULL,
  `descuento` float(7,2) NOT NULL,
  `precio` float(9,3) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  PRIMARY KEY (`iddetalle_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`detalle_venta`
--

/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
CREATE TABLE `devolucion` (
  `iddevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `comprobante` varchar(15) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(20) NOT NULL,
  PRIMARY KEY (`iddevolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`devolucion`
--

/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`devolucioncompras`
--

DROP TABLE IF EXISTS `devolucioncompras`;
CREATE TABLE `devolucioncompras` (
  `iddevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddevolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`devolucioncompras`
--

/*!40000 ALTER TABLE `devolucioncompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucioncompras` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL,
  `codigo` int(11) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `rif` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fechasistema` date DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `corre_iva` int(11) DEFAULT '0',
  `corre_islr` int(11) DEFAULT '0',
  `tc` double(15,2) DEFAULT NULL,
  `peso` double(9,2) DEFAULT NULL,
  `tasaespecial` float(9,3) DEFAULT '0.000',
  `tasa_banco` double(15,3) DEFAULT NULL,
  `usaserie` int(11) DEFAULT '0',
  `serie` text,
  `logo` varchar(50) DEFAULT 'logoempresa.png',
  `actcosto` int(11) DEFAULT '0',
  `fl` int(11) DEFAULT '0',
  `tespecial` int(11) DEFAULT '0',
  `web` int(11) DEFAULT '0',
  `tikect` int(11) DEFAULT '0',
  `nlineas` int(11) DEFAULT '0',
  `facfiscalcredito` int(11) DEFAULT '0',
  `relapedido` int(11) DEFAULT '0',
  `formatofac` varchar(20) DEFAULT NULL,
  `bordefac` int(11) DEFAULT '0',
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`empresa`
--

/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`idempresa`,`codigo`,`nombre`,`direccion`,`rif`,`telefono`,`fechasistema`,`inicio`,`corre_iva`,`corre_islr`,`tc`,`peso`,`tasaespecial`,`tasa_banco`,`usaserie`,`serie`,`logo`,`actcosto`,`fl`,`tespecial`,`web`,`tikect`,`nlineas`,`facfiscalcredito`,`relapedido`,`formatofac`,`bordefac`) VALUES 
 (1,100,'DISTRIBIDORA VIRGEN DEL CARMEN C.A.','Avenida antonio pinto salinas, santa cruz de mora','V087134993','0424-7556213','2024-09-09','2024-09-09',0,0,104.54,4000.00,NULL,4.160,1,'A','mrjuancho.png',0,1,0,1,0,15,1,0,NULL,1);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svweb`.`failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`formalibre`
--

DROP TABLE IF EXISTS `formalibre`;
CREATE TABLE `formalibre` (
  `idforma` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) DEFAULT NULL,
  `nrocontrol` int(11) DEFAULT NULL,
  `anulado` int(11) DEFAULT '0',
  PRIMARY KEY (`idforma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`formalibre`
--

/*!40000 ALTER TABLE `formalibre` DISABLE KEYS */;
/*!40000 ALTER TABLE `formalibre` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`gastos`
--

DROP TABLE IF EXISTS `gastos`;
CREATE TABLE `gastos` (
  `idgasto` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `control` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `base` float(9,3) DEFAULT '0.000',
  `iva` float(9,3) DEFAULT '0.000',
  `exento` float(9,3) DEFAULT '0.000',
  `monto` float(9,3) DEFAULT NULL,
  `saldo` float(9,3) DEFAULT NULL,
  `retenido` float(9,3) DEFAULT '0.000',
  `tasa` float(9,3) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `estatus` int(11) DEFAULT '0',
  PRIMARY KEY (`idgasto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`gastos`
--

/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`kardex`
--

DROP TABLE IF EXISTS `kardex`;
CREATE TABLE `kardex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `idarticulo` int(11) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL,
  `costo` float(9,3) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`kardex`
--

/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svweb`.`migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES 
 (1,'2014_10_12_000000_create_users_table',1),
 (2,'2014_10_12_100000_create_password_resets_table',1),
 (3,'2019_08_19_000000_create_failed_jobs_table',1),
 (4,'2019_12_14_000001_create_personal_access_tokens_table',1),
 (5,'2023_03_13_175600_articulos',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`monedas`
--

DROP TABLE IF EXISTS `monedas`;
CREATE TABLE `monedas` (
  `idmoneda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `simbolo` char(3) DEFAULT 'sm',
  `valor` float(9,3) DEFAULT '0.000',
  `idbanco` int(11) DEFAULT '0',
  PRIMARY KEY (`idmoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`monedas`
--

/*!40000 ALTER TABLE `monedas` DISABLE KEYS */;
INSERT INTO `monedas` (`idmoneda`,`nombre`,`tipo`,`simbolo`,`valor`,`idbanco`) VALUES 
 (1,'Dolares',0,'$',1.000,3),
 (2,'Dolares Transf.',0,'$',1.000,2),
 (3,'Pesos',1,'Ps',4000.000,0),
 (4,'Bolivares Efect.',1,'Bs',104.540,0),
 (5,'Bolivares Transf.',1,'Bs',25.000,0),
 (6,'Pto Venta',1,'Bs',28.000,0),
 (7,'Pto Sofitasa',1,'Bs',24.000,1),
 (8,'Pto Movistar',1,'Bs',24.000,1),
 (9,'Pto Provincial',1,'Bs',24.120,1),
 (10,'Gastos',0,'$',1.000,0),
 (11,'Desc. Fact.',0,'$',1.000,0),
 (12,'EURO',2,'E',1.200,0),
 (13,'YEN',2,'Yn',1.450,0);
/*!40000 ALTER TABLE `monedas` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`mov_ban`
--

DROP TABLE IF EXISTS `mov_ban`;
CREATE TABLE `mov_ban` (
  `id_mov` int(11) NOT NULL AUTO_INCREMENT,
  `idbanco` int(11) DEFAULT NULL,
  `clasificador` int(11) DEFAULT NULL,
  `tipodoc` char(4) DEFAULT '0',
  `docrelacion` int(11) DEFAULT '0',
  `iddocumento` int(11) DEFAULT '0',
  `tipo_mov` text,
  `numero` varchar(20) DEFAULT NULL,
  `concepto` varchar(40) DEFAULT NULL,
  `tipo_per` char(2) DEFAULT NULL,
  `idbeneficiario` int(11) DEFAULT '0',
  `identificacion` varchar(100) DEFAULT NULL,
  `ced` varchar(30) DEFAULT NULL,
  `monto` double(15,3) DEFAULT NULL,
  `tasadolar` double(15,3) DEFAULT NULL,
  `fecha_mov` datetime DEFAULT NULL,
  `estatus` int(11) DEFAULT '0',
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_mov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`mov_ban`
--

/*!40000 ALTER TABLE `mov_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_ban` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`mov_notas`
--

DROP TABLE IF EXISTS `mov_notas`;
CREATE TABLE `mov_notas` (
  `id_mov` int(11) NOT NULL AUTO_INCREMENT,
  `tipodoc` varchar(5) DEFAULT NULL,
  `iddoc` int(11) DEFAULT NULL,
  `monto` float(9,3) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `referencia` varchar(20) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_mov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`mov_notas`
--

/*!40000 ALTER TABLE `mov_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_notas` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`mov_notasp`
--

DROP TABLE IF EXISTS `mov_notasp`;
CREATE TABLE `mov_notasp` (
  `id_mov` int(11) NOT NULL AUTO_INCREMENT,
  `tipodoc` varchar(5) DEFAULT NULL,
  `iddoc` int(11) DEFAULT NULL,
  `monto` float(9,3) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `referencia` varchar(20) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_mov`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`mov_notasp`
--

/*!40000 ALTER TABLE `mov_notasp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_notasp` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`notasadm`
--

DROP TABLE IF EXISTS `notasadm`;
CREATE TABLE `notasadm` (
  `idnota` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `ndocumento` int(11) DEFAULT '0',
  `idcliente` int(11) DEFAULT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `monto` float(9,3) NOT NULL,
  `fecha` date DEFAULT NULL,
  `pendiente` float(9,3) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `pordevolucion` int(11) DEFAULT '0',
  PRIMARY KEY (`idnota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`notasadm`
--

/*!40000 ALTER TABLE `notasadm` DISABLE KEYS */;
/*!40000 ALTER TABLE `notasadm` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`notasadmp`
--

DROP TABLE IF EXISTS `notasadmp`;
CREATE TABLE `notasadmp` (
  `idnota` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `ndocumento` int(11) DEFAULT '0',
  `idproveedor` int(11) DEFAULT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `referencia` varchar(20) NOT NULL,
  `monto` float(9,3) NOT NULL,
  `fecha` date DEFAULT NULL,
  `pendiente` float(9,3) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idnota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`notasadmp`
--

/*!40000 ALTER TABLE `notasadmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `notasadmp` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svweb`.`password_resets`
--

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idvendedor` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(10) NOT NULL,
  `serie_comprobante` varchar(15) NOT NULL,
  `num_comprobante` int(11) NOT NULL,
  `total_venta` float(11,2) NOT NULL,
  `descuento` double(15,3) DEFAULT '0.000',
  `total_pagar` float(9,3) DEFAULT '0.000',
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  `impuesto` int(11) NOT NULL,
  `saldo` float(11,2) NOT NULL,
  `diascre` int(11) DEFAULT NULL,
  `estado` varchar(10) NOT NULL,
  `devolu` int(11) NOT NULL,
  `comision` double(8,3) DEFAULT '0.000',
  `montocomision` float(9,3) DEFAULT NULL,
  `idcomision` int(11) DEFAULT '0',
  `pweb` int(11) DEFAULT '0',
  `user` varchar(15) NOT NULL,
  `impor` int(11) DEFAULT '0',
  PRIMARY KEY (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svweb`.`personal_access_tokens`
--

/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `rif` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(25) DEFAULT NULL,
  `contacto` varchar(80) DEFAULT NULL,
  `estatus` varchar(1) NOT NULL,
  `tpersona` int(11) DEFAULT '1',
  `creado` date DEFAULT NULL,
  `tipo` varchar(2) DEFAULT 'P',
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`proveedores`
--

/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`recibos`
--

DROP TABLE IF EXISTS `recibos`;
CREATE TABLE `recibos` (
  `idrecibo` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idnota` int(11) DEFAULT '0',
  `idapartado` int(11) DEFAULT '0',
  `tiporecibo` char(2) DEFAULT 'P',
  `monto` float(11,2) NOT NULL,
  `idpago` int(11) NOT NULL,
  `id_banco` int(11) DEFAULT NULL,
  `idbanco` varchar(18) DEFAULT NULL,
  `recibido` float(11,2) NOT NULL,
  `tasab` float(11,2) DEFAULT NULL,
  `tasap` float(11,2) DEFAULT NULL,
  `referencia` varchar(20) DEFAULT NULL,
  `aux` varchar(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idrecibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`recibos`
--

/*!40000 ALTER TABLE `recibos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibos` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`reciboscomision`
--

DROP TABLE IF EXISTS `reciboscomision`;
CREATE TABLE `reciboscomision` (
  `id_recibo` int(11) NOT NULL AUTO_INCREMENT,
  `id_comision` int(11) DEFAULT NULL,
  `monto` float(9,3) DEFAULT NULL,
  `observacion` varchar(80) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_recibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`reciboscomision`
--

/*!40000 ALTER TABLE `reciboscomision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reciboscomision` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`relacionnc`
--

DROP TABLE IF EXISTS `relacionnc`;
CREATE TABLE `relacionnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmov` int(11) DEFAULT NULL,
  `idnota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`relacionnc`
--

/*!40000 ALTER TABLE `relacionnc` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacionnc` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`relacionncp`
--

DROP TABLE IF EXISTS `relacionncp`;
CREATE TABLE `relacionncp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmov` int(11) DEFAULT NULL,
  `idnota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`relacionncp`
--

/*!40000 ALTER TABLE `relacionncp` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacionncp` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`retenc`
--

DROP TABLE IF EXISTS `retenc`;
CREATE TABLE `retenc` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codtrib` varchar(20) DEFAULT '',
  `descrip` varchar(80) DEFAULT '',
  `beneficiar` double(2,0) NOT NULL DEFAULT '0',
  `base` double(20,7) NOT NULL DEFAULT '0.0000000',
  `ret` double(20,7) NOT NULL DEFAULT '0.0000000',
  `sustraend` double(20,7) NOT NULL DEFAULT '0.0000000',
  `superior` double(20,7) NOT NULL DEFAULT '0.0000000',
  `afiva` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `svweb`.`retenc`
--

/*!40000 ALTER TABLE `retenc` DISABLE KEYS */;
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (1,'001','HONORARIOS, SUELDOS Y SALARIOS',3,100.0000000,3.0000000,2125.0000000,70833.3300000,1),
 (2,'002','(PNR)-Honorarios Profesionales No Mercantiles',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (3,'003','(PNNR)-Honorarios Profesionales No Mercantiles',4,90.0000000,34.0000000,0.0000000,0.0000000,0),
 (4,'004','(PJD)-Honorarios Profesionales No Mercantiles',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (5,'005','(PJND)-Honorarios Profesionales No Mercantiles',2,90.0000000,15.0000000,0.0000000,0.0100000,0),
 (6,'006','(PNR)-Honorarios Profesionales Mancomunados No Mercantiles',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (7,'007','(PNNR)-Honorarios Profesionales Mancomunados No Mercantiles',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (8,'008','(PJD)-Honorarios Profesionales Mancomunados No Mercantiles',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (9,'055','(PJND)-Honorarios Profesionales Mancomunados No Mercantiles',2,100.0000000,15.0000000,0.0000000,0.0100000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (10,'010','(PNR)-Honorarios Profesionales pagados a Jinetes, Veterinarios, Preparadores o E',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (11,'011','(PNNR)-Honorarios Profesionales pagados a Jinetes, Veterinarios, Preparadores o',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (12,'012','(PNR)-Honorarios Profesionales pagados por Clínicas, Hospitales, Centros de Salu',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (13,'013','(PNNR)-Honorarios Profesionales pagados por Clínicas, Hospitales, Centros de Sal',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (14,'014','(PNR)-Comisiones pagadas por la venta de bienes inmuebles',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (15,'015','(PNNR)-Comisiones pagadas por la venta de bienes inmuebles',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (16,'016','(PJD)-Comisiones pagadas por la venta de bienes inmuebles',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (17,'017','(PJND)Comisiones pagadas por la venta de bienes inmuebles',2,100.0000000,5.0000000,0.0000000,0.0100000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (18,'018','(PNR)-Cualquier otra Comisión distintas a Remuneraciones accesorias de los sueld',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (19,'019','(PNNR)-Cualquier otra Comisión distintas a Remuneraciones accesorias de los suel',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (20,'020','(PJD)-Cualquier otra Comisión distintas a Remuneraciones accesorias de los sueld',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (21,'021','(PJND)-Cualquier otra Comisión distintas a Remuneraciones accesorias de los suel',2,100.0000000,5.0000000,0.0000000,0.0100000,0),
 (22,'022','(PNNR)-Intereses de Capitales tomados en préstamo e invertidos en la producción',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (23,'023','(PJND)-Intereses de Capitales tomados en préstamo e invertidos en la producción',2,100.0000000,15.0000000,0.0000000,0.0100000,0),
 (24,'024','(PJND)-Intereses provenientes de prestamos y otros creditos pagaderos a instituc',2,100.0000000,4.9500000,0.0000000,0.0100000,0),
 (25,'025','(PNR)-Intereses pagados por las personas jurídicas o comunidades a cualquier otr',4,100.0000000,3.0000000,0.0000000,0.0000000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (26,'026','(PNNR)-Intereses pagados por las personas jurídicas o comunidades a cualquier ot',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (27,'027','(PJD)-Intereses pagados por las personas jurídicas o comunidades a cualquier otr',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (28,'028','(PJND)-Intereses pagados por las personas jurídicas o comunidades a cualquier ot',4,100.0000000,15.0000000,0.0000000,0.0000000,0),
 (29,'029','(PJND)-Enriquecimientos Netos de las Agencias Internacionales cuando el pagador',2,100.0000000,15.0000000,0.0000000,0.0100000,0),
 (30,'030','(PNNR)-Enriquecimientos Netos de Gastos de Transporte conformados por fletes pag',4,100.0000000,15.0000000,0.0000000,0.0000000,0),
 (31,'031','(PJND)-Enriquecimientos Netos de Gastos de Transporte conformados por fletes pag',2,100.0000000,15.0000000,0.0000000,0.0100000,0),
 (32,'032','(PNNR)-Enriquecimientos Netos de Exhibición de Películas, Cine o la Televisión',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (33,'033','(PJND)-Enriquecimientos Netos de Exhibición de Películas, Cine o la Televisión',2,100.0000000,15.0000000,0.0000000,0.0100000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (34,'034','(PNNR)-Enriquecimientos obtenidos por concepto de regalías y demás participacion',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (35,'035','(PJND)-Enriquecimientos obtenidos por concepto de regalías y demás participacion',4,100.0000000,15.0000000,0.0000000,0.0000000,0),
 (36,'036','(PNNR)-Enriquecimientos obtenidos por las Remuneraciones, Honorarios y pagos aná',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (37,'037','(PJND)-Enriquecimientos obtenidos por las Remuneraciones, Honorarios y pagos aná',2,100.0000000,15.0000000,0.0000000,0.0100000,0),
 (38,'038','(PNNR)-Enriquecimientos obtenidos por Servicios Tecnológicos utilizados en el pa',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (39,'039','(PJND)-Enriquecimientos obtenidos por Servicios Tecnológicos utilizados en el pa',2,100.0000000,15.0000000,0.0000000,0.0100000,0),
 (40,'040','(PJND)-Enriquecimientos Netos derivados de las Primas de Seguros y Reaseguros',2,100.0000000,10.0000000,0.0000000,0.0100000,0),
 (41,'041','(PNR)-Ganancias Obtenidas por Juegos y Apuestas',3,100.0000000,34.0000000,2125.0000000,70833.3300000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (42,'042','(PNNR)-Ganancias Obtenidas por Juegos y Apuestas',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (43,'043','(PJD)-Ganancias Obtenidas por Juegos y Apuestas',1,100.0000000,34.0000000,0.0000000,25.0000000,0),
 (44,'044','(PJND)-Ganancias Obtenidas por Juegos y Apuestas',2,100.0000000,34.0000000,0.0000000,0.0100000,0),
 (45,'045','(PNR)-Ganancias Obtenidas por Premios de Loterías y de Hipódromos',3,100.0000000,16.0000000,2125.0000000,70833.3300000,0),
 (46,'046','(PNNR)-Ganancias Obtenidas por Premios de Loterías y de Hipódromos',4,100.0000000,16.0000000,0.0000000,0.0000000,0),
 (47,'047','(PJD)-Ganancias Obtenidas por Premios de Loterías y de Hipódromos',1,100.0000000,16.0000000,0.0000000,25.0000000,0),
 (48,'048','(PJND)-Ganancias Obtenidas por Premios de Loterías y de Hipódromos',2,100.0000000,16.0000000,0.0000000,0.0100000,0),
 (49,'049','(PNR)-Pagos a Propietarios de Animales de Carrera por concepto de Premios',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (50,'050','(PNNR)-Pagos a Propietarios de Animales de Carrera por concepto de Premios',4,100.0000000,34.0000000,0.0000000,0.0000000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (51,'051','(PJD)-Pagos a Propietarios de Animales de Carrera por concepto de Premios',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (52,'052','(PJND)-Pagos a Propietarios de Animales de Carrera por concepto de Premios',2,100.0000000,5.0000000,0.0000000,0.0100000,0),
 (53,'053','(PNR)-Pagos a Empresas Contratistas o Subcontratistas domiciliadas o no en el pa',3,100.0000000,1.0000000,2125.0000000,70833.3300000,0),
 (54,'054','(PNNR)-Pagos a Empresas Contratistas o Subcontratistas domiciliadas o no en el p',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (55,'055','(PJD)-Pagos a Empresas Contratistas o Subcontratistas domiciliadas o no en el pa',1,100.0000000,2.0000000,0.0000000,25.0000000,0),
 (56,'056','(PJND)-Pagos a Empresas Contratistas o Subcontratistas domiciliadas o no en el p',2,100.0000000,15.0000000,0.0000000,0.0100000,0),
 (57,'057','(PNR)-Pagos de los Arrendadores de bienes inmuebles situados en el pais',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (58,'058','(PNNR)-Pagos de los Arrendadores de bienes inmuebles situados en el pais',4,90.0000000,34.0000000,0.0000000,0.0000000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (59,'059','(PJD)-Pagos de los Arrendadores de bienes inmuebles situados en el pais',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (60,'060','(PJND)-Pagos de los Arrendadores de bienes inmuebles situados en el pais',2,90.0000000,15.0000000,0.0000000,0.0100000,0),
 (61,'061','(PNR)-Cánones de Arrendamientos de Bienes Muebles situados en el país',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (62,'062','(PNNR)-Cánones de Arrendamientos de Bienes Muebles situados en el país',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (63,'063','(PJD)-Cánones de Arrendamientos de Bienes Muebles situados en el país',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (64,'064','(PJND)-Cánones de Arrendamientos de Bienes Muebles situados en el país',2,100.0000000,5.0000000,0.0000000,0.0100000,0),
 (65,'065','(PNR)-Pagos de las Empresas Emisoras de Tarjetas de Crédito o Consumo por la Ven',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (66,'066','(PNNR)-Pagos de las Empresas Emisoras de Tarjetas de Crédito o Consumo por la Ve',4,100.0000000,34.0000000,0.0000000,0.0000000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (67,'067','(PJD)-Pagos de las Empresas Emisoras de Tarjetas de Crédito o Consumo por la Ven',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (68,'068','(PJND)-Pagos de las Empresas Emisoras de Tarjetas de Crédito o Consumo por la Ve',2,100.0000000,5.0000000,0.0000000,0.0100000,0),
 (69,'069','(PNR)-Pagos de las Empresas Emisoras de Tarjetas de Crédito por la venta de gaso',3,100.0000000,1.0000000,2125.0000000,70833.3300000,0),
 (70,'070','(PJD)-Pagos de las Empresas Emisoras de Tarjetas de Crédito por la venta de gaso',1,100.0000000,1.0000000,0.0000000,25.0000000,0),
 (71,'071','(PNR)-Pagos por Gastos de Transporte conformados por Fletes',3,100.0000000,1.0000000,708.3300000,70833.3300000,0),
 (72,'072','(PJD)-Pagos por Gastos de Transporte conformados por Fletes',1,100.0000000,3.0000000,0.0000000,25.0000000,0),
 (73,'073','(PNR)-Pagos de las Empresas de Seguro, las Sociedades de Corretaje de Seguros y',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (74,'074','(PJD)-Pagos de las Empresas de Seguro, las Sociedades de Corretaje de Seguros y',1,100.0000000,5.0000000,0.0000000,25.0000000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (75,'075','(PNR)-Pagos de las Empresas de Seguro a sus Contratistas por la Reparación de Da',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (76,'076','(PJD)-Pagos de las Empresas de Seguro a sus Contratistas por la Reparación de Da',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (77,'077','(PNR)-Pagos de las Empresas de Seguros a Clínicas, Hospitales y/o Centros de Sal',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (78,'078','(PJD)-Pagos de las Empresas de Seguros a Clínicas, Hospitales y/o Centros de Sal',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (79,'079','(PNR)-Cantidades que se paguen por adquisición de Fondos de Comercio situados en',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (80,'080','(PNNR)-Cantidades que se paguen por adquisición de Fondos de Comercio situados e',4,100.0000000,34.0000000,0.0000000,0.0000000,0),
 (81,'081','(PJD)-Cantidades que se paguen por adquisición de Fondos de Comercio situados en',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (82,'082','(PJND)-Cantidades que se paguen por adquisición de Fondos de Comercio situados e',2,100.0000000,5.0000000,0.0000000,0.0100000,0);
INSERT INTO `retenc` (`codigo`,`codtrib`,`descrip`,`beneficiar`,`base`,`ret`,`sustraend`,`superior`,`afiva`) VALUES 
 (83,'083','(PNR)-Pagos por Servicios de Publicidad y Propaganda y la Cesión de la Venta de',3,100.0000000,3.0000000,2125.0000000,70833.3300000,0),
 (84,'084','(PJD)-Pagos por Servicios de Publicidad y Propaganda y la Cesión de la Venta de',1,100.0000000,5.0000000,0.0000000,25.0000000,0),
 (85,'085','(PJND)-Pagos por Servicios de Publicidad y Propaganda y la Cesión de la Venta de',2,100.0000000,5.0000000,0.0000000,0.0100000,0),
 (86,'086','(PJD)-Pagos por Servicios de Publicidad y Propaganda y la Cesión de la Venta de',1,100.0000000,3.0000000,0.0000000,25.0000000,0),
 (87,'','RETENCION 100% DEL IVA A PROVEEDORES',1,100.0000000,100.0000000,0.0000000,0.0000000,1),
 (88,'','RETENCION 75% DEL IVA A PROVEEDORES',1,100.0000000,75.0000000,0.0000000,0.0000000,1),
 (89,'','PRESTACION DE SERVICIO ALCALDIA',1,100.0000000,1.0000000,0.0000000,0.0000000,0);
/*!40000 ALTER TABLE `retenc` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`retenciones`
--

DROP TABLE IF EXISTS `retenciones`;
CREATE TABLE `retenciones` (
  `idretencion` int(11) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) DEFAULT '0',
  `idgasto` int(11) DEFAULT '0',
  `idproveedor` int(11) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `correlativo` int(11) DEFAULT '0',
  `retenc` int(11) DEFAULT NULL,
  `mfac` float(9,3) DEFAULT NULL,
  `mbase` float(9,3) DEFAULT NULL,
  `miva` float(9,3) DEFAULT NULL,
  `mexento` float(9,3) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `mret` float(9,3) DEFAULT NULL,
  `mretd` float(9,3) DEFAULT NULL,
  `anulada` int(11) DEFAULT '0',
  PRIMARY KEY (`idretencion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`retenciones`
--

/*!40000 ALTER TABLE `retenciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `retenciones` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`retencionventas`
--

DROP TABLE IF EXISTS `retencionventas`;
CREATE TABLE `retencionventas` (
  `idret` int(11) NOT NULL AUTO_INCREMENT,
  `idfactura` int(11) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `comprobante` varchar(20) DEFAULT NULL,
  `pretencion` int(11) DEFAULT NULL,
  `impuesto` float(9,3) DEFAULT NULL,
  `mretbs` float(9,3) DEFAULT NULL,
  `mretd` float(9,3) DEFAULT NULL,
  `mfactura` double(15,3) DEFAULT NULL,
  `tasa` float(9,3) DEFAULT NULL,
  `fecharegistro` date DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `periodo` int(11) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idret`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`retencionventas`
--

/*!40000 ALTER TABLE `retencionventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `retencionventas` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `iduser` int(11) DEFAULT NULL,
  `newproveedor` int(11) DEFAULT '0',
  `editproveedor` int(11) DEFAULT '0',
  `edoctaproveedor` int(11) DEFAULT '0',
  `newvendedor` int(11) DEFAULT '0',
  `editvendedor` int(11) DEFAULT '0',
  `newcliente` int(11) DEFAULT '0',
  `editcliente` int(11) DEFAULT '0',
  `edoctacliente` int(11) DEFAULT '0',
  `newarticulo` int(11) DEFAULT '0',
  `editarticulo` int(11) DEFAULT '0',
  `crearcompra` int(11) DEFAULT '0',
  `anularcompra` int(11) DEFAULT '0',
  `editserial` int(11) DEFAULT '0',
  `printcertificado` int(11) DEFAULT '0',
  `crearventa` int(11) DEFAULT '0',
  `anularventa` int(11) DEFAULT '0',
  `crearpedido` int(11) DEFAULT '0',
  `editpedido` int(11) DEFAULT '0',
  `anularpedido` int(11) DEFAULT '0',
  `importarpedido` int(11) DEFAULT '0',
  `crearajuste` int(11) DEFAULT '0',
  `abonarcxc` int(11) DEFAULT '0',
  `creargasto` int(11) DEFAULT '0',
  `anulargasto` int(11) DEFAULT '0',
  `abonarcxp` int(11) DEFAULT '0',
  `abonargasto` int(11) DEFAULT '0',
  `newapartado` int(11) DEFAULT '0',
  `anularapartado` int(11) DEFAULT '0',
  `abonarapartado` int(11) DEFAULT '0',
  `comisiones` int(11) DEFAULT '0',
  `newmoneda` int(11) DEFAULT '0',
  `editmoneda` int(11) DEFAULT '0',
  `acttasa` int(11) DEFAULT '0',
  `actroles` int(11) DEFAULT '0',
  `rventas` int(11) DEFAULT '0',
  `ccaja` int(11) DEFAULT '0',
  `rdetallei` int(11) DEFAULT '0',
  `rcxc` int(11) DEFAULT '0',
  `rcompras` int(11) DEFAULT '0',
  `rdetallec` int(11) DEFAULT '0',
  `rcxp` int(11) DEFAULT '0',
  `rarti` int(11) DEFAULT '0',
  `rlistap` int(11) DEFAULT '0',
  `rgerencial` int(11) DEFAULT '0',
  `ranalisisc` int(11) DEFAULT '0',
  `rutilventa` int(11) DEFAULT '0',
  `rventasarti` int(11) DEFAULT '0',
  `rgastos` int(11) DEFAULT '0',
  `retenciones` int(11) DEFAULT '0',
  `editret` int(11) DEFAULT '0',
  `anularret` int(11) DEFAULT '0',
  `rcompraarti` int(11) DEFAULT '0',
  `web` int(11) DEFAULT '0',
  `updatepass` int(11) DEFAULT '0',
  `newbanco` int(11) DEFAULT '0',
  `editbanco` int(11) DEFAULT '0',
  `accesobanco` int(11) DEFAULT '0',
  `newndbanco` int(11) DEFAULT '0',
  `newncbanco` int(11) DEFAULT '0',
  `transferenciabanco` int(11) DEFAULT '0',
  `anularopbanco` int(11) DEFAULT '0',
  `resumenbanco` int(11) DEFAULT '0',
  `rlcompras` int(11) DEFAULT '0',
  `rlventas` int(11) DEFAULT '0',
  `rlvalorizado` int(11) DEFAULT '0',
  `rcorrelativo` int(11) DEFAULT '0',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editserial`,`printcertificado`,`crearventa`,`anularventa`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`crearajuste`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rcorrelativo`) VALUES 
 (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1),
 (2,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1);
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editserial`,`printcertificado`,`crearventa`,`anularventa`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`crearajuste`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rcorrelativo`) VALUES 
 (3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1),
 (4,4,0,0,0,1,0,1,0,0,0,1,0,1,0,0,1,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editserial`,`printcertificado`,`crearventa`,`anularventa`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`crearajuste`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rcorrelativo`) VALUES 
 (5,5,0,0,0,0,0,1,0,0,1,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
 (6,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`seriales`
--

DROP TABLE IF EXISTS `seriales`;
CREATE TABLE `seriales` (
  `idserial` int(11) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) DEFAULT '0',
  `idarticulo` int(11) DEFAULT NULL,
  `chasis` varchar(40) DEFAULT NULL,
  `motor` varchar(40) DEFAULT NULL,
  `placa` varchar(8) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `año` varchar(4) DEFAULT NULL,
  `estatus` int(11) DEFAULT '0',
  `idventa` int(11) DEFAULT '0',
  `idapartado` int(11) DEFAULT '0',
  `iddetalleventa` int(11) DEFAULT '0',
  PRIMARY KEY (`idserial`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`seriales`
--

/*!40000 ALTER TABLE `seriales` DISABLE KEYS */;
INSERT INTO `seriales` (`idserial`,`idcompra`,`idarticulo`,`chasis`,`motor`,`placa`,`color`,`año`,`estatus`,`idventa`,`idapartado`,`iddetalleventa`) VALUES 
 (1,9,64,'L2YPCJLC3R0l06947','157FMI24206947','0000','ROJO','2024',1,109,0,531),
 (2,9,64,'L2YPCJLC3R0l06981','157FMI24206981','0000','NEGRO','2024',1,141,0,649),
 (3,9,64,'L2YPCJLC3R0l07113','157FMI24207113','0000','AZUL','2024',0,0,0,0),
 (4,12,100,'0','152FMH24013120',NULL,'AZUL','2024',0,0,0,0),
 (5,12,100,'0','152FMH24013153',NULL,'VERDE','2024',0,0,0,0),
 (6,13,100,'0000','152FMH24013071',NULL,'ROJO','2024',0,0,0,0),
 (7,13,100,'0000','152FMH24013130',NULL,'VERDE','2024',0,0,0,0),
 (8,19,187,'L2YPCKLC9R0L10572','162FMJ24210572','AM8K99G','ROJO','2024',0,0,0,0),
 (9,19,187,'L2YPCKLC8R0L10577','162FMJ24210577','AM8K68G','ROJO','2024',0,0,0,0),
 (10,19,187,'L2YPCKLC0R0L10606','162FMJ24210606','AM9K12G','NEGRO','2024',0,0,0,0),
 (11,19,187,'L2YPCKLC4R0L10608','162FMJ24210608','AM8K92G','NEGRO','2024',0,0,0,0),
 (12,19,187,'L2YPCKLC5R0L10648','162FMJ24210648','AM9K09G','AZUL','2024',1,39,0,164),
 (13,19,187,'L2YPCKLC6R0L10657','162FMJ24210657','AM9K11G','AZUL','2024',0,0,0,0);
INSERT INTO `seriales` (`idserial`,`idcompra`,`idarticulo`,`chasis`,`motor`,`placa`,`color`,`año`,`estatus`,`idventa`,`idapartado`,`iddetalleventa`) VALUES 
 (14,19,187,'L2YPCKLC5R0L10715','162FMJ24210715','AM9K10G','AZUL','2024',0,0,0,0),
 (15,48,397,'813ME1EAXSV003351','MD162FMJ R5201702','AK6I49E','AZUL','2025',1,326,0,1386),
 (16,48,397,'813ME1EA3SV001876','MD162FMJ R5201096','AP5Z78D','AZUL','2025',1,156,0,704),
 (17,48,397,'813ME1EA5SV002527','MD162FMJ R5201289','AH7L71R','AZUL','2025',1,174,0,739),
 (18,48,398,'813ME1EA2SV001674','MD162FMJ R4117148','AP5Z80D','VERDE','2025',1,223,0,1010),
 (19,48,398,'L2YPCKLC8SOLO2775','162FMJ25202775','AS4D90M','AZUL','2025',1,239,0,1075),
 (20,48,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (21,48,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (22,48,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (23,48,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (24,48,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (25,49,402,'81A3G4H19SM003969','LC162FMJ184440E4','AJ6N07K','ROJO','2025',1,217,0,993),
 (26,49,402,'81A3G4H15SM004049','LC162FMJ184533E4','AJ6N88K','NEGRO','2025',1,198,0,874);
INSERT INTO `seriales` (`idserial`,`idcompra`,`idarticulo`,`chasis`,`motor`,`placa`,`color`,`año`,`estatus`,`idventa`,`idapartado`,`iddetalleventa`) VALUES 
 (27,49,402,'81A3G4H12SM003652','LC162FMJ184895E4','AK6U90K','AZUL','2025',1,248,0,1090),
 (28,49,402,'81A3G4H16SM003900','LC162FMJ184910E4','AK5H37K','AZUL','2025',1,194,0,852),
 (29,50,403,'813MG1EA5SV002947','MD162FMJ R5200744','AP8Y04D','NEGRO','2025',0,0,0,0),
 (30,50,403,'813MG1EA1SV002959','MD162FMJ R5200717','AP8Y05D','NEGRO','2025',1,162,0,711),
 (31,50,404,'813MG1EA0SV002970','MD162FMJ R5200732','AP8Y07D','ROJO','2025',0,0,0,0),
 (32,50,404,'813MG1EA7SV002920','MD162FMJ R5200646','AP8Y08D','ROJO','2025',1,170,0,733),
 (33,50,405,'813MG1EA3SV002963','MD162FMJ R5200782','AP8Y09D','GRIS','2025',0,0,0,0),
 (34,50,406,'813MG1EA3SV002915','MD162FMJ R5200769','AP8Y06D','MORAdo','2025',0,0,0,0),
 (35,50,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (36,50,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (37,50,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (38,50,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0);
INSERT INTO `seriales` (`idserial`,`idcompra`,`idarticulo`,`chasis`,`motor`,`placa`,`color`,`año`,`estatus`,`idventa`,`idapartado`,`iddetalleventa`) VALUES 
 (39,50,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (40,50,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (41,55,396,'813ME1EA8SV002084','MD162FMJ R4117356','AK0J39E','ROJO','2025',0,0,0,0),
 (42,55,396,'813ME1EA5SV003211','MD162FMJ R4130393','AK0J40E','ROJO','2025',1,310,0,1308),
 (43,55,396,'813ME1EA7SV003369','MD162FMJ R5201709','AK0J41E','ROJO','2025',0,0,0,0),
 (44,55,396,'813ME1EA3SV002526','MD162FMJ R4117433','A00J00D','ROJO','2025',1,348,0,1501),
 (45,55,407,'813ME1EA8SV003428','MD162FMJ R5201658','AK0J36E','AZUL','2025',1,242,0,1082),
 (46,55,407,'813ME1EA9SV003227','MD162FMJ R4130466','AK0J37E','AZUL','2025',1,246,0,1088),
 (47,55,407,'813ME1EAXSV003351','MD162FMJ R5201702','AK6I49E','AZUL','2025',1,235,0,1056),
 (48,55,395,'813ME1EA7SV003307','MD162FMJ R4130433','AK0J33E','NEGRO','2025',1,245,0,1087),
 (49,55,395,'813ME1EAXSV003379','MD162FMJ R5201669','AK0J34E','NEGRO','2025',1,258,0,1120),
 (50,55,395,'813ME1EA8SV003378','MD162FMJ R5201816','AK0J35E','NEGRO','2025',0,0,0,0);
INSERT INTO `seriales` (`idserial`,`idcompra`,`idarticulo`,`chasis`,`motor`,`placa`,`color`,`año`,`estatus`,`idventa`,`idapartado`,`iddetalleventa`) VALUES 
 (51,69,64,'L2YPCKLC3S0L03820','162FMJ25203820','AM6J88N','ROJO','2025',1,362,0,1549),
 (52,69,64,'L2YPCKLC8S0L02775','162FMJ25202775','AS4D90M','AZUL','2025',1,307,0,1295),
 (53,69,64,'L2YPCKLC1S0L02777','162FMJ25202777','AS4D89M','AZUL','2025',1,311,0,1309),
 (54,69,64,'L2YPCKLC9S0L03210','162FMJ25203210','AS4D99M','AZUL','2025',1,289,0,1235),
 (55,71,689,'8YKMB1EA6SV000253','DR162FMJ S4109667','AK3M01E','NEGRO','2025',0,0,0,0),
 (56,71,689,'8YKMB1EA6SV000267','DR162FMJ S4109587','AK3M02E','NEGRO','2025',0,0,0,0),
 (57,71,689,'8YKMB1EAXSV000353','DR162FMJ S4109579','AK3M03E','NEGRO','2025',1,340,0,1476),
 (58,71,689,'8YKMB1EA8SV000254','DR162FMJ S4109630','AK3M07E','ROJO','2025',1,356,0,1531),
 (59,71,689,'8YKMB1EA8SV000089','DR162FMJ S4109554','AK3M08E','ROJO','2025',0,0,0,0),
 (60,71,689,'8YKMB1EA7SV000102','DR162FMJ S4109454','AK3M09E','ROJO','2025',1,339,0,1475),
 (61,71,689,'8YKMB1EA9SV000067','DR162FMJ S4109528','AK3M10E','ROJO','2025',0,0,0,0);
INSERT INTO `seriales` (`idserial`,`idcompra`,`idarticulo`,`chasis`,`motor`,`placa`,`color`,`año`,`estatus`,`idventa`,`idapartado`,`iddetalleventa`) VALUES 
 (62,71,689,'8YKMB1EA2SV000346','DR162FMJ S4109732','AK3M04E','AZUL','2025',0,0,0,0),
 (63,71,689,'8YKMB1EA9SV000313','DR162FMJ S4109739','AK3M05E','AZUL','2025',0,0,0,0),
 (64,71,689,'8YKMB1EA6SV000334','DR162FMJ S4109563','AK3M06E','DORADA','2025',0,0,0,0),
 (65,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (66,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (67,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (68,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (69,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (70,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (71,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (72,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (73,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (74,71,399,NULL,NULL,NULL,NULL,NULL,0,0,0,0),
 (75,74,402,'8YW4H4G19SM000376','162FMJS5014064','AL3K89N','NEGRO','2025',0,0,0,0),
 (76,74,402,'8YW4H4G15SM000374','162FMJS5014111','AL3K87N','NEGRO','2025',1,342,0,1479),
 (77,74,402,'8YW4H4G1XSM000371','162FMJS5014126','AL3K84N','NEGRO','2025',1,343,0,1480);
INSERT INTO `seriales` (`idserial`,`idcompra`,`idarticulo`,`chasis`,`motor`,`placa`,`color`,`año`,`estatus`,`idventa`,`idapartado`,`iddetalleventa`) VALUES 
 (78,74,402,'8YW4H4G13SM000390','162FMJS5014173','AM5H98K','ROJO','2025',0,0,0,0),
 (79,74,402,'8YW2A4G11SM000030','157FMJ*AGS002365*','AS4J89M','NEGRO','2025',0,0,0,0),
 (80,74,402,'8YW2A4G13SM000207','157FMJ*AGS002535*','AS4I66M','NEGRO','2025',0,0,0,0),
 (81,74,402,'8YW4H4G17SM000215','162FMJS5014169','AE2B42J','ROJO','2025',1,351,0,1516),
 (82,74,402,'8YW4H4G19SM000040','162FMJS5013905','AK3I66M','ROJO','2025',0,0,0,0),
 (83,75,404,'813MG1EA8SV003333','MD162FMJ R5202073','AK0J29E','ROJO','2025',1,354,0,1527),
 (84,75,404,'813MG1EA8RV001551','MD162FMJ R5100313','AM2B21G','ROJO','2024',0,0,0,0),
 (85,75,404,'813MG1EA6RV002309','MD162FMJ R5100771','AG6V42R','ROJO','2024',0,0,0,0),
 (86,75,404,'813MG1EAXSV002801','MD162FMJ R5200775','AP8Y15D','ROJO','2025',0,0,0,0),
 (87,75,404,'813MG1EA4SV003099','MD162FMJ R44130157','AK4W13K','ROJO','2025',0,0,0,0),
 (88,75,404,'813MG1EA6SV003136','MD162FMJ R4130131','AK4W00K','ROJO','2025',0,0,0,0);
INSERT INTO `seriales` (`idserial`,`idcompra`,`idarticulo`,`chasis`,`motor`,`placa`,`color`,`año`,`estatus`,`idventa`,`idapartado`,`iddetalleventa`) VALUES 
 (89,75,404,'813MG1EA3SV003188','MD162FMJ R5202189','AK0J26E','ROJO','2025',0,0,0,0),
 (90,75,403,'813MG1EA3SV003336','MD162FMJ R5202152','AK0J18E','NEGRO','2025',0,0,0,0),
 (91,75,405,'813MG1EA4SV003457','MD162FMJ R4130066','AK6I40E','GRIS','2025',0,0,0,0),
 (92,75,405,'813MG1AE6RV002133','MD162FMJ R5100636','AG4N15R','GRIS','2024',0,0,0,0),
 (93,75,405,'813MG1EA4SV003443','MD162FMJ R4129923','AK6I29E','GRIS','2025',0,0,0,0),
 (94,79,720,'9FSNF42D9SC130097','157FMI-3*A6C104545','AS7I15M','NEGRO','2025',1,361,0,1548),
 (95,83,64,'65465465','654654654','505fr','azul','2025',0,0,0,0);
/*!40000 ALTER TABLE `seriales` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`sistema`
--

DROP TABLE IF EXISTS `sistema`;
CREATE TABLE `sistema` (
  `idempresa` int(11) DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechavence` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`sistema`
--

/*!40000 ALTER TABLE `sistema` DISABLE KEYS */;
INSERT INTO `sistema` (`idempresa`,`fechainicio`,`fechavence`) VALUES 
 (1,'2025-09-20','2026-09-20');
/*!40000 ALTER TABLE `sistema` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nivel` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT 'L',
  `img` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'avatar5.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svweb`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`nivel`,`img`) VALUES 
 (1,'Nks','Nks@gmail.com',NULL,'$2y$10$mnhllx62RCScWrHnJSacbe8AVrRHlWbbyMXMI7CC2p8o2L6Uvt9aC',NULL,'2023-03-11 08:34:38','2023-03-11 08:34:38','A','puerta.jpg'),
 (2,'gerencia','gerencia@gmail.com',NULL,'$2y$10$x80eF50.V9yP4IvxUCRnEebUdy7/Org3pIxlTTrdTvoolcE7xhCDC',NULL,'2023-03-30 23:41:50','2024-10-07 06:34:15','A','avatar.png'),
 (3,'Administracion','Administracion@gmail.com',NULL,'$2y$10$hBno6ZTHbGhmZ4MFSeQ3GONmAXB4xc6zQW1gY1g36vMxIP7bdbkPm',NULL,'2023-04-24 17:39:31','2023-04-24 17:39:31','A','avatar5.png'),
 (4,'caja3','caja3@gmail.com',NULL,'$2y$10$RwLfyxIUk8GJ7XowCc8dh.fi6HoY8kRJwtNyRIZekIJ3d87.LUGcu',NULL,'2023-04-24 17:53:40','2023-04-24 17:53:40','L','avatar5.png'),
 (5,'caja2','caja2@gmail.com',NULL,'$2y$10$nug8TJoG3o.f35ahugyHx.GhhDFlf2trUuP8qtSST15OjIQntNaPe',NULL,'2023-04-05 00:12:24','2023-04-05 00:12:24','L','avatar3.png'),
 (6,'caja','caja@gmail.com',NULL,'$2y$10$gh5DDTtXNo6U4yHteP3tz.YZc/8QlymPFFrSBotcRWXkSeK1nK2ke',NULL,'2023-04-04 23:51:34','2024-10-02 07:21:21','L','avatar2.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE `vendedores` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `comision` int(11) DEFAULT '0',
  `cedula` varchar(20) DEFAULT NULL,
  `tipo` varchar(2) DEFAULT 'V',
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`vendedores`
--

/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;


--
-- Table structure for table `svweb`.`venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `idvendedor` int(11) DEFAULT NULL,
  `tipo_comprobante` varchar(10) NOT NULL,
  `serie_comprobante` varchar(15) NOT NULL,
  `num_comprobante` int(11) NOT NULL,
  `flibre` int(11) DEFAULT '0',
  `control` varchar(10) DEFAULT NULL,
  `tasa` float(9,3) DEFAULT '0.000',
  `total_venta` float(11,2) NOT NULL,
  `base` float(9,3) DEFAULT '0.000',
  `total_iva` float(9,3) DEFAULT '0.000',
  `texe` float(9,3) DEFAULT '0.000',
  `descuento` double(15,3) DEFAULT '0.000',
  `total_pagar` float(9,3) DEFAULT '0.000',
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  `impuesto` int(11) NOT NULL,
  `saldo` float(11,2) NOT NULL,
  `mret` float(9,3) DEFAULT '0.000',
  `estado` varchar(10) NOT NULL,
  `devolu` int(11) NOT NULL,
  `comision` double(8,3) DEFAULT '0.000',
  `montocomision` float(9,3) DEFAULT NULL,
  `idcomision` int(11) DEFAULT '0',
  `user` varchar(15) NOT NULL,
  PRIMARY KEY (`idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svweb`.`venta`
--

/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
