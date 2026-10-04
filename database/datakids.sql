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
-- Create schema svwebkids
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ svwebkids;
USE svwebkids;

--
-- Table structure for table `svwebkids`.`agrupados`
--

DROP TABLE IF EXISTS `agrupados`;
CREATE TABLE `agrupados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idarticulo` int(11) DEFAULT NULL,
  `descripcion` varchar(10) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `utilidad` float(9,3) DEFAULT '0.000',
  `util2` float(9,3) DEFAULT '0.000',
  `precio2` float(9,3) DEFAULT NULL,
  `fraccion` float(9,3) DEFAULT '0.250',
  `precio1` float(9,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`agrupados`
--

/*!40000 ALTER TABLE `agrupados` DISABLE KEYS */;
/*!40000 ALTER TABLE `agrupados` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`ajustes`
--

DROP TABLE IF EXISTS `ajustes`;
CREATE TABLE `ajustes` (
  `idajuste` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(80) NOT NULL,
  `responsable` varchar(30) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `monto` float(11,2) NOT NULL,
  `estatus` int(3) DEFAULT '0',
  PRIMARY KEY (`idajuste`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`ajustes`
--

/*!40000 ALTER TABLE `ajustes` DISABLE KEYS */;
INSERT INTO `ajustes` (`idajuste`,`concepto`,`responsable`,`fecha_hora`,`monto`,`estatus`) VALUES 
 (1,'ZAPATO DE NIÑO','KELLY ANDRADE','2026-04-25 16:47:06',15.00,0),
 (2,'AJUSTE','LISETH CONTRERAS','2026-08-25 10:36:58',5.04,0);
/*!40000 ALTER TABLE `ajustes` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`apartado`
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`apartado`
--

/*!40000 ALTER TABLE `apartado` DISABLE KEYS */;
INSERT INTO `apartado` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`dias`,`incremento`,`total_pagar`,`recargo`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`obs`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`,`impor`) VALUES 
 (1,254,4,'APA','A',1,0,'00-',0.000,36.00,0.000,0.000,0.000,0.000,60,5,0.000,0.000,'2025-12-08 16:04:59','2025-12-08',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (2,4,2,'APA','A',2,0,'00-',0.000,17.50,0.000,0.000,0.000,0.000,60,5,0.000,0.000,'2025-12-08 16:26:50','2025-12-08',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (3,251,4,'APA','A',3,0,'00-',257.930,34.00,0.000,0.000,8769.620,0.000,60,5,0.000,0.000,'2025-12-09 09:25:24','2025-12-09',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (4,87,4,'APA','A',4,0,'00-',257.930,20.00,0.000,0.000,5158.600,0.000,60,5,0.000,0.000,'2025-12-09 09:26:32','2025-12-09',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (5,252,4,'APA','A',5,0,'00-',257.930,111.00,0.000,0.000,28630.230,0.000,60,5,0.000,0.000,'2025-12-09 09:27:59','2025-12-09',16,0.00,NULL,0.000,'Credito',1,0.000,0.000,0,'Administracion',0);
INSERT INTO `apartado` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`dias`,`incremento`,`total_pagar`,`recargo`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`obs`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`,`impor`) VALUES 
 (6,117,3,'APA','A',6,0,'00-',262.100,173.00,0.000,0.000,45343.301,0.000,60,5,0.000,0.000,'2025-12-10 19:13:03','2025-12-10',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (7,58,3,'APA','A',7,0,'00-',270.790,30.00,0.000,0.000,8123.700,0.000,60,5,0.000,0.000,'2025-12-13 17:40:02','2025-12-13',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (8,258,4,'APA','A',8,0,'00-',270.790,35.00,0.000,0.000,9477.650,0.000,60,5,0.000,0.000,'2025-12-14 10:17:28','2025-12-14',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (9,260,4,'APA','A',9,0,'00-',270.790,58.00,0.000,0.000,15705.820,0.000,60,5,0.000,0.000,'2025-12-14 12:30:42','2025-12-14',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (10,198,3,'APA','A',10,0,'00-',276.580,20.00,0.000,0.000,5531.590,0.000,60,5,0.000,0.000,'2025-12-17 15:59:04','2025-12-17',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1);
INSERT INTO `apartado` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`dias`,`incremento`,`total_pagar`,`recargo`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`obs`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`,`impor`) VALUES 
 (11,239,3,'APA','A',11,0,'00-',285.400,40.00,0.000,0.000,11415.990,0.000,60,5,0.000,0.000,'2025-12-20 14:01:27','2025-12-20',16,0.00,NULL,0.000,'Credito',1,0.000,0.000,0,'Administracion',0),
 (12,239,4,'APA','A',12,0,'00-',285.400,45.00,0.000,0.000,12843.000,0.000,60,5,0.000,0.000,'2025-12-20 14:11:00','2025-12-20',16,0.00,NULL,0.000,'Credito',1,0.000,0.000,0,'Administracion',0),
 (13,4,4,'APA','A',13,0,'00-',285.400,4.00,0.000,0.000,1141.600,0.000,60,5,0.000,0.000,'2025-12-20 16:55:02','2025-12-20',16,0.00,NULL,0.000,'Contado',1,0.000,0.000,0,'Administracion',0),
 (14,236,3,'APA','A',14,0,'00-',285.400,7.00,0.000,0.000,1997.790,0.000,60,5,0.000,0.000,'2025-12-20 18:57:09','2025-12-20',16,0.00,NULL,0.000,'Credito',1,0.000,0.000,0,'Administracion',0),
 (15,236,3,'APA','A',15,0,'00-',285.400,7.00,0.000,0.000,1997.790,0.000,60,5,0.000,0.000,'2025-12-20 18:59:47','2025-12-20',16,0.00,NULL,0.000,'Credito',1,0.000,0.000,0,'Administracion',0);
INSERT INTO `apartado` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`dias`,`incremento`,`total_pagar`,`recargo`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`obs`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`,`impor`) VALUES 
 (16,239,3,'APA','A',16,0,'00-',285.400,35.00,0.000,0.000,9988.990,0.000,60,5,0.000,0.000,'2025-12-20 19:44:03','2025-12-20',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (17,295,4,'APA','A',17,0,'00-',355.550,15.00,0.000,0.000,5333.250,0.000,60,5,0.000,0.000,'2026-01-24 11:36:24','2026-01-24',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (18,299,4,'APA','A',18,0,'00-',396.370,25.00,0.000,0.000,9909.250,0.000,60,5,0.000,0.000,'2026-02-18 14:07:58','2026-02-18',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (19,239,4,'APA','A',19,0,'00-',473.870,15.00,0.000,0.000,7108.050,0.000,60,5,0.000,0.000,'2026-03-31 16:06:14','2026-03-31',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (20,312,3,'APA','A',20,0,'00-',478.580,7.00,0.000,0.000,3350.060,0.000,60,5,0.000,0.000,'2026-04-15 14:27:02','2026-04-15',16,0.00,NULL,0.000,'Credito',1,0.000,0.000,0,'Administracion',0);
INSERT INTO `apartado` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`dias`,`incremento`,`total_pagar`,`recargo`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`obs`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`,`impor`) VALUES 
 (21,38,4,'APA','A',21,0,'00-',483.870,15.00,0.000,0.000,7258.050,0.000,60,5,0.000,0.000,'2026-04-24 09:37:56','2026-04-24',16,0.00,NULL,0.000,'Credito',1,0.000,0.000,0,'Administracion',0),
 (22,38,4,'APA','A',22,0,'00-',483.870,18.00,0.000,0.000,8709.660,0.000,60,5,0.000,0.000,'2026-04-24 09:42:49','2026-04-24',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (23,233,3,'APA','A',23,0,'00-',640.000,4.00,0.000,0.000,2560.000,0.000,60,5,0.000,0.000,'2026-04-29 17:14:37','2026-04-29',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (24,321,3,'APA','A',24,0,'00-',520.910,25.00,0.000,0.000,13022.750,0.000,60,5,0.000,0.000,'2026-05-20 17:00:07','2026-05-20',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (25,2,4,'APA','A',25,0,'00-',577.550,10.00,0.000,0.000,5775.500,0.000,60,5,0.000,0.000,'2026-06-12 13:50:08','2026-06-12',16,10.00,NULL,0.000,'Contado',0,0.000,0.000,0,'Administracion',1);
INSERT INTO `apartado` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`dias`,`incremento`,`total_pagar`,`recargo`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`obs`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`,`impor`) VALUES 
 (26,38,4,'APA','A',26,0,'00-',602.330,12.00,0.000,0.000,7227.960,0.000,60,5,0.000,0.000,'2026-06-18 15:59:44','2026-06-18',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (27,329,6,'APA','A',27,0,'00-',652.970,35.00,0.000,0.000,22853.949,0.000,60,5,0.000,0.000,'2026-07-03 09:41:23','2026-07-03',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (28,341,3,'APA','A',28,0,'00-',725.750,20.00,0.000,0.000,14515.000,0.000,60,5,0.000,0.000,'2026-07-15 17:25:06','2026-07-15',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (29,237,3,'APA','A',29,0,'00-',748.790,23.00,0.000,0.000,17222.170,0.000,60,5,0.000,0.000,'2026-08-01 10:36:16','2026-08-01',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',0),
 (30,347,3,'APA','A',30,0,'00-',755.900,20.00,0.000,0.000,15118.000,0.000,60,5,0.000,0.000,'2026-08-06 10:00:08','2026-08-06',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1);
INSERT INTO `apartado` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`dias`,`incremento`,`total_pagar`,`recargo`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`obs`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`,`impor`) VALUES 
 (31,213,3,'APA','A',31,0,'00-',756.710,20.00,0.000,0.000,15134.200,0.000,60,5,0.000,0.000,'2026-08-08 09:17:56','2026-08-08',16,0.00,NULL,0.000,'Credito',1,0.000,0.000,0,'Administracion',0),
 (32,348,3,'APA','A',32,0,'00-',761.220,50.00,0.000,0.000,38061.000,0.000,60,5,0.000,0.000,'2026-08-12 11:45:14','2026-08-12',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1),
 (33,224,3,'APA','A',33,0,'00-',855.620,20.00,0.000,0.000,17112.400,0.000,60,5,0.000,0.000,'2026-09-25 17:48:36','2026-09-25',16,0.00,NULL,0.000,'Credito',0,0.000,0.000,0,'Administracion',1);
/*!40000 ALTER TABLE `apartado` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `idarticulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `codweb` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `stock` double(9,3) NOT NULL,
  `apartado` float(9,3) DEFAULT '0.000',
  `descripcion` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `unidad` varchar(5) CHARACTER SET utf8mb4 DEFAULT NULL,
  `cntxund` int(11) DEFAULT '1',
  `cntgrupo` int(11) DEFAULT '1',
  `usagrupo` int(5) DEFAULT '0',
  `fraccion` float(9,3) NOT NULL DEFAULT '1.000',
  `comi` int(11) DEFAULT '0',
  `pcomision` float(9,3) DEFAULT NULL,
  `volumen` float(9,3) DEFAULT '0.000',
  `grados` float(9,3) DEFAULT '0.000',
  `peso` double(9,3) DEFAULT '0.000',
  `minimo` float(9,3) DEFAULT NULL,
  `vence` tinyint(4) DEFAULT NULL,
  `showlista` int(11) DEFAULT '1',
  `oferta` int(11) DEFAULT '0',
  `imagen` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'ninguna.jpg',
  `estado` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `utilidad` double(9,2) NOT NULL,
  `precio1` double(9,2) NOT NULL,
  `precio2` double(9,2) NOT NULL,
  `precio_t` double(18,3) DEFAULT NULL,
  `util2` double(9,3) NOT NULL,
  `precio3` float(12,3) DEFAULT '0.000',
  `util3` float(9,3) DEFAULT '0.000',
  `utilvip` float(9,3) DEFAULT '0.000',
  `pvip` float(12,3) DEFAULT '0.000',
  `costo` double(9,3) NOT NULL,
  `costo_t` double(9,3) NOT NULL DEFAULT '0.000',
  `iva` int(11) NOT NULL,
  `serial` int(11) DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idarticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svwebkids`.`articulos`
--

/*!40000 ALTER TABLE `articulos` DISABLE KEYS */;
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (1,1,'01',NULL,'MEDIAS CON LAZO',8.000,-1.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',31.00,4.00,4.44,610.451,357.849,2.996,261.000,0.000,0.000,0.970,169.100,0,0,NULL,'2025-11-13 13:32:08','2025-12-17 15:37:54'),
 (2,1,'02',NULL,'TRAJE DE BAÑO ENTERIZO NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',65.00,12.00,13.32,9404.356,83.518,18.150,150.000,0.000,0.000,7.260,5699.610,0,0,NULL,'2025-11-13 13:41:57','2026-08-25 11:47:21'),
 (3,1,'03',NULL,'CINTILLO DE TELA BEBE',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',34.00,4.00,4.44,406.179,399.004,0.890,12.000,0.000,0.000,0.890,181.330,0,0,NULL,'2025-11-13 13:43:57','2025-12-10 19:28:07'),
 (4,1,'04',NULL,'CINTILLO MINNIE',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,2.00,2.22,407.480,122.057,1.000,100.000,0.000,0.000,1.000,203.740,0,0,NULL,'2025-11-13 13:45:00','2026-05-14 09:52:42');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (5,5,'05',NULL,'CONJUNTOS DE FALDA NIÑA SHEIN',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',38.00,35.00,38.86,27409.933,53.597,45.540,80.000,0.000,0.000,25.300,19862.270,0,0,NULL,'2025-11-13 13:46:40','2026-08-25 11:46:14'),
 (6,1,'06',NULL,'CONJUNTOS NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',33.00,20.00,22.21,7907.582,48.038,17.250,15.000,0.000,0.000,15.000,5945.550,0,0,NULL,'2025-11-13 13:47:52','2026-02-18 11:46:45'),
 (7,5,'07',NULL,'OSO DE PELUCHE',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',11.00,6.00,6.66,810.067,137.918,3.976,42.000,0.000,0.000,2.800,570.470,0,0,NULL,'2025-11-13 13:49:02','2025-12-10 19:32:10'),
 (8,2,'08',NULL,'GORRA DE NIÑO CON DETALLES',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,10.00,11.10,2037.400,122.057,10.000,100.000,0.000,0.000,5.000,1018.700,0,0,NULL,'2025-11-13 13:50:12','2025-12-10 19:32:40');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (9,1,'09',NULL,'GORRA DE NIÑA SENCILLA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',20.00,3.00,3.33,407.480,233.085,2.000,100.000,0.000,0.000,1.000,203.740,0,0,NULL,'2025-11-13 13:51:18','2025-12-10 19:33:19'),
 (10,5,'10',NULL,'LLAVERO DE MUÑECO',7.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,2.00,2.22,407.480,122.057,2.000,100.000,0.000,0.000,1.000,203.740,0,0,NULL,'2025-11-13 13:51:46','2025-12-10 19:33:42'),
 (11,2,'11',NULL,'MORRAL ESCOLAR AZUL',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,12.00,13.32,2444.880,66.543,12.000,50.000,0.000,0.000,8.000,1629.920,0,0,NULL,'2025-11-13 13:52:18','2025-12-10 19:34:02'),
 (12,5,'12',NULL,'LENTES DE NIÑO/NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',23.00,5.00,5.55,812.923,270.095,3.990,166.000,0.000,0.000,1.500,305.610,0,0,NULL,'2025-11-13 13:53:17','2025-12-10 19:34:32');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (13,1,'13',NULL,'MEDIAS DE LAZO NIÑA',10.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',11.00,5.00,5.55,1029.536,137.240,4.680,100.000,0.000,0.000,2.340,927.510,0,0,NULL,'2025-11-13 13:54:26','2026-02-18 11:47:23'),
 (14,2,'14',NULL,'PANTALON DE NIÑO/ROCA',20.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',91.00,20.00,22.21,5707.347,112.089,13.506,29.000,0.000,0.000,10.470,2988.140,0,0,NULL,'2025-11-13 13:54:58','2025-12-22 12:02:09'),
 (15,1,'15',NULL,'PANTALON DE NIÑA/ROCA',38.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',23.00,20.00,22.21,5665.823,37.582,24.210,50.000,0.000,0.000,16.140,4606.360,0,0,NULL,'2025-11-13 13:55:43','2025-12-22 12:02:33'),
 (16,1,'16',NULL,'SHORT DE NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,10.00,11.10,2037.400,122.057,10.000,100.000,0.000,0.000,5.000,1018.700,0,0,NULL,'2025-11-13 13:56:17','2025-12-10 19:42:37');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (17,1,'17',NULL,'LICRA DE NIÑA',13.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',66.00,5.00,5.55,1014.625,85.047,4.980,66.000,0.000,0.000,3.000,611.220,0,0,NULL,'2025-11-13 13:56:56','2025-12-10 19:43:16'),
 (18,1,'18',NULL,'FRANELA DE NIÑA ECONOMICA',9.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',13.00,7.00,7.77,1014.625,159.066,4.980,66.000,0.000,0.000,3.000,611.220,0,0,NULL,'2025-11-13 13:59:49','2026-04-15 14:05:36'),
 (19,1,'19',NULL,'FRANELAS DE NIÑA DE SHEIN',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,10.00,11.10,2037.400,122.057,10.000,100.000,0.000,0.000,5.000,1018.700,0,0,NULL,'2025-11-13 14:08:15','2025-12-10 19:45:26'),
 (20,1,'20',NULL,'VESTIDO DE NIÑA SENCILLO',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',71.00,13.00,14.43,2028.430,89.917,9.956,31.000,0.000,0.000,7.600,1548.420,0,0,NULL,'2025-11-13 14:08:47','2025-12-10 19:45:48');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (21,5,'21',NULL,'CHAQUETA  JEANS NIÑO/NIÑA',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',87.00,15.00,16.65,3047.950,108.178,14.960,87.000,0.000,0.000,8.000,1629.920,0,0,NULL,'2025-11-13 14:09:46','2025-12-10 19:46:11'),
 (22,1,'22',NULL,'CONJUNTO DE NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',81.00,20.00,22.21,4056.463,101.870,19.910,81.000,0.000,0.000,11.000,2241.140,0,0,NULL,'2025-11-13 14:10:25','2025-12-10 19:46:51'),
 (23,1,'23',NULL,'BLUSA DE NIÑA SHEIN',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,12.00,13.32,2444.880,66.543,12.000,50.000,0.000,0.000,8.000,1629.920,0,0,NULL,'2025-11-13 14:11:01','2025-12-10 19:48:38'),
 (24,4,'24',NULL,'PIJAMA DE NIÑA',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',48.00,15.00,16.65,5924.943,64.894,20.200,100.000,0.000,0.000,10.100,4003.340,0,0,NULL,'2025-11-13 14:11:45','2026-04-24 14:32:34');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (25,3,'25',NULL,'BODY DE NIÑO SHEIN',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,10.00,11.10,2037.400,122.057,10.000,100.000,0.000,0.000,5.000,1018.700,0,0,NULL,'2025-11-13 14:12:31','2025-12-10 20:03:56'),
 (26,2,'26',NULL,'ZAPATO DE NIÑO',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',61.00,25.00,27.76,14175.599,78.963,26.522,71.000,0.000,0.000,15.510,8804.720,0,0,NULL,'2025-11-13 14:13:29','2026-06-08 15:49:23'),
 (27,2,'27',NULL,'CONJUNTO PANTALON NIÑO A',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',72.00,20.00,22.21,4065.014,91.428,19.952,72.000,0.000,0.000,11.600,2363.380,0,0,NULL,'2025-11-13 14:14:13','2025-12-10 20:05:36'),
 (28,2,'28',NULL,'CONJUNTO DE PANTALON DE NIÑO AA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',96.00,15.00,16.65,3042.900,118.560,14.935,96.000,0.000,0.000,7.620,1552.500,0,0,NULL,'2025-11-13 14:15:57','2025-12-10 20:07:52');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (29,1,'29',NULL,'TRAJE DE BAÑO NIÑO',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',92.00,15.00,16.65,3047.290,113.790,14.957,92.000,0.000,0.000,7.790,1587.130,0,0,NULL,'2025-11-13 14:16:31','2025-12-10 20:08:18'),
 (30,2,'30',NULL,'LAZOS GRANDES NIÑA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,2.00,2.22,436.007,122.057,1.660,66.000,0.000,0.000,1.000,396.370,0,0,NULL,'2025-11-13 14:17:36','2026-02-18 11:47:55'),
 (31,1,'31',NULL,'CONJUNTOS DE NIÑA GRUESOS',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',29.00,25.00,27.76,9837.746,44.268,35.594,85.000,0.000,0.000,19.240,7626.160,0,0,NULL,'2025-11-13 14:18:11','2026-02-18 11:47:06'),
 (32,2,'32',NULL,'SUETER DE NIÑO/ROCA',11.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',79.00,12.00,13.32,2443.457,98.857,11.993,79.000,0.000,0.000,6.700,1365.060,0,0,NULL,'2025-11-13 14:19:02','2025-12-10 20:10:24');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (33,2,'33',NULL,'CHEMISE DE NIÑO/ROCA',33.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',66.00,15.00,16.65,2645.762,85.047,12.986,51.000,0.000,0.000,9.000,1752.160,0,0,NULL,'2025-11-13 14:19:44','2025-12-10 20:13:01'),
 (34,2,'34',NULL,'CAMISA DE NIÑO/ROCA',33.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',63.00,15.00,16.65,3055.288,81.025,14.996,63.000,0.000,0.000,9.200,1874.410,0,0,NULL,'2025-11-13 14:21:00','2025-12-10 20:14:05'),
 (35,4,'35',NULL,'LAZOS PEQUEÑOS DE BEBE',6.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',61.00,1.00,1.11,203.633,693.060,1.000,614.000,0.000,0.000,0.140,28.520,0,0,NULL,'2025-11-13 14:21:47','2025-12-10 20:14:35'),
 (36,1,'36',NULL,'BLUSA DE NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',16.00,15.00,16.65,3528.701,197.398,14.224,154.000,0.000,0.000,5.600,3179.010,0,0,NULL,'2025-11-13 14:22:15','2026-09-29 16:35:30');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (37,2,'37',NULL,'FRANELA BARATA NIÑO',8.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',66.00,5.00,5.55,1014.625,85.047,4.980,66.000,0.000,0.000,3.000,611.220,0,0,NULL,'2025-11-13 14:22:57','2025-12-10 20:15:48'),
 (38,1,'38',NULL,'PALAZO DE NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',14.00,12.00,13.32,2444.880,166.468,12.000,140.000,0.000,0.000,5.000,1018.700,0,0,NULL,'2025-11-13 14:23:27','2025-12-10 20:16:13'),
 (39,2,'39',NULL,'BOTAS VAQUERA NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',55.00,30.00,33.31,16990.945,72.494,38.620,100.000,0.000,0.000,19.310,10961.900,0,0,NULL,'2025-11-13 14:24:12','2026-06-08 15:49:43'),
 (40,1,'40',NULL,'VESTIDO ELEGANTE NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',49.00,22.00,24.43,13627.436,66.391,28.479,94.000,0.000,0.000,14.680,9145.930,0,0,NULL,'2025-11-24 14:08:18','2026-07-01 18:39:35');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (41,1,'41',NULL,'CONJUNTOS VARIADOS DE NIÑA SHEIN',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',40.00,20.00,22.21,6392.131,55.502,26.989,89.000,0.000,0.000,14.280,3382.080,0,0,NULL,'2025-11-25 12:04:12','2025-12-12 12:29:43'),
 (42,1,'42',NULL,'CONJUNTO DE NIÑA SHEIN',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',51.00,16.00,17.76,9034.859,68.544,17.391,65.000,0.000,0.000,10.540,5983.350,0,0,NULL,'2025-11-25 12:04:57','2026-06-08 15:48:33'),
 (43,1,'43',NULL,'CARTERA DE NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',63.00,8.00,8.88,6244.758,82.014,8.833,81.000,0.000,0.000,4.880,3831.140,0,0,NULL,'2025-11-25 12:05:39','2026-08-25 11:47:54'),
 (44,1,'44',NULL,'CONJUNTOS ADOLESCENTES NIÑA SHEIN',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',57.00,45.00,49.96,10597.406,75.308,44.745,57.000,0.000,0.000,28.500,6749.940,0,0,NULL,'2025-11-25 12:06:31','2025-11-25 12:47:23');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (45,1,'45',NULL,'CONJUNTO DE NIÑA CASUAL',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',51.00,20.00,22.21,15648.009,68.225,26.004,97.000,0.000,0.000,13.200,10362.920,0,0,NULL,'2025-11-25 12:07:18','2026-08-25 11:46:50'),
 (46,1,'46',NULL,'CAMISETAS Y SUETER BASICO NIÑA SHEIN',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',55.00,12.00,13.32,4012.074,73.031,16.940,120.000,0.000,0.000,7.700,1823.670,0,0,NULL,'2025-11-25 12:08:22','2025-12-10 20:35:50'),
 (47,1,'47',NULL,'CONJUNTOS DE NIÑA SHEIN',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',25.00,25.00,27.76,8040.473,38.994,33.949,70.000,0.000,0.000,19.970,4729.690,0,0,NULL,'2025-11-25 12:09:05','2025-12-10 20:36:50'),
 (48,1,'48',NULL,'CONJUNTOS DE FALDA NIÑA SHEIN',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',13.00,35.00,38.86,11128.241,26.538,46.986,53.000,0.000,0.000,30.710,7273.360,0,0,NULL,'2025-11-25 12:09:49','2026-04-24 15:51:14');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (49,1,'49',NULL,'VESTIDOS Y CONJUNTOS DE NIÑA SHEIN',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',26.00,30.00,33.31,9670.838,40.306,40.833,72.000,0.000,0.000,23.740,5622.580,0,0,NULL,'2025-11-25 12:10:46','2025-12-11 14:31:21'),
 (50,2,'50',NULL,'CONJUNTOS DE DOS PIEZAS NIÑO SHEIN',6.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',41.00,18.00,19.99,5895.425,57.363,24.892,96.000,0.000,0.000,12.700,3007.870,0,0,NULL,'2025-11-25 12:11:49','2025-12-12 10:11:28'),
 (51,1,'51',NULL,'JUGUETE DE BEBE',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',57.00,14.00,15.54,10969.778,74.652,15.041,69.000,0.000,0.000,8.900,6987.120,0,0,NULL,'2025-11-25 12:12:34','2026-08-25 11:48:04'),
 (52,2,'52',NULL,'CONJUNTOS DE SET NIÑO SHEIN',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',27.00,25.00,27.76,8030.764,41.618,33.908,73.000,0.000,0.000,19.600,4642.060,0,0,NULL,'2025-11-25 12:14:20','2025-12-10 20:41:05');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (53,2,'53',NULL,'CONJUNTOS Y VARIADOS NIÑO',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',44.00,15.00,16.65,4729.229,60.137,19.968,92.000,0.000,0.000,10.400,2463.140,0,0,NULL,'2025-11-25 12:15:03','2026-04-21 09:47:15'),
 (54,3,'54',NULL,'CONJUNTO DE NIÑO Y BEBE SHEIN',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',32.00,23.00,25.54,7305.903,47.355,30.847,78.000,0.000,0.000,17.330,4104.440,0,0,NULL,'2025-11-25 12:15:51','2026-03-24 13:53:48'),
 (55,1,'55',NULL,'LAZOS DE NIÑA',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',177.00,1.50,1.67,354.255,208.412,1.496,177.000,0.000,0.000,0.540,127.890,0,0,NULL,'2025-11-27 16:10:21','2025-12-10 20:43:35'),
 (56,5,'56',NULL,'KIT DE BEBE NIÑO Y NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',61.00,10.00,11.10,3186.450,79.078,13.454,117.000,0.000,0.000,6.200,1468.410,0,0,NULL,'2025-11-27 16:11:24','2025-12-13 14:53:12');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (57,2,'57',NULL,'CONJ. NIÑO SHEIN',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',12.00,17.00,18.87,6359.362,24.422,26.851,77.000,0.000,0.000,15.170,3592.860,0,0,NULL,'2025-11-27 16:12:24','2026-05-06 16:22:15'),
 (58,5,'58',NULL,'LENTES DE NIÑO, NIÑA SHEIN',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',12.00,5.00,5.55,1656.939,152.337,6.996,218.000,0.000,0.000,2.200,521.050,0,0,NULL,'2025-11-27 16:14:01','2025-12-10 20:44:43'),
 (59,6,'59',NULL,'ACCESORIOS BEBE NIÑO Y NIÑA',10.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',92.00,7.00,7.77,2362.154,113.516,9.974,174.000,0.000,0.000,3.640,862.100,0,0,NULL,'2025-11-27 16:20:12','2025-12-10 20:45:01'),
 (60,1,'60',NULL,'CONJUNTO NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',52.00,13.00,14.43,7334.426,69.808,16.745,97.000,0.000,0.000,8.500,4825.280,0,0,NULL,'2025-11-27 16:21:41','2026-06-08 15:50:38');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (61,5,'61',NULL,'ZAPATOS DE NIÑA Y NIÑO',6.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',49.00,20.00,22.21,6382.089,66.459,26.947,102.000,0.000,0.000,13.340,3159.450,0,0,NULL,'2025-11-27 16:22:28','2026-06-08 14:52:10'),
 (62,6,'62',NULL,'TRAJE DE BAÑO CON SHORT NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',54.00,20.00,22.21,15680.834,71.208,22.308,72.000,0.000,0.000,12.970,10182.360,0,0,NULL,'2025-11-27 16:23:11','2026-08-25 11:47:11'),
 (63,1,'63',NULL,'CINTILLO DE PERLAS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',78.00,5.00,5.55,3912.796,98.265,5.152,84.000,0.000,0.000,2.800,2198.200,0,0,NULL,'2025-11-27 16:24:30','2026-08-25 11:47:32'),
 (64,3,'64',NULL,'PLATO DE PLASTICO BEBE',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',57.00,15.00,16.65,4727.204,74.390,19.959,109.000,0.000,0.000,9.550,2261.820,0,0,NULL,'2025-11-27 16:25:32','2025-12-10 20:47:56');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (65,1,'65',NULL,'MEDIAS CON LAZO BEBE',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',81.00,4.00,4.44,943.101,101.870,3.982,81.000,0.000,0.000,2.200,521.050,0,0,NULL,'2025-11-27 16:26:46','2025-12-10 20:48:26'),
 (66,6,'66',NULL,'MEDIAS CON PLANTA DE SILICON',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',13.00,10.00,11.10,2834.981,164.353,11.970,185.000,0.000,0.000,4.200,994.730,0,0,NULL,'2025-11-27 16:27:29','2025-12-10 20:49:53'),
 (67,1,'67',NULL,'BODY DE BEBE NIÑA',15.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',66.00,10.00,11.10,3197.340,85.047,13.500,125.000,0.000,0.000,6.000,1421.040,0,0,NULL,'2025-12-01 19:03:04','2025-12-10 20:50:19'),
 (68,1,'68',NULL,'ENTERIZOS DE BEBE NIÑA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',62.00,13.00,14.43,4130.490,80.421,17.440,118.000,0.000,0.000,8.000,1894.720,0,0,NULL,'2025-12-01 19:03:37','2025-12-10 20:53:11');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (69,1,'69',NULL,'FRANELA DE NIÑA BEBE',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',15.00,10.00,11.10,3192.603,177.571,13.480,237.000,0.000,0.000,4.000,947.360,0,0,NULL,'2025-12-01 19:04:31','2025-12-10 20:53:23'),
 (70,1,'70',NULL,'COBIJAS',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',41.00,17.00,18.87,5428.373,57.290,22.920,91.000,0.000,0.000,12.000,2842.080,0,0,NULL,'2025-12-01 19:05:12','2025-12-10 20:53:41'),
 (71,1,'71',NULL,'FALDA NIÑA Y VARIADOS',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',97.00,18.00,19.99,10210.352,118.895,20.816,128.000,0.000,0.000,9.130,5182.920,0,0,NULL,'2025-12-01 19:06:31','2026-06-08 15:48:19'),
 (72,1,'72',NULL,'SUETER DE NIÑA GRUESO',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,15.00,16.65,4736.800,66.543,20.000,100.000,0.000,0.000,10.000,2368.400,0,0,NULL,'2025-12-01 19:07:58','2025-12-15 11:43:24');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (73,1,'73',NULL,'PAÑAL DE TELA NIÑA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,6.00,6.66,1889.983,122.057,7.980,166.000,0.000,0.000,3.000,710.520,0,0,NULL,'2025-12-01 19:09:05','2025-12-10 20:54:36'),
 (74,1,'74',NULL,'MEDIAS DE BEBE NIÑA',14.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',100.00,4.00,4.44,947.360,122.057,4.000,100.000,0.000,0.000,2.000,473.680,0,0,NULL,'2025-12-01 19:09:39','2025-12-10 20:55:21'),
 (75,1,'75',NULL,'ZAPATOS DE NIÑA BEBE',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',15.00,15.00,16.65,4732.063,177.571,19.980,233.000,0.000,0.000,6.000,1421.040,0,0,NULL,'2025-12-01 19:12:14','2025-12-13 14:51:37'),
 (76,1,'76',NULL,'BABEROS NIÑA',12.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,2.00,2.22,710.520,122.057,3.000,200.000,0.000,0.000,1.000,236.840,0,0,NULL,'2025-12-01 19:12:40','2025-12-10 20:56:24');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (77,1,'77',NULL,'SET DE BABERO Y MEDIAS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,6.00,6.66,1889.983,122.057,7.980,166.000,0.000,0.000,3.000,710.520,0,0,NULL,'2025-12-01 19:13:19','2025-12-10 20:56:47'),
 (78,1,'78',NULL,'CINTILLO DE TELA BEBE',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,3.00,3.33,947.360,66.543,4.000,100.000,0.000,0.000,2.000,473.680,0,0,NULL,'2025-12-01 19:13:57','2025-12-10 20:57:10'),
 (79,1,'79',NULL,'LAZO POR PAR BEBE NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,1.00,1.11,355.260,122.057,1.500,200.000,0.000,0.000,0.500,118.420,0,0,NULL,'2025-12-01 19:14:36','2025-12-10 20:57:52'),
 (80,1,'80',NULL,'PAÑALERA GRIS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,30.00,33.31,9473.600,66.543,40.000,100.000,0.000,0.000,20.000,4736.800,0,0,NULL,'2025-12-01 19:15:32','2025-12-10 20:58:10');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (81,1,'81',NULL,'CINTA DE CHUPON',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,2.00,2.22,710.520,122.057,3.000,200.000,0.000,0.000,1.000,236.840,0,0,NULL,'2025-12-01 19:16:14','2025-12-10 20:58:35'),
 (82,1,'82',NULL,'CHUPA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',300.00,4.00,4.44,947.360,344.114,4.000,300.000,0.000,0.000,1.000,236.840,0,0,NULL,'2025-12-01 19:17:27','2025-12-10 20:58:58'),
 (83,1,'83',NULL,'SET DE CHUPAS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',15.00,5.00,5.55,1657.880,177.571,7.000,250.000,0.000,0.000,2.000,473.680,0,1,NULL,'2025-12-01 19:17:59','2025-12-10 20:59:18'),
 (84,1,'84',NULL,'CEPILLO LIMPIA TETEROS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',13.00,7.00,7.77,2245.243,159.066,9.480,216.000,0.000,0.000,3.000,710.520,0,0,NULL,'2025-12-01 19:18:46','2025-12-10 20:59:46');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (85,1,'85',NULL,'TETERO PHILIPS GRANDE',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,18.00,19.99,5684.160,66.543,24.000,100.000,0.000,0.000,12.000,2842.080,0,0,NULL,'2025-12-01 19:19:31','2025-12-10 21:00:26'),
 (86,1,'86',NULL,'TETERO PHILIPS PEQUEÑO',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,15.00,16.65,4736.800,66.543,20.000,100.000,0.000,0.000,10.000,2368.400,0,0,NULL,'2025-12-01 19:20:04','2025-12-10 21:00:49'),
 (87,1,'87',NULL,'MONO DE NIÑA BEBE',18.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',66.00,10.00,11.10,3197.340,85.047,13.500,125.000,0.000,0.000,6.000,1421.040,0,0,NULL,'2025-12-01 19:20:40','2025-12-10 21:01:10'),
 (88,1,'88',NULL,'CONJUNTO DE NIÑA BEBE SENCILLO',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,15.00,16.65,4736.800,66.543,20.000,100.000,0.000,0.000,10.000,2368.400,0,0,NULL,'2025-12-01 19:21:58','2025-12-10 21:01:28');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (89,1,'89',NULL,'CONJUNTO DE NIÑA BEBE PERU',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',53.00,20.00,22.21,6373.364,70.813,26.910,107.000,0.000,0.000,13.000,3078.920,0,0,NULL,'2025-12-01 19:23:40','2025-12-10 21:01:46'),
 (90,1,'90',NULL,'SET DE LIMPIEZA JOHNSONS BABY',0.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,16.00,17.79,5077.850,122.345,21.440,168.000,0.000,0.000,8.000,1894.720,0,0,NULL,'2025-12-01 19:24:40','2025-12-10 21:02:17'),
 (91,1,'91',NULL,'CONJUNTO VESTIDO DE BEBE NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,15.00,16.65,4736.800,66.543,20.000,100.000,0.000,0.000,10.000,2368.400,0,0,NULL,'2025-12-01 19:25:43','2025-12-10 21:02:37'),
 (92,1,'92',NULL,'CAJAS DE BEBE NIÑA',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,30.00,33.31,9473.600,66.543,40.000,100.000,0.000,0.000,20.000,4736.800,0,0,NULL,'2025-12-01 19:26:26','2026-09-10 10:09:50');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (93,1,'93',NULL,'BLUSITAS DE NIÑA',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',58.00,13.00,14.43,4136.652,76.021,17.466,113.000,0.000,0.000,8.200,1942.090,0,0,NULL,'2025-12-01 19:29:33','2025-12-10 21:04:20'),
 (94,1,'94',NULL,'CAMISETAS DE NIÑA',8.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',85.00,10.00,11.10,3197.350,105.608,13.500,150.000,0.000,0.000,5.400,1278.940,0,0,NULL,'2025-12-01 19:30:48','2026-03-27 13:57:17'),
 (95,1,'95',NULL,'BLUSA TEJIDA DE NIÑA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,15.00,16.65,4736.800,66.543,20.000,100.000,0.000,0.000,10.000,2368.400,0,0,NULL,'2025-12-01 19:32:09','2025-12-10 21:04:59'),
 (96,1,'96',NULL,'CONJUNTOS Y VESTIDOS NIÑA SHEIN',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',57.00,20.00,22.21,15616.539,75.262,23.059,82.000,0.000,0.000,12.670,9946.840,0,0,NULL,'2025-12-01 19:33:03','2026-08-25 11:48:55');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (97,1,'97',NULL,'VARIEDAD EN BLUSITAS Y SUETERS NIÑA',7.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',38.00,18.00,19.99,5665.213,53.732,23.920,84.000,0.000,0.000,13.000,3078.920,0,0,NULL,'2025-12-01 19:33:53','2025-12-10 21:05:49'),
 (98,1,'98',NULL,'CONJUNTOS NIÑO',0.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',28.00,23.00,26.11,7334.231,45.892,30.967,73.000,0.000,0.000,17.900,4239.440,0,0,NULL,'2025-12-01 19:34:37','2025-12-10 21:06:08'),
 (99,2,'99',NULL,'CONJUNTOS DE BRAGA NIÑO',3.000,-1.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',34.00,20.00,22.21,6365.897,49.533,26.878,81.000,0.000,0.000,14.850,3517.070,0,0,NULL,'2025-12-01 19:39:53','2025-12-10 21:06:34'),
 (100,2,'100',NULL,'CONJUNTOS DE BERMUDA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',28.00,20.00,22.21,6363.037,42.162,26.866,72.000,0.000,0.000,15.620,3699.440,0,0,NULL,'2025-12-01 19:41:43','2026-04-24 16:01:20');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (101,1,'101',NULL,'SUETER Y CONJ. DE NIÑO',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',39.00,17.00,18.87,5432.166,54.712,22.936,88.000,0.000,0.000,12.200,2889.450,0,0,NULL,'2025-12-01 19:43:49','2025-12-17 18:21:04'),
 (102,1,'102',NULL,'BODY Y CONJ. SHEIN',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',51.00,12.00,13.32,3779.501,68.651,15.958,102.000,0.000,0.000,7.900,1871.040,0,0,NULL,'2025-12-01 19:45:34','2026-04-24 10:15:53'),
 (103,1,'103',NULL,'ADIDAS NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',37.00,55.00,61.07,15820.912,52.664,66.800,67.000,0.000,0.000,40.000,9473.600,0,0,NULL,'2025-12-01 19:46:26','2025-12-10 21:08:48'),
 (104,2,'104',NULL,'SUETER DE NIÑO/ROCA',11.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',57.00,15.00,16.65,4726.338,74.390,19.956,126.000,0.000,0.000,9.550,2091.300,0,0,NULL,'2025-12-02 16:15:41','2025-12-11 16:36:11');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (105,1,'105',NULL,'CAMISA M. CORTA NIÑO/ROCA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',44.00,12.00,13.32,4734.912,59.945,19.992,140.000,0.000,0.000,8.330,1972.880,0,0,NULL,'2025-12-02 16:16:50','2025-12-10 21:13:24'),
 (106,2,'106',NULL,'CHEMISE DE NIÑO/LA ROCA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',64.00,15.00,16.65,4725.166,82.813,19.951,119.000,0.000,0.000,9.110,2157.610,0,0,NULL,'2025-12-02 16:17:39','2025-12-15 17:58:42'),
 (107,2,'107',NULL,'FRANELA DE NIÑO/ROCA',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.010,NULL,NULL,1,0,'ninguna.jpg','Activo',33.00,10.00,11.10,3703.065,48.038,17.475,133.000,0.000,0.000,7.500,2140.500,0,0,NULL,'2025-12-02 16:18:24','2025-12-24 13:04:17'),
 (108,1,'108',NULL,'PANTALON DE NIÑA KALUA',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',38.00,25.00,27.76,6870.247,54.206,24.840,38.000,0.000,0.000,18.000,4978.440,0,0,NULL,'2025-12-17 11:34:58','2025-12-17 11:50:45');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (109,2,'109',NULL,'CONJUNTO SENCILLO NIÑA',2.000,0.000,'TRAJE DE BAÑO NIÑO 2 PIEZAS','UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',51.00,17.00,18.87,13288.951,68.375,11.210,0.000,0.000,0.000,11.210,8800.630,0,0,NULL,'2026-01-31 12:38:44','2026-08-25 11:46:25'),
 (110,1,'110',NULL,'RELOJ INTELIGENTE NIÑO',2.000,0.000,'TRAJE DE BAÑO NIÑA 1 PIEZA','UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',56.00,20.00,22.21,15602.792,74.299,12.740,0.000,0.000,0.000,12.740,10001.790,0,0,NULL,'2026-01-31 12:39:45','2026-08-25 11:46:37'),
 (111,1,'111',NULL,'CONJUNTO NIÑA KAKE POP',1.000,0.000,'TRAJE DE BAÑO NIÑA 2 PIEZA','UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',49.00,15.00,16.65,9292.281,66.376,10.010,0.000,0.000,0.000,10.010,6236.430,0,0,NULL,'2026-01-31 12:40:34','2026-07-01 18:39:48');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (112,1,'112',NULL,'NO USAR CODIGO',0.000,0.000,'TRAJE DE BAÑO NIÑA','UND',1,1,0,0.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',0.00,0.00,0.00,NULL,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0,0,NULL,'2026-01-31 12:40:50','2026-08-25 10:55:10'),
 (113,1,'112',NULL,'TRAJE DE BAÑO',2.000,0.000,'TRAJE DE BAÑO NIÑA 3 PIEZAS','UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',14.00,15.00,16.65,1659.460,27.619,3.320,0.000,0.000,0.000,13.050,1229.230,0,0,NULL,'2026-01-31 12:40:50','2026-09-29 15:55:09'),
 (114,1,'116',NULL,'TRAJE DE BAÑO Y TOALLA NIÑO',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',52.00,10.00,11.10,7828.091,69.251,13.645,108.000,0.000,0.000,6.560,5150.060,0,0,NULL,'2026-02-18 11:38:01','2026-08-25 11:47:44'),
 (115,2,'113',NULL,'PIJAMA DE NIÑO',7.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',17.00,15.00,16.65,5926.764,30.315,14.953,17.000,0.000,0.000,12.780,5065.610,0,0,NULL,'2026-02-18 11:38:41','2026-02-18 11:48:29');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (116,2,'114',NULL,'TRAJE DE BAÑO NIÑA 2PZAS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',58.00,15.00,16.65,11771.490,75.493,21.068,122.000,0.000,0.000,9.490,7450.310,0,0,NULL,'2026-02-18 11:39:29','2026-08-25 11:47:00'),
 (117,2,'115',NULL,'GORRA DE NIÑO',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',98.00,10.00,11.10,3963.307,119.858,9.999,98.000,0.000,0.000,5.050,2001.670,0,0,NULL,'2026-02-18 11:39:57','2026-02-18 11:48:55'),
 (118,1,'117',NULL,'JOGGER ADIDAS, NIKE NIÑO',24.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',52.00,18.00,19.99,14887.868,68.893,19.051,61.000,0.000,0.000,11.833,9794.650,0,0,NULL,'2026-06-08 15:09:01','2026-09-10 10:08:27'),
 (119,1,'124',NULL,'CONJUNTOS DE NIÑO SHEIN',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',51.00,30.00,33.31,23472.029,68.225,61.380,210.000,0.000,0.000,19.800,15544.390,0,0,NULL,'2026-06-08 15:09:55','2026-08-25 11:49:08');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (120,1,'123',NULL,'CAMISA DE NIÑO BLANCA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',64.00,13.00,14.43,7373.489,82.244,12.989,64.000,0.000,0.000,7.920,4496.030,0,0,NULL,'2026-06-08 15:10:35','2026-06-08 15:46:10'),
 (121,1,'122',NULL,'TRAJE DE BAÑO NIÑO',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',64.00,15.00,16.65,8472.060,83.014,14.924,64.000,0.000,0.000,9.100,5165.890,0,0,NULL,'2026-06-08 15:11:10','2026-06-08 15:47:05'),
 (122,1,'121',NULL,'GORRO NIÑO',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',99.00,10.00,11.10,5659.719,121.614,9.970,99.000,0.000,0.000,5.010,2844.080,0,0,NULL,'2026-06-08 15:11:35','2026-06-08 15:46:51'),
 (123,1,'120',NULL,'BERMUDA NIÑO',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',62.00,18.00,19.99,10189.622,80.371,17.950,62.000,0.000,0.000,11.080,6289.890,0,0,NULL,'2026-06-08 15:12:01','2026-06-08 15:46:28');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (124,1,'119',NULL,'MEDIAS DE NIÑO, BLANCA, NEGRA, GRIS',14.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',18.00,2.00,2.22,648.469,217.224,1.050,50.000,0.000,0.000,0.700,549.550,0,0,NULL,'2026-06-08 15:12:49','2026-08-25 11:48:45'),
 (125,1,'118',NULL,'CONJUNTO VERDE BAUTIZO',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',54.00,32.00,35.53,18113.988,71.473,31.909,54.000,0.000,0.000,20.720,11762.330,0,0,NULL,'2026-06-08 15:13:31','2026-06-08 15:33:43'),
 (126,1,'125',NULL,'FALDA SHORT NIÑA',1.000,1.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',53.00,20.00,22.21,11334.577,70.159,19.966,53.000,0.000,0.000,13.050,7408.220,0,0,NULL,'2026-06-08 15:16:10','2026-06-08 15:51:11'),
 (127,1,'126',NULL,'CONJUNTOS DEPORTIVOS MUNDIAL',18.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',49.00,18.00,19.99,10659.594,65.522,17.990,49.000,0.000,0.000,12.074,7154.090,0,0,NULL,'2026-06-17 16:46:47','2026-06-17 16:51:49');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (128,1,'144',NULL,'VESTIDO Y CONJUNTOS NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',73.00,20.00,22.21,12394.983,93.093,19.895,73.000,0.000,0.000,11.500,7164.730,0,0,NULL,'2026-07-01 17:45:05','2026-07-01 18:43:21'),
 (129,1,'143',NULL,'CHAQUETA Y CONJUNTO DE NIÑO',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',51.00,21.00,23.32,13076.570,67.741,20.989,51.000,0.000,0.000,13.900,8659.980,0,0,NULL,'2026-07-01 17:45:50','2026-07-01 18:43:08'),
 (130,1,'142',NULL,'BOXER DE NIÑO',11.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',57.00,3.00,3.33,1858.472,75.308,2.983,57.000,0.000,0.000,1.900,1183.740,0,0,NULL,'2026-07-01 17:46:32','2026-07-01 18:42:30'),
 (131,1,'141',NULL,'FRANELILLA NIÑO Y OTROS',8.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',58.00,8.00,8.88,4980.918,75.539,7.995,58.000,0.000,0.000,5.060,3152.480,0,0,NULL,'2026-07-01 17:47:36','2026-07-01 18:41:35');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (132,1,'140',NULL,'CONJUNTO DE BERMUDA NIÑO Y CHAQUETA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',55.00,16.00,17.76,9946.521,72.471,15.965,55.000,0.000,0.000,10.300,6417.110,0,0,NULL,'2026-07-01 17:50:30','2026-07-01 18:43:34'),
 (133,1,'139',NULL,'SUETER DE NIÑO',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',62.00,15.00,16.65,9335.947,80.046,14.985,62.000,0.000,0.000,9.250,5762.930,0,0,NULL,'2026-07-01 17:52:04','2026-07-01 18:42:40'),
 (134,1,'138',NULL,'CAMISETAS VARIADAS NIÑO',15.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',88.00,12.00,13.32,7813.650,108.831,8.677,36.000,0.000,0.000,6.380,5008.750,0,0,NULL,'2026-07-01 17:53:06','2026-08-25 11:48:24'),
 (135,1,'137',NULL,'MEDIAS DE LAZO  BEBE',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',45.00,4.00,4.44,2475.251,62.085,3.973,45.000,0.000,0.000,2.740,1707.070,0,0,NULL,'2026-07-01 17:53:43','2026-07-01 18:40:07');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (136,1,'136',NULL,'SET PEINE DE BEBE Y OTROS',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',10.00,10.00,11.10,6211.765,129.398,9.970,106.000,0.000,0.000,4.840,3015.420,0,0,NULL,'2026-07-01 17:54:27','2026-07-01 18:41:47'),
 (137,1,'135',NULL,'TRENZA NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',39.00,10.00,11.10,6209.199,54.851,9.966,39.000,0.000,0.000,7.170,4467.050,0,0,NULL,'2026-07-01 17:55:30','2026-07-01 18:41:58'),
 (138,1,'134',NULL,'CESTA DE ROPA PARA NIÑOS',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',93.00,15.00,16.65,9342.879,114.341,14.996,93.000,0.000,0.000,7.770,4840.870,0,0,NULL,'2026-07-01 17:56:15','2026-07-01 18:41:14'),
 (139,1,'133',NULL,'CORREA DE NIÑOS',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',29.00,5.00,5.55,3108.640,340.589,4.990,296.000,0.000,0.000,1.260,785.010,0,0,NULL,'2026-07-01 17:57:04','2026-07-01 18:41:27');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (140,1,'132',NULL,'GORRA DE NIÑO/NIÑA',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',74.00,7.00,7.77,4357.900,93.333,6.995,74.000,0.000,0.000,4.020,2504.540,0,0,NULL,'2026-07-01 17:57:46','2026-07-01 18:42:18'),
 (141,1,'131',NULL,'MEDIAS CON LAZO NIÑA',11.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',44.00,5.00,5.55,1040.054,503.416,1.168,27.000,0.000,0.000,0.920,722.260,0,0,NULL,'2026-07-01 17:59:42','2026-08-25 11:48:14'),
 (142,1,'130',NULL,'VESTIDO DE NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',49.00,20.00,22.21,12429.938,65.838,19.951,49.000,0.000,0.000,13.390,8342.240,0,0,NULL,'2026-07-01 18:00:45','2026-07-01 18:40:55'),
 (143,1,'127',NULL,'CHAQUETA NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',47.00,26.00,28.87,16137.087,63.833,25.901,47.000,0.000,0.000,17.620,10977.610,0,0,NULL,'2026-07-01 18:01:13','2026-07-01 18:41:05');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (144,1,'129',NULL,'CHALECO NIÑA Y OTROS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',53.00,24.00,26.65,14898.834,70.485,23.914,53.000,0.000,0.000,15.630,9737.800,0,0,NULL,'2026-07-01 18:07:10','2026-07-01 18:40:18'),
 (145,1,'128',NULL,'VESTIDO NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',54.00,25.00,27.76,15523.908,71.552,24.917,54.000,0.000,0.000,16.180,10080.460,0,0,NULL,'2026-07-01 18:11:23','2026-07-01 18:40:30'),
 (146,1,'145',NULL,'LAZOS PEQUEÑOS',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',100.00,2.00,2.22,1570.140,122.057,2.000,100.000,0.000,0.000,1.000,785.070,0,0,NULL,'2026-08-25 11:16:18',NULL),
 (147,1,'146',NULL,'CONJUNTO BERMUDA DE NIÑO',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',57.00,20.00,22.21,15653.512,74.848,19.939,57.000,0.000,0.000,12.700,9970.390,0,0,NULL,'2026-08-25 11:16:58','2026-08-25 11:49:25');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (148,1,'147',NULL,'CONJUNTO DE NIÑA JEAN Y BLUSA',7.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',38.00,25.00,27.76,19544.471,53.864,24.895,38.000,0.000,0.000,18.040,14162.660,0,0,NULL,'2026-08-25 11:18:14','2026-08-25 11:49:35'),
 (149,1,'148',NULL,'CONJUNTO CASUAL DE NIÑA BERMUDA',5.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',47.00,22.00,24.43,17195.384,63.935,21.903,47.000,0.000,0.000,14.900,11697.540,0,0,NULL,'2026-08-25 11:18:44','2026-08-25 11:49:46'),
 (150,1,'149',NULL,'ZAPATICOS DE PLAYA NIÑA',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',75.00,7.00,7.77,5495.490,94.300,7.000,75.000,0.000,0.000,4.000,3140.280,0,0,NULL,'2026-08-25 11:24:50',NULL),
 (151,1,'150',NULL,'TRAJE DE BAÑO 3PZAS NIÑO',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',37.00,23.00,25.54,17983.127,52.731,22.906,37.000,0.000,0.000,16.720,13126.370,0,0,NULL,'2026-08-25 11:25:32','2026-08-25 11:50:00');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (152,1,'151',NULL,'RASCA ENCIAS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',64.00,8.00,8.88,6270.196,82.388,7.987,64.000,0.000,0.000,4.870,3823.290,0,0,NULL,'2026-08-25 11:26:06','2026-08-25 11:50:11'),
 (153,1,'152',NULL,'BOLSO DE ABEJITA NIÑA',0.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',48.00,16.00,17.79,12536.947,64.853,15.969,48.000,0.000,0.000,10.790,8470.910,0,0,NULL,'2026-08-25 11:26:56','2026-08-25 11:50:21'),
 (154,1,'153',NULL,'CONJUNTO DE 3PZAS NIÑO CON CHALECO',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',47.00,38.00,42.19,29774.571,63.530,37.926,47.000,0.000,0.000,25.800,20254.810,0,0,NULL,'2026-08-25 11:27:37','2026-08-25 11:50:33'),
 (155,1,'154',NULL,'TRAJE DE BAÑO TIBURON',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',51.00,18.00,19.99,14130.625,67.660,17.999,51.000,0.000,0.000,11.920,9358.030,0,0,NULL,'2026-08-25 11:28:33',NULL);
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (156,1,'155',NULL,'BOLSOS E BANDOLEROS VARIADOS',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',65.00,12.00,13.32,9404.356,83.518,11.979,65.000,0.000,0.000,7.260,5699.610,0,0,NULL,'2026-08-25 11:29:14','2026-08-25 11:50:45'),
 (157,1,'156',NULL,'CORREA DE CUERO  DE NIÑO',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',99.00,5.00,5.55,3921.355,121.172,4.995,99.000,0.000,0.000,2.510,1970.530,0,0,NULL,'2026-08-25 11:29:53','2026-08-25 11:51:01'),
 (158,1,'157',NULL,'TRAJE DE BAÑO NIÑO 2 PIEZAS',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',60.00,15.00,16.65,11719.520,78.502,14.928,60.000,0.000,0.000,9.330,7324.700,0,0,NULL,'2026-08-25 11:30:26','2026-08-25 11:51:11'),
 (159,1,'158',NULL,'TRAJE DE BAÑO NIÑA',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',72.00,15.00,16.65,11734.287,91.649,14.947,72.000,0.000,0.000,8.690,6822.260,0,0,NULL,'2026-08-25 11:31:54','2026-08-25 11:51:24');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (160,1,'159',NULL,'TRAJE DE BAÑO NIÑO',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',72.00,15.00,16.65,11761.291,91.209,14.981,72.000,0.000,0.000,8.710,6837.960,0,0,NULL,'2026-08-25 11:32:22','2026-08-25 11:51:34'),
 (161,1,'160',NULL,'TRAJE DE BAÑO NIÑO',4.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',57.00,17.00,18.87,13286.988,75.091,16.925,57.000,0.000,0.000,10.780,8463.050,0,0,NULL,'2026-08-25 11:32:54','2026-08-25 11:51:44'),
 (162,1,'161',NULL,'CHEMISE NIÑO',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',54.00,15.00,16.65,11739.466,71.517,14.953,54.000,0.000,0.000,9.710,7623.030,0,0,NULL,'2026-08-25 11:33:22','2026-08-25 11:51:53'),
 (163,1,'162',NULL,'COJUNTOS NIÑA FALDA, Y OTROS',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',50.00,30.00,33.31,23434.335,67.380,29.850,50.000,0.000,0.000,19.900,15622.890,0,0,NULL,'2026-08-25 11:33:59','2026-08-25 11:52:02');
INSERT INTO `articulos` (`idarticulo`,`idcategoria`,`codigo`,`codweb`,`nombre`,`stock`,`apartado`,`descripcion`,`unidad`,`cntxund`,`cntgrupo`,`usagrupo`,`fraccion`,`comi`,`pcomision`,`volumen`,`grados`,`peso`,`minimo`,`vence`,`showlista`,`oferta`,`imagen`,`estado`,`utilidad`,`precio1`,`precio2`,`precio_t`,`util2`,`precio3`,`util3`,`utilvip`,`pvip`,`costo`,`costo_t`,`iva`,`serial`,`remember_token`,`created_at`,`updated_at`) VALUES 
 (164,1,'163',NULL,'CONJUNTO MONO TEJIDO NIÑA',3.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',35.00,30.00,33.31,23390.762,50.922,29.794,35.000,0.000,0.000,22.070,17326.490,0,0,NULL,'2026-08-25 11:34:30','2026-08-25 11:52:14'),
 (165,1,'164',NULL,'LENTES DE NIÑO/NIÑA',20.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',35.00,5.00,5.55,3920.653,404.675,4.994,354.000,0.000,0.000,1.100,863.580,0,0,NULL,'2026-08-25 11:35:01','2026-08-25 11:52:24'),
 (166,1,'169',NULL,'SEPARADOR DE ALIMENTOS',1.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',28.00,10.00,11.10,7838.144,42.344,9.984,28.000,0.000,0.000,7.800,6123.550,0,0,NULL,'2026-08-25 11:35:32','2026-08-25 11:52:35'),
 (167,1,'166',NULL,'JUGUETE DE BEBE',2.000,0.000,NULL,'UND',1,1,0,1.000,0,NULL,NULL,NULL,0.000,NULL,NULL,1,0,'ninguna.jpg','Activo',68.00,10.00,11.10,7821.190,87.232,9.962,68.000,0.000,0.000,5.930,4655.470,0,0,NULL,'2026-08-25 11:36:15','2026-08-25 11:52:45');
/*!40000 ALTER TABLE `articulos` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`bancos`
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`bancos`
--

/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
INSERT INTO `bancos` (`idbanco`,`codigo`,`nombre`,`cuentaban`,`tipocta`,`titular`,`email`) VALUES 
 (1,'BCO001','Dolares efectivo','0000000000001','Corriente','kelly',NULL),
 (2,'BCO002','Banco Nacional de Credito','0000000000002','Ahorro','kelly',NULL),
 (3,'BCO006','Dolares Electronicos','00000300000000','Ahorro','kelly',NULL),
 (8,'BCO004','Bolivares Efectivo','0000000000005','Ahorro','kelly','kelly@gmail.com');
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `condicion` int(11) NOT NULL,
  `licor` int(11) DEFAULT '0',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idcategoria`,`nombre`,`descripcion`,`condicion`,`licor`) VALUES 
 (1,'NIÑA','ROPA Y ACCESORIOS',1,0),
 (2,'NIÑO','ROPA Y ACCESORIOS',1,0),
 (3,'BEBE NIÑO','ROPA Y ACCESORIOS',1,0),
 (4,'BEBE NIÑA','ROPA Y ACCESORIOS',1,0),
 (5,'NIÑO Y NIÑA','ROPA Y ACCESORIOS',1,0),
 (6,'BEBE NIÑO Y NIÑA','ROPA Y ACCESORIOS',1,0);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`categoriaclientes`
--

DROP TABLE IF EXISTS `categoriaclientes`;
CREATE TABLE `categoriaclientes` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecategoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`categoriaclientes`
--

/*!40000 ALTER TABLE `categoriaclientes` DISABLE KEYS */;
INSERT INTO `categoriaclientes` (`idcategoria`,`nombrecategoria`) VALUES 
 (1,'Cliente Detal'),
 (2,'Abasto'),
 (3,'Bodega'),
 (4,'Carniceria'),
 (5,'Panaderia'),
 (6,'Restaurant'),
 (7,'Fruteria'),
 (8,'Finca'),
 (9,'Super Mercado'),
 (10,'Kiosco-Cafetin'),
 (11,'Personal Interno'),
 (12,'Ferreteria'),
 (13,'Policía o Guardia');
/*!40000 ALTER TABLE `categoriaclientes` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`clasi_gasto`
--

DROP TABLE IF EXISTS `clasi_gasto`;
CREATE TABLE `clasi_gasto` (
  `idclasi` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idclasi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`clasi_gasto`
--

/*!40000 ALTER TABLE `clasi_gasto` DISABLE KEYS */;
INSERT INTO `clasi_gasto` (`idclasi`,`nombre`) VALUES 
 (1,'Gastos Fijos Operativos'),
 (2,'Gastos Variables'),
 (3,'Gastos Fiscales y Legales');
/*!40000 ALTER TABLE `clasi_gasto` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`clientes`
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
  `catcomercial` int(5) DEFAULT '1',
  `status` varchar(3) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `casa` varchar(50) DEFAULT NULL,
  `avenida` varchar(50) DEFAULT NULL,
  `barrio` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `entidad` varchar(50) DEFAULT NULL,
  `codpostal` varchar(50) DEFAULT NULL,
  `latitud` decimal(11,8) DEFAULT '0.00000000',
  `longitud` decimal(11,8) DEFAULT '0.00000000',
  `tipo_cliente` int(11) NOT NULL,
  `diascredito` int(11) DEFAULT '0',
  `limitecre` float(12,3) DEFAULT '0.000',
  `tipo_precio` int(11) NOT NULL,
  `retencion` int(11) DEFAULT '0',
  `vendedor` int(11) DEFAULT NULL,
  `ruta` int(11) DEFAULT '1',
  `creado` date DEFAULT NULL,
  `lastfact` date DEFAULT NULL,
  `tipo` varchar(2) DEFAULT 'C',
  `contacto` varchar(50) DEFAULT NULL,
  `telcontacto` varchar(25) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT 'sinfoto.png',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (1,'YURY MORA','17771130','17771130','58','(424) 712-9153',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,4,3,'2025-11-13','2026-04-25','C',NULL,NULL,'sinfoto.png'),
 (2,'WUILMER PUERTA','16604674','16604674','58','(424) 716-3726',NULL,1,'A','santa cruz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-13',NULL,'C',NULL,NULL,'sinfoto.png'),
 (3,'ALBERTO GARCIA','17770495','17770495','58','(414) 077-6571',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,5,3,'2025-11-15','2025-11-15','C',NULL,NULL,'sinfoto.png'),
 (4,'ANDREA MARQUEZ','31917028','31917028','58','(414) 177-3830',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,4,3,'2025-11-15','2026-04-09','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (5,'ANDREA ZAMBRANO','32591442','32591442','58','(412) 799-6727',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15','2026-02-27','C',NULL,NULL,'sinfoto.png'),
 (6,'ANTONY MENDEZ','28713507','28713507','58','(412) 070-8694',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (7,'ARELIS PERNIA','20217587','20217587','58','(412) 424-733_',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15','2026-09-17','C',NULL,NULL,'sinfoto.png'),
 (8,'DANIELA MARQUEZ','24196579','24196579','58','(414) 075-7877',NULL,1,'A','SANTA MARTA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (9,'ELIANA QUINTERO','15235712','15235712','58','(424) 722-4385',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (10,'ESTEFANY ZAMBRANO','32941354','32941354','58','(426) 474-1232',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15','2025-12-24','C',NULL,NULL,'sinfoto.png'),
 (11,'JUANA VIVAS','27581012','27581012','+58','(414) 171-9837',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (12,'JULIA VIVAS','11294873','11294873','58','(414) 171-2149',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15','2026-04-01','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (13,'LERVIS GUILLEN','17771453','17771453','+58','(412) 070-5821',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15','2025-12-23','C',NULL,NULL,'sinfoto.png'),
 (14,'LISBETH MALDONADO','13525149','13525149','+58','(412) 075-2264',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (15,'MARCIAL FILPO','30540528','30540528','+58','(416) 777-3775',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (16,'MARIBEL MORA','8712454','8712454','58','(424) 718-5479',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-15','2026-05-03','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (17,'MARTHA SILVA','16201094','16201094','+58','(416) 595-5240',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (18,'MAURA DIAZ','8718920','8718920','58','(414) 077-8765',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (19,'MIGUEL CONTRERAS','9876456','9876456','+58','(557) 8__-____',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (20,'MILEIDY TORRES','16605023','16605023','+58','(424) 757-8048',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15','2025-12-19','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (21,'NAZARET RONDON','27581126','16605023','+58','(424) 784-6250',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (22,'TANIA MORA','8081141','8081141','+58','(412) 523-5110',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (23,'YILMERI MARQUEZ','32478103','32478103','+58','(412) 073-6283',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (24,'DANIEL CONTRERAS HNO MIGUEL','16604765','16604765','+58','(424) 741-4482',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (25,'DORIS ROJAS','16907371','16907371','+58','(720) 137-____',NULL,1,'A','SECTOR PUERTO RICO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (26,'ELIDER RONDON','34027437','34027437','+58','(133) 260-5___',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (27,'GILBERTO PERNIA','17771637','17771637','+58','(341) 700-1___',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (28,'GUSTAVO PEÑUELA','10901638','10901638','+58','(763) 255-3___',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (29,'JESUS ANDRES CHACON','8765','8765','+58','(424) 710-3096',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (30,'JOALIN DE SOUSA','16317804','16317804','+58','(873) 776-1___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (31,'LAURA FERNANDEZ','20829717','20829717','+58','(424) 757-8456',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (32,'LAURA USECHE','16907932','16907932','+58','(565) 421-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15','2026-04-28','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (33,'LUIS ENRIQUE HUIZA','1234543','1234543','+58','(568) 421-67__',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15','2025-12-29','C',NULL,NULL,'sinfoto.png'),
 (34,'LUZMILA PEREIRA','14447114','14447114','+58','(273) 647-2___',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (35,'MAGALY VARGAS','12799749','12799749','414','7001829',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,4,3,'2025-11-15','2025-12-08','C',NULL,NULL,'sinfoto.png'),
 (36,'MARIA HERNANDEZ','14255493','14255493','+58','(657) 285-6___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (37,'MARIA RANGEL','13525007','13525007','+58','(768) 789-9___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-15',NULL,'C',NULL,NULL,'sinfoto.png'),
 (38,'LISETH CONTRERAS CLIENTE','306858990','306858990','+58','(424) 710-3096',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-17','2026-09-23','C',NULL,NULL,'sinfoto.png'),
 (39,'MILAGRO URBINA','86543','86543','+58','(412) 883-9051',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (40,'NEIDA PAREDES','13230170','13230170','+58','(476) 589-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (41,'NOHELIA MOLINA','16316035','16316035','+58','(978) 561-1___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (42,'PROFE LAURA','13525539','13525539','+58','(137) 746-0___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (43,'YASMARY DAVID','15075312','15075312','+58','(426) 478-0507',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (44,'CACHETE','121212','121212','+58','(234) 5__-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (45,'CHAPARRA','10898547','10898547','+58','(349) 680-1___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (46,'DAVID VIVAS','5678','5678','+58','(678) ___-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (47,'DIONICIO GOMEZ','2645','2645','+58','(357) 345-6___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (48,'HECTOR ZAMBRANO','12831951','12831951','+58','(424) 353-8059',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (49,'JAVIER DAVILA','18637356','18637356','+58','(514) 689-5___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (50,'JOSE ARMANDO ROJAS','16604314','16604314','+58','(424) 180-8843',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (51,'JOSE CONTRERAS','20395876','20395876','+58','(041) 622-0634',NULL,1,'A','GUARAQUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (52,'JOSE MORA','78767','78767','+58','(310) 309-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (53,'JULIET MENDEZ','17771559','17771559','+58','(041) 217-9428',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (54,'LENDY MACHADO','17914436','17914436','+58','(747) 454-5___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (55,'LUIS RAMIREZ','8086532','8086532','+58','(678) 9__-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (56,'MARIA USECHE','445','4565','+58','(234) ___-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (57,'MARLY FERNANDEZ','25720476','25720476','+58','(414) 371-7092',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-18','2026-07-31','C',NULL,NULL,'sinfoto.png'),
 (58,'MARYORI','12456','12456','+58','(762) 547-1___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-04-01','C',NULL,NULL,'sinfoto.png'),
 (59,'MERCEDES ARANDA','13525410','13525410','+58','(719) 338-2___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (60,'NEILA QUINTERO','24853144','24853144','+58','(424) 732-8210',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (61,'OMAR QUIÑONES','5508413','5508413','+58','(424) 732-8210',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (62,'SOCORRO SERRANO','2345678','2345678','+58','(710) 309-6___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (63,'YULIMAR PEREIRA','20832470','20832470','+58','(414) 705-6119',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-18','2025-12-30','C',NULL,NULL,'sinfoto.png'),
 (64,'ANDREA CONTRERAS','20828543','20828543','+58','(424) 755-1972',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (65,'ANGILMAR MOLINA','31252643','31252643','+58','(412) 978-1853',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (66,'ANTONIO ARGONA','19487689','19487689','+58','(412) 070-9771',NULL,1,'A','BAILADORES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (67,'BAUDILIO GUTIERREZ','15756573','15756573','+58','(424) 752-0565',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (68,'CAROLINA SERRANO','16604931','16604931','+58','(412) 659-2686',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2025-12-23','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (69,'DAISI CONTRERAS','8607588','8607588','+58','(424) 709-1297',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (70,'DAVID VIVAS DELIMAR','4345678','4567','+58','(234) 56_-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (71,'ELISABETH GUTIERREZ','15694961','15694961','+58','(412) 456-5402',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-08-22','C',NULL,NULL,'sinfoto.png'),
 (72,'GREGORY ECHEVERRIA FINCA','562537','562537','+58','(526) 378-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (73,'IGNACIO PEREIRA NACHO','32455129','32455129','+58','(416) 709-6080',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (74,'MAYERLIN MERCHAN','67676','67676','+58','(412) 258-4627',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (75,'MICHEL MERCHAN','234567','23456','+58','(412) 078-7724',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2025-12-29','C',NULL,NULL,'sinfoto.png'),
 (76,'ORIANA CONTRERAS','32867745','32867745','+58','(412) 121-6919',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (77,'PEDRO LUIS PATRO CUÑADO DE YULIMAR','16908027','16908027','+58','(414) 710-1280',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (78,'PEDRO SALON','20218941','20218941','+58','(412) 547-8916',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (79,'ROSA PADILLA','13420131','13420131','+58','(414) 975-2920',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (80,'ROSELI MARQUEZ','26880040','26880040','+58','(414) 745-5461',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (81,'TANHE GONZALEZ','4567','4567','+58','(345) ___-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (82,'TINA MENDEZ','28713500','28713500','+58','(414) 177-0729',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (83,'YILMAR RUIZ','26880882','26880882','+58','(424) 720-5525',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2025-12-27','C',NULL,NULL,'sinfoto.png'),
 (84,'ANNY OCHOA','22852558','22852558','+58','(424) 603-4891',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (85,'ARMANDO GUTIERREZ GUERRILLA','232323','232323','+58','(232) 3__-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (86,'CRISTIAN DUARTE','27780871','27780871','+58','(041) 267-1774',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (87,'DAYANA HERRERA','84598403','84598403','+58','(424) 719-4995',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,4,3,'2025-11-18','2025-12-17','C',NULL,NULL,'sinfoto.png'),
 (88,'DIANA MARQUEZ','26043621','26043621','+58','(426) 472-7197',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (89,'GUADALUPE GUERRERO','30373314','30373314','+58','(416) 863-9344',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-07-18','C',NULL,NULL,'sinfoto.png'),
 (90,'ISABELL MORA','17770935','17770935','+58','(412) 235-2135',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (91,'KARLI CONTRERAS','27581544','27581544','+58','(414) 769-25__',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (92,'LEIDY GUTIERREZ','28515014','28515014','+58','(041) 250-7897',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2025-12-24','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (93,'MIA CARRERO','33036909','33036909','+58','(412) 649-6953',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (94,'NAZARETH DURAN','32930816','33036909','+58','(041) 667-1339',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (95,'NORIS VIVAS','10897008','10897008','+58','(412) 769-1358',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-18','2026-07-19','C',NULL,NULL,'sinfoto.png'),
 (96,'OLGA MARTINEZ','19847487','19847487','+58','(424) 767-1539',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (97,'RAFAEL MONTES','33946226','33946226','+58','(416) 676-3806',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (98,'ROBERTH MENDEZ','20217721','20217721','+58','(412) 129-3182',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (99,'SOFIA CONTRERAS','213323','213323','+58','(412) 656-5675',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (100,'VIRGINEA MORA','30799690','30799690','+58','(412) 019-5750',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (101,'YAMILET MOLINA','17322401','17322401','+58','(424) 748-0083',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (102,'YOSBELI MARQUEZ','30621994','30621994','+58','(414) 081-9745',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (103,'ANDREINA GONZALEZ','28145394','28145394','+58','(424) 720-7308',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (104,'CAROLINA GONZALEZ','19048804','19048804','+58','(424) 743-7567',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (105,'GENESIS USECHE','25720772','25720772','+58','(412) 258-9295',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (106,'KEILY MALANGERA','25154205','25154205','+58','(424) 727-8021',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-03-19','C',NULL,NULL,'sinfoto.png'),
 (107,'LUIS SANCHEZ','23226288','23226288','+58','(412) 070-0192',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (108,'MARCELINA MORA','14255857','14255857','+58','(412) 896-0918',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (109,'NAZARET RUIZ','30199454','30199454','+58','(424) 775-6401',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (110,'PRINCESA MEDINA','31042763','31042763','+58','(422) 721-1033',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (111,'REIMAR REBBETY','24287420','24287420','+58','(412) 557-199_',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-06-15','C',NULL,NULL,'sinfoto.png'),
 (112,'ROGELIO GUILLEN','12121','12121','+58','(___) 132-9293',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,4,3,'2025-11-18','2026-08-21','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (113,'SEBASTIAN NOGUERA','28933995','28933995','+58','(414) 702-2955',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (114,'SONIA FERREIRA','10903076','10903076','+58','(412) 758-7543',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (115,'YIMMI AMORTEGUI','29705869','29705869','+58','(412) 935-1835',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (116,'YOHANA PERALTA','16605028','16605028','+58','(412) 073-6822',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (117,'YOLEIBA MOLINA','16713837','16713837','+58','(426) 577-2020',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (118,'YUNIOR FERREIRA','67890','67890','+58','(344) 554-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (119,'ASTRID AVENDAÑO','30788642','30788642','+58','(424) 709-7992',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (120,'BETSY MARQUEZ','8707330','8707330','+58','(416) 550-3433',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (121,'EDIR MONTILLAR','234555','234555','+58','(223) 444-44__',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (122,'ELDAINY','235689999','234555','+58','(677) 888-8___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (123,'ELISABET GUZMAN','16907805','16907805','+58','(412) 308-3097',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (124,'FABIOLA APONCIO','28713527','28713527','+58','(424) 743-3216',NULL,1,'A','CAMPO ALEGRE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (125,'ISAMARELY','19848721','19848721','+58','(212) 222-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-07-28','C',NULL,NULL,'sinfoto.png'),
 (126,'MARIANGELA BELANDRIA','33879545','33879545','+58','(234) 444-44__',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-09-03','C',NULL,NULL,'sinfoto.png'),
 (127,'NAILETH ALBORNOZ','19652295','19652295','+58','(424) 755-5562',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (128,'PAULA DAVILA','28378604','28378604','+58','(412) 792-3201',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (129,'RICHARD DAVILA','1301926','1301926','+58','(222) 22_-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (130,'ROSANGELY CONTRERAS','26285664','26285664','+58','(424) 739-8321',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (131,'WILIANA HERNADEZ','26043745','26043745','+58','(414) 701-3174',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2025-12-21','C',NULL,NULL,'sinfoto.png'),
 (132,'YAINETH MOLINA','13790780','13790780','+58','(412) 124-0578',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (133,'YOHANA BLANCO','25004900','13790780','+58','(424) 761-9136',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-09-22','C',NULL,NULL,'sinfoto.png'),
 (134,'YUDITH BOSQUE','16020651','16020651','+58','(416) 238-7913',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-18','2026-07-18','C',NULL,NULL,'sinfoto.png'),
 (135,'ANALIA CONTRERAS','1190778','1190778','+58','(041) 475-3380',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (136,'BETANIA ARAQUE','27398953','27398953','+58','(424) 111-4462',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (137,'BIRNA AVENDAÑO','12487345','12487345','+58','(424) 777-4175',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,25,0.000,1,0,3,3,'2025-11-18','2025-12-24','C',NULL,NULL,'sinfoto.png'),
 (138,'ISABEL CRISTINA','1301481','1301481','+58','(424) 724-6652',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (139,'JOSE TRINIDAD GUTIERREZ','13790863','13790863','+58','(414) 752-8917',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (140,'LEONARDO PEDROZA','16908619','16908619','+58','(456) 7__-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (141,'LIGIA GUTIERREZ','1820908','1820908','+58','(412) 928-2541',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (142,'LILIANA LOPEZ','17323720','17323720','+58','(424) 664-6633',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (143,'MARCELA PEDROZA','26258845','26258845','+58','(414) 752-5750',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (144,'MARIA FERNANDA MORA','31370863','26258845','+58','(416) 179-2149',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (145,'NAYELI CONTRERAS','27780946','27780946','+58','(426) 375-8459',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (146,'NOHELIA LOPEZ','18209464','18209464','+58','(414) 375-5636',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (147,'ORIANA MARQUEZ','27021219','27021219','+58','(412) 070-1440',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (148,'OSCARLY MORALES','31707873','31707873','+58','(424) 711-9392',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (149,'SILVIA CHACON','2082250','2082250','+58','(424) 738-7081',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (150,'JANETH DIAZ','14255897','14255897','+58','(414) 177-5021',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (151,'YENNY DEL CARMEN MOLINA','1660553','1660553','+58','(424) 748-7201',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2025-12-28','C',NULL,NULL,'sinfoto.png'),
 (152,'ISAMAR FILPO','28572762','28572762','+58','(416) 062-3758',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (153,'ANGEL RAMIREZ','31630342','31630342','+58','(424) 760-2923',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (154,'AYLINN DUARTE','28750506','28750506','+58','(412) 072-0599',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (155,'CARLA MARQUEZ','27780941','27780941','+58','(414) 977-6429',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (156,'DAYANA MONTES','20830444','20830444','+58','(414) 376-6887',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-03-12','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (157,'EDWIN JOSE SERRANO ROJAS','29958013','29958013','+58','(416) 312-0558',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (158,'GREGORY ALEJANDRO PINO','16906280','16906280','+58','(424) 781-4906',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (159,'JUAN CARLOS MENDEZ','15801119','15801119','+58','(416) 135-0133',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (160,'KAREN GUERRA','32581088','32581088','+58','(414) 816-1027',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (161,'MARIA EUGUENIA PEDROZA','17771156','17771156','+58','(414) 701-5675',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-09-01','C',NULL,NULL,'sinfoto.png'),
 (162,'MARILU PEREIRA','16906411','16906411','+58','(412) 798-6835',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (163,'MARISOL AROCHA','13525624','13525624','+58','(416) 408-0639',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (164,'NORELIS LOBO','17771518','17771518','+58','(412) 397-3997',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (165,'OSVALDO SALAS','17769773','17769773','+58','(345) 67_-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (166,'PAOLA CHACON','20829032','20829032','+58','(424) 734-4664',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (167,'SILVIA SERRANO','34414708','34414708','+58','(416) 244-9478',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (168,'WILIAM DAVILA','30634622','30634622','+58','(424) 749-1663',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (169,'YASMIN GARCIA','16020333','16020333','+58','(414) 007-9683',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (170,'YENIFER MARQUEZ','20831893','20831893','+58','(412) 829-1968',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (171,'YOALDO RONDON','20396077','20396077','+58','(412) 072-6078',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (172,'YORMAN RINCON','13013437','13013437','+58','(412) 070-1898',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (173,'ALIX RAMIREZ','20397123','20397123','+58','(424) 750-0541',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-10-01','C',NULL,NULL,'sinfoto.png'),
 (174,'ANA ESCALONA','28652734','28652734','+58','(412) 788-2845',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (175,'CRISMAR RODRIGUEZ','30685930','30685930','+58','(426) 377-3253',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (176,'ELIANA GAVIRIA','32075385','32075385','+58','(412) 071-2871',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (177,'FERNANDO FERNANDEZ','19487138','19487138','+58','(345) 67_-____',NULL,1,'A','MESA DE LAS PALMAS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (178,'FRANCISCO ESCALANTE','27581102','27581102','+58','(412) 033-8983',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (179,'HEIDY VIVAS','14771908','14771908','+58','(426) 469-2393',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-03-03','C',NULL,NULL,'sinfoto.png'),
 (180,'JEAN CARLOS VERA','16019759','16019759','+58','(12_) ___-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (181,'JENNIBETH MARQUEZ','27780942','27780942','+58','(234) 5__-____',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (182,'JUAN BELANDRIA','17048717','17048717','+58','(123) 456-7___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (183,'KAREN COLLAZO','20396848','20396848','+58','(414) 710-1570',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (184,'KATY RODRIGUEZ','23724277','23724277','+58','(426) 727-5277',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (185,'NEIVI CHACON','27021615','27021615','+58','(424) 717-3610',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18','2026-07-19','C',NULL,NULL,'sinfoto.png'),
 (186,'ORIELY MARQUEZ','30658264','30658264','+58','(424) 711-1193',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (187,'ROXI PEREZ','28515239','28515239','+58','(234) 567-8___',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (188,'SEBASTIAN NOGUERA','23456','123456','+58','(414) 702-2955',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (189,'VIRGINIA CHACON','9487540','9487540','+58','(414) 712-6283',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (190,'YAMARY CHACON','20395839','20395839','+58','(412) 733-8217',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (191,'ZORAIDA GUTIERREZ','14255266','14255266','+58','(414) 757-9319',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (192,'ADRIANA PERNIA','19047567','19047567','+58','(412) 385-9030',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (193,'CARLA MORENO','20396920','20396920','+58','(412) 683-8874',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (194,'DAIRA GOMEZ','25537789','25537789','+58','(424) 735-0228',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (195,'DAVIANA PEREIRA','32006821','32006821','+58','4264289285',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (196,'DENIS RAMIREZ','27780869','27780869','+58','(412) 667-6430',NULL,1,'A','SANTA CRUZ DE  MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (197,'GERALDINE QUIÑONES','32063110','32063110','+58','(424) 710-3337',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2025-12-23','C',NULL,NULL,'sinfoto.png'),
 (198,'GREICY ANDRADE','20394140','20394140','+58','(412) 070-4685',NULL,1,'A','LA CUCHILLA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2025-12-17','C',NULL,NULL,'sinfoto.png'),
 (199,'GRICEL ARELLANO','31654792','31654792','+58','(412) 649-8527',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (200,'IDELMA DE COLLAZO','8080352','8080352','+58','(345) 678-____',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2026-08-21','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (201,'JOHELY CONTRERAS','30570539','30570539','+58','(414) 759-1384',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (202,'KATHERINE PRIETO','26761403','26761403','+58','(424) 702-0501',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (203,'LORETH VERA','30799684','30799684','+58','(414) 532-3468',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (204,'MAIRA MARQUEZ','20396536','20396536','+58','(414) 532-1595',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (205,'MARBELLA MORA','8081142','8081142','+58','(456) 7__-____',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (206,'MARIA VICTORIA CHACON','330889921','330889921','+58','(424) 767-4889',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2026-03-10','C',NULL,NULL,'sinfoto.png'),
 (207,'MARUGENIA VIVAS','10905384','10905384','+58','(414) 716-9699',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (208,'MERCEDES RUJANO','21330915','21330915','+58','(416) 074-1267',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (209,'SILVIA MORENO','30854687','30854687','+58','(412) 029-3868',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (210,'WUILFRED PEREIRA','16317736','16317736','+58','(416) 049-6296',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (211,'ANA MARIA ARAQUE','30192115','30192115','+58','(416) 975-5588',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (212,'ANDREINA MONCADA','18577543','18577543','+58','(412) 971-1705',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2026-04-25','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (213,'CARLA ESCALANTE','17321664','17321664','+58','(412) 072-8013',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2026-07-19','C',NULL,NULL,'sinfoto.png'),
 (214,'CARLY RAMIREZ','31106569','31106569','+58','(424) 750-7635',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (215,'DANNY','16604537','16604537','+58','(412) 231-095_',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (216,'FABIOLA MENDEZ','18578337','18578337','+58','(414) 758-3776',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2026-09-24','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (217,'JESUS SANCHEZ','27780863','27780863','+58','(416) 015-6159',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (218,'JUAN VIVAS','28283229','28283229','+58','(416) 709-5739',NULL,1,'A','BARINAS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (219,'KARINA CONTRERAS','18578459','19578459','+58','(424) 189-0979',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (220,'LEIDY MOLINA','19578459','19578459','+58','(412) 739-3905',NULL,1,'A','SAN DIEGO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2026-03-07','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (221,'MILVIA TERAN','19047951','19047951','+58','(414) 717-2541',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2025-12-24','C',NULL,NULL,'sinfoto.png'),
 (222,'ROSA CONTRERAS','8707662','8707662','+58','(424) 701-4280',NULL,1,'A','TOVAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (223,'ROXANA DAVILA','27978599','8707662','+58','(424) 147-8075',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (224,'SARAHI CONTRERAS','21332332','21332332','+58','(424) 724-0598',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (225,'SARAHI PEREIRA','28692897','28692897','+58','(412) 072-8334',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (226,'SKARLET SOFIA','30570569','30570569','+58','(412) 767-2112',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2026-08-01','C',NULL,NULL,'sinfoto.png'),
 (227,'YEXIBEL FERREIRA','31921409','31921409','+58','(414) 976-1235',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (228,'YUSBELY FLORES','25154501','25154501','+58','(424) 743-6150',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (229,'ANGELA MONTES','21330252','21330252','+58','(412) 064-5579',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (230,'CARMEN PEREIRA','18577487','18577487','+58','(414) 471-0128',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (231,'CAURI ROJAS','32120738','32120738','+58','(414) 206-5739',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (232,'FABIANA MARQUEZ','31042787','31042787','+58','(414) 977-0969',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2026-04-25','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (233,'GENESIS URBINA','345678','345678','+58','(424) 733-5225',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (234,'GERSON PINO','14131871','14131871','+58','(424) 763-7592',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (235,'JOSE DOMINGO VARGAS','12799750','12799750','+58','(424) 474-5269',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (236,'KELLY ANDRADE CLIENTE','25720023','25720023','+58','(412) 385-9030',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2026-07-19','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (237,'LISETH CONTRERAS','30685899','30685899','+58','(423) 710-3096',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2026-09-22','C',NULL,NULL,'sinfoto.png'),
 (238,'LUISA QUINTERO','31329031','31329031','+58','(414) 176-5573',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2025-12-31','C',NULL,NULL,'sinfoto.png'),
 (239,'MABELI NAVA','16907863','16907863','+58','(424) 474-8452',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (240,'MARBELIS HERNANDEZ','1411543','1411543','+58','(414) 750-5638',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2026-08-18','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (241,'MARIA ANDRADE','18208931','18208931','+58','(424) 706-0265',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2026-06-25','C',NULL,NULL,'sinfoto.png'),
 (242,'MARIA ISABEL SERRANO','16678277','16678277','+58','(412) 456-3923',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (243,'MAYERLIN MERCHAN','25537568','25537568','+58','(412) 385-9030',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (244,'MINEIDA MARQUEZ','10901424','10901424','+58','(412) 784-9870',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-11-19','2026-09-12','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (245,'NAIVETH RONDON','31524962','31524962','+58','(414) 709-8761',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (246,'PAULA PRIETO','32264822','32264822','+58','(414) 719-1280',NULL,1,'A','RANCHERIA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (247,'THANIA ZAMBRANO','28151265','28151265','+58','(412) 074-4175',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2026-05-28','C',NULL,NULL,'sinfoto.png'),
 (248,'WUILMER PUERTA','16605674','16605674','+58','(424) 716-3726',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (249,'AIXA PEREIRA','20395554','20395554','+58','(415) 213-555_',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19',NULL,'C',NULL,NULL,'sinfoto.png'),
 (250,'ANA MORA','19048718','19048718','+58','(416) 472-9562',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-11-19','2025-12-11','C',NULL,NULL,'sinfoto.png'),
 (251,'KELLY ORTEGA','27780892','27780892','+58','(242) 770-2882',NULL,1,'A','la parada',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,4,3,'2025-12-06','2025-12-06','C',NULL,NULL,'sinfoto.png'),
 (252,'YENIFER PUENTES','25720057','25720057','+58','(424) 702-3805',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,4,3,'2025-12-06','2026-03-29','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (253,'DAYANA MOLINA','20829282','20829282','+58','(412) 456-8229',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,4,3,'2025-12-06','2025-12-31','C',NULL,NULL,'sinfoto.png'),
 (254,'GABRIELA MOLINA','21156934',NULL,'+58','(424) 739-4371',NULL,1,'A','SANTA CRUZ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,4,3,'2025-12-08','2025-12-14','C',NULL,NULL,'sinfoto.png'),
 (255,'SILVIA RAMIREZ','26761945','26761945','+58','(424) 700-4322',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-10','2025-12-10','C',NULL,NULL,'sinfoto.png'),
 (256,'YOLEIBA MOLINA','16317837','16317837','+58','(426) 577-2020',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-12-10',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (257,'YIMI VIELMA','17894209','17894209','+58','(414) 732-8897',NULL,1,'A','TOVAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-12','2025-12-12','C',NULL,NULL,'sinfoto.png'),
 (258,'BETTY VIVAS','10899830','10899830','+58','(424) 722-2191',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,4,3,'2025-12-14',NULL,'C',NULL,NULL,'sinfoto.png'),
 (259,'CARLOS CAÑAS','8024905','8024905','+58','(414) 746-3632',NULL,1,'A','EL VIGIA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-12-14','2025-12-14','C',NULL,NULL,'sinfoto.png'),
 (260,'LUZMEIDI GOMEZ','20217857','20217857','+58','(424) 706-4209',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,4,3,'2025-12-14',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (261,'AMPARO ALTUVE','14623511','14623511','+58','(416) 534-7295',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-15','2026-06-02','C',NULL,NULL,'sinfoto.png'),
 (262,'DARLY SANTANDER','24349950','24349950','+58','(424) 773-3898',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-15','2025-12-17','C',NULL,NULL,'sinfoto.png'),
 (263,'YOLIMAR RIVAS','17771109','17771109','+58','(414) 709-7699',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-15','2025-12-15','C',NULL,NULL,'sinfoto.png'),
 (264,'GENESIS CONTRERAS','27021227','27021227','+58','(424) 748-1603',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-15',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (265,'YANIRET CIERRA','25586277','25586277','+58','(426) 475-7788',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-16','2025-12-18','C',NULL,NULL,'sinfoto.png'),
 (266,'CARMEN CASTRO','19047097','19047097','+58','(416) 371-5756',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-17','2025-12-17','C',NULL,NULL,'sinfoto.png'),
 (267,'CARLOS REY','17771938','17771938','+58','(041) 437-1752',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-12-17','2025-12-18','C',NULL,NULL,'sinfoto.png'),
 (268,'CRISTOBAL CHACON','15074438','15074438','+58','(412) 792-7785',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,4,3,'2025-12-18','2025-12-22','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (269,'JESUS MARQUEZ','32418028','32418028','+58','(041) 471-3148',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-18','2025-12-18','C',NULL,NULL,'sinfoto.png'),
 (270,'ANYI RONDON','20828466','20828466','+58','(042) 459-2597',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-18','2025-12-21','C',NULL,NULL,'sinfoto.png'),
 (271,'LISETH MARQUEZ','19046295','19046295','+58','(041) 253-4985',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-12-18','2025-12-22','C',NULL,NULL,'sinfoto.png'),
 (272,'MARIA GUTIERREZ','13525612','13525612','+58','(041) 621-4914',NULL,1,'A','SANTA CRUZ DE MOREA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-19','2025-12-19','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (273,'YURADI MARQUEZ','16604441','16604441','+58','(041) 472-1263',NULL,1,'A','SANTA CRUZ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-12-19','2025-12-22','C',NULL,NULL,'sinfoto.png'),
 (274,'ELIDA GUTIERREZ','12486202','12486202','+58','(905) 678-90__',NULL,1,'A','MOLINO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-20','2025-12-20','C',NULL,NULL,'sinfoto.png'),
 (275,'CINTY MARQUEZ','28746070','28746070','+58','(414) 753-1479',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-21','2025-12-24','C',NULL,NULL,'sinfoto.png'),
 (276,'YESSICA GARCIA','264329182','264329182','+58','(041) 475-8671',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-22','2025-12-26','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (277,'ROSA VEGA','2739845','2739845','+58','(041) 273-9684',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-22','2025-12-24','C',NULL,NULL,'sinfoto.png'),
 (278,'CARLOS DANIEL ESCALANTE','4587','4587','58','(424) 776-5462',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,3,3,'2025-12-22','2026-04-30','C',NULL,NULL,'sinfoto.png'),
 (279,'ZORAIDA GUZMAN','24191139','24191139','+58','(041) 647-3161',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-22','2026-01-24','C',NULL,NULL,'sinfoto.png'),
 (280,'ALEXANDRA MERCADO','30963372','30963372','+58','(042) 473-4059',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-23','2026-09-05','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (281,'BETANIA MONCADA','28729542','28729542','+58','(789) 456-78__',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-23','2025-12-23','C',NULL,NULL,'sinfoto.png'),
 (282,'DANIA BOLAÑO','15075019','15075019','+58','(041) 474-5618',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-26','2025-12-31','C',NULL,NULL,'sinfoto.png'),
 (283,'MARLENY CONTRERAS','21478820','21478820','+58','(041) 259-4487',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-29','2025-12-29','C',NULL,NULL,'sinfoto.png'),
 (284,'LICMAR VERA','32401382','32401382','+58','(414) 177-3830',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-30','2025-12-30','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (285,'VICTOR SERRANO','23723007','23723007','+58','(041) 299-6581',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-30','2026-01-13','C',NULL,NULL,'sinfoto.png'),
 (286,'JESUS CONTRERAS','456789','2345678','+58','(345) 678-90__',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2025-12-30','2025-12-30','C',NULL,NULL,'sinfoto.png'),
 (287,'MONICA MORALES','20939131','20939131','+58','(041) 237-0687',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-30','2026-01-24','C',NULL,NULL,'sinfoto.png'),
 (288,'ERIKA CONTRERAS','16908701','16908701','+58','(041) 207-3497',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2025-12-31','2026-05-12','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (289,'MILAGRO DUGARTE','18209134','18209134','+58','(041) 272-8324',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2025-12-31','2026-02-05','C',NULL,NULL,'sinfoto.png'),
 (290,'MARISELA GUTIERREZ','8713014','8713014','+58','(416) 308-9480',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-01-17','2026-01-17','C',NULL,NULL,'sinfoto.png'),
 (291,'ANA MARIA ESCALONA','25004916','25004916','+58','(041) 474-1910',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-01-21','2026-01-21','C',NULL,NULL,'sinfoto.png'),
 (292,'MILEIDY MOLINA','17321507','17321507','+58','(041) 260-3585',NULL,1,'A','SAN DIEGO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-01-22','2026-07-10','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (293,'CLAUDIA ESCALANTE','23555418','23555418','+58','(042) 624-0381',NULL,1,'A','PADRE GRANADO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-01-23',NULL,'C',NULL,NULL,'sinfoto.png'),
 (294,'HISMENIO DUGARTE','8089827','8089827','+58','(041) 630-4681',NULL,1,'A','SAN ISIDRO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-01-24','2026-01-24','C',NULL,NULL,'sinfoto.png'),
 (295,'ANDREA SANTAROMITA','28283293','28283293','+58','(041) 407-8252',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2026-01-24',NULL,'C',NULL,NULL,'sinfoto.png'),
 (296,'MARBELLA RONDON','17322378','17322378','+58','(042) 470-2068',NULL,1,'A','QUEBRA DEL LORO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-02-03','2026-02-03','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (297,'MARY CELANDIA','20828399','20828399','+58','(042) 474-7375',NULL,1,'A','LAS DELICIAS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2026-02-12','2026-07-20','C',NULL,NULL,'sinfoto.png'),
 (298,'MICHEL URRUTIA','31224550','31224550','+58','(424) 746-3770',NULL,1,'A','LA ROSSI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-02-12','2026-06-03','C',NULL,NULL,'sinfoto.png'),
 (299,'YUDIT MENDEZ','16605230','16605230','+58','(041) 278-5428',NULL,1,'A','TOVAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2026-02-18',NULL,'C',NULL,NULL,'sinfoto.png'),
 (300,'DAMIANA GONZALEZ','27170240','27170240','+58','(042) 469-2247',NULL,1,'A','SANTA CRUZ  DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-02-20','2026-03-27','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (301,'VIVIANA MORA','23493307','23493307','+58','(041) 207-2608',NULL,1,'A','SANTA CRUZ MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-02-21','2026-02-21','C',NULL,NULL,'sinfoto.png'),
 (302,'MARYORI ARAQUE','20397296','20397296','+58','(042) 476-2547',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-02-21','2026-02-21','C',NULL,NULL,'sinfoto.png'),
 (303,'LUZ MARY MENDEZ','14936853','14936853','+58','(041) 245-6822',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,4,3,'2026-03-07','2026-03-07','C',NULL,NULL,'sinfoto.png'),
 (304,'STEFANNY VIVAS','30842554','30842554','+58','(412) 072-2550',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-03-19','2026-03-19','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (305,'GENSYMAR GANVOA','25154168','25154168','+58','(042) 472-7412',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-03-22','2026-06-20','C',NULL,NULL,'sinfoto.png'),
 (306,'MARIA CAÑIZARES','30788895','30788895','+58','(041) 259-4635',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-03-26','2026-04-25','C',NULL,NULL,'sinfoto.png'),
 (307,'ROBER MOLINA','18208406','18208406','+58','(042) 472-0510',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-04-01','2026-04-01','C',NULL,NULL,'sinfoto.png'),
 (308,'MARLENY MOLINA','13831659','13831659','+58','(042) 475-6263',NULL,1,'A','CANAGUA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-04-04','2026-04-04','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (309,'MELANY ZAMBRANO','28722705','28722705','+58','(042) 473-6261',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-04-11','2026-04-11','C',NULL,NULL,'sinfoto.png'),
 (310,'KARIN MONTES','19046361','19046361','+58','(042) 477-9821',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-04-14','2026-04-14','C',NULL,NULL,'sinfoto.png'),
 (311,'MIRELY MARQUEZ','2815168','2815168','58','(041) 263-7504',NULL,1,'A','MESA QUINTERO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,4,3,'2026-04-15','2026-04-15','C',NULL,NULL,'sinfoto.png'),
 (312,'MARIA PEREZ','17770496','17770496','58','(424) 710-3096',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-04-15','2026-04-15','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (313,'AILYN PEREIRA','22547634','22547634','+58','(412) 377-2858',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,6,3,'2026-04-25',NULL,'C',NULL,NULL,'sinfoto.png'),
 (314,'DAMIANA MOLINA','31620048','31620048','+58','(412) 071-8015',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-04-25','2026-04-25','C',NULL,NULL,'sinfoto.png'),
 (315,'MARIA QUINTERO','8710595','8710595','+58','(042) 477-2844',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-05-06','2026-05-06','C',NULL,NULL,'sinfoto.png'),
 (316,'LORENA MOLINO','26589808','26589808','+58','(041) 237-7285',NULL,1,'A','SANTA CRUZ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-05-06','2026-05-06','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (317,'AIDE ROJAS','16907780','16907780','+58','(041) 687-0876',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-05-15','2026-05-15','C',NULL,NULL,'sinfoto.png'),
 (318,'`MAYERLI DUARTE','20396593','20396593','+58','(041) 437-5502',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-05-15','2026-05-15','C',NULL,NULL,'sinfoto.png'),
 (319,'JUNIOR ANDRADE','28692724','28692724','+58','(041) 245-6538',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2026-05-16','2026-06-13','C',NULL,NULL,'sinfoto.png'),
 (320,'VANESA ROJAS','31459451','31459451','+58','(042) 473-3570',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-05-19','2026-05-19','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (321,'JENNY MOLINA','14623039','14623039','+58','(041) 258-2903',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2026-05-20',NULL,'C',NULL,NULL,'sinfoto.png'),
 (322,'ANDREA COLMENARES','27581021','27581021','+58','(041) 207-3237',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-05-23','2026-06-13','C',NULL,NULL,'sinfoto.png'),
 (323,'VERONICA QUINTERO','31622154','31622154','+58','(042) 473-5874',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-05-27','2026-05-27','C',NULL,NULL,'sinfoto.png'),
 (324,'MARIELA RONDON','27145937','27145937','+58','(042) 471-3331',NULL,1,'A','santa cruz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-06-04','2026-06-04','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (325,'HEYDI MARQUEZ','19048616','19048616','+58','(041) 474-8619',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-06-05','2026-06-05','C',NULL,NULL,'sinfoto.png'),
 (326,'LUDEISY MENDEZ','23724244','23724244','+58','(041) 475-9049',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-06-05','2026-06-05','C',NULL,NULL,'sinfoto.png'),
 (327,'MARIA MOLINA','30914957','30914957','+58','(041) 276-7633',NULL,1,'A','santa curz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-06-06','2026-06-06','C',NULL,NULL,'sinfoto.png'),
 (328,'TATIANA PEÑA','27310242','27310242','+58','(041) 242-5740',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-06-15','2026-06-15','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (329,'LUZ VIELMA','21330987','21330987','+58','(041) 623-7791',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-06-15','2026-09-16','C',NULL,NULL,'sinfoto.png'),
 (330,'YOSELIN ALTUVE','20218795','20218795','+58','(042) 478-7665',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-06-19','2026-08-29','C',NULL,NULL,'sinfoto.png'),
 (331,'MARIA ONTIVEROS','26880071','26880071','+58','(042) 474-4607',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2026-06-19','2026-06-19','C',NULL,NULL,'sinfoto.png'),
 (332,'LUIS MORENO','0000000000','0000000000','+58','(000) 000-0000',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-06-19',NULL,'C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (333,'YEIMARI HERRERA','27908015','27908015','+58','(041) 204-4214',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-06-20','2026-06-20','C',NULL,NULL,'sinfoto.png'),
 (334,'LUIS ALFREDO MORENO ROA','30685938','30685938','+58','(426) 428-9801',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2026-06-20','2026-06-20','C',NULL,NULL,'sinfoto.png'),
 (335,'PATRICIA PINO','27933853','27933853','+58','(041) 470-9883',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-06-27','2026-06-27','C',NULL,NULL,'sinfoto.png'),
 (336,'MARIA CABALLERO','18208776','18208776','+58','(042) 696-2870',NULL,1,'A','santa cruz d emora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-06-29','2026-06-29','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (337,'PAOLA MONTES','28151805','28151805','+58','(041) 244-5939',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-06-29','2026-06-29','C',NULL,NULL,'sinfoto.png'),
 (338,'JASMIN MENDEZ','24195200','24195200','+58','(042) 473-8528',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-07-02','2026-07-02','C',NULL,NULL,'sinfoto.png'),
 (339,'LUZMARINA MARQUEZ','8714174','8714174','+58','(041) 691-7995',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,6,3,'2026-07-09','2026-07-09','C',NULL,NULL,'sinfoto.png'),
 (340,'YENIFER GUERRERO','27581976','27581976','+58','(041) 470-1944',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-07-10','2026-07-10','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (341,'BLANCA ROSALES','24350513','24350513','+58','(042) 474-5989',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-07-15','2026-08-08','C',NULL,NULL,'sinfoto.png'),
 (342,'MARIA MOLINA','28703693','28703693','+58','(041) 475-4397',NULL,1,'A','SANTA CRY¡UZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-07-18','2026-07-18','C',NULL,NULL,'sinfoto.png'),
 (343,'GENESIS MANRIQUE','22547639','22547639','+58','(042) 415-6385',NULL,1,'A','SABTA CRUZ DE MORN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,3,3,'2026-07-18','2026-09-01','C',NULL,NULL,'sinfoto.png'),
 (344,'LIRIO MOLINA','8710571','8710571','+58','(042) 470-9989',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-07-18','2026-07-18','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (345,'ROSANGEL CONTRERAS','26285665','26285665','+58','(042) 473-9832',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-07-19','2026-08-04','C',NULL,NULL,'sinfoto.png'),
 (346,'ELY RAMIREZ','12345677','000000000000','+58','(422) 743-0440',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,5,0.000,1,0,3,3,'2026-07-28','2026-09-17','C',NULL,NULL,'sinfoto.png'),
 (347,'NORERKI MILANO','26864533','26864533','+58','(412) 879-7711',NULL,1,'A','santa cruz de mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-08-06',NULL,'C',NULL,NULL,'sinfoto.png'),
 (348,'MARIA DUARTE','15694443','15694443','+58','(041) 616-408_',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-08-12','2026-08-15','C',NULL,NULL,'sinfoto.png');
INSERT INTO `clientes` (`id_cliente`,`nombre`,`cedula`,`rif`,`codpais`,`telefono`,`licencia`,`catcomercial`,`status`,`direccion`,`casa`,`avenida`,`barrio`,`ciudad`,`municipio`,`entidad`,`codpostal`,`latitud`,`longitud`,`tipo_cliente`,`diascredito`,`limitecre`,`tipo_precio`,`retencion`,`vendedor`,`ruta`,`creado`,`lastfact`,`tipo`,`contacto`,`telcontacto`,`imagen`) VALUES 
 (349,'ANDRELI RONDON','26589965','26589965','+58','(041) 408-0747',NULL,1,'A','EL ANIS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-08-15','2026-08-15','C',NULL,NULL,'sinfoto.png'),
 (350,'MARINA SOTO','12799003','12799003','+58','(042) 476-8304',NULL,1,'A','santa cruz de  mora',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-08-20','2026-09-21','C',NULL,NULL,'sinfoto.png'),
 (351,'ARIANA LISETH','1111111111','1111111111','+58','(333) 333-3333',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',0,0,0.000,1,0,3,3,'2026-08-21','2026-08-21','C',NULL,NULL,'sinfoto.png'),
 (352,'ANGELICA FLORES','20397432','20397432','+57','(311) 421-0272',NULL,1,'A','SANTA CRUZ DE MORA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00000000','0.00000000',1,0,0.000,1,0,3,3,'2026-09-01','2026-09-01','C',NULL,NULL,'sinfoto.png');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`comisiones`
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
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  PRIMARY KEY (`id_comision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`comisiones`
--

/*!40000 ALTER TABLE `comisiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `comisiones` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`compras`
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
  `diascre` int(11) DEFAULT '10',
  `nota` varchar(200) DEFAULT NULL,
  `estatus` varchar(15) NOT NULL DEFAULT '0',
  `tasa` float(9,3) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcompra`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`compras`
--

/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` (`idcompra`,`idproveedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`fecha_hora`,`emision`,`impuesto`,`total`,`base`,`miva`,`exento`,`saldo`,`retenido`,`condicion`,`diascre`,`nota`,`estatus`,`tasa`,`user`) VALUES 
 (1,1,'FAC','01','01','2025-11-13','2025-11-13',16,2108.38,0.000,0.000,2108.380,0.00,0.000,'Credito',10,NULL,'0',203.740,'Administracion'),
 (2,2,'FAC','01','01','2025-11-24','2025-11-24',16,308.00,0.000,0.000,308.000,0.00,0.000,'Credito',10,NULL,'0',236.840,'Administracion'),
 (3,3,'FAC','01','01','2025-11-25','2025-11-25',16,2697.55,0.000,0.000,2697.550,0.00,0.000,'Credito',10,NULL,'0',236.840,'Administracion'),
 (4,3,'FAC','01','01','2025-11-27','2025-11-27',16,639.44,0.000,0.000,639.440,0.00,0.000,'Credito',10,NULL,'0',236.840,'Administracion'),
 (5,4,'FAC','01','01','2025-12-01','2025-12-01',16,923.00,0.000,0.000,923.000,0.00,0.000,'Credito',10,NULL,'0',236.840,'Administracion'),
 (6,3,'FAC','01','01','2025-12-01','2025-12-01',16,1516.63,0.000,0.000,1516.630,0.00,0.000,'Credito',10,NULL,'0',236.840,'Administracion'),
 (7,5,'FAC','01','01','2025-12-03','2025-12-03',16,462.05,0.000,0.000,462.050,0.00,0.000,'Credito',10,NULL,'0',236.840,'Administracion');
INSERT INTO `compras` (`idcompra`,`idproveedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`fecha_hora`,`emision`,`impuesto`,`total`,`base`,`miva`,`exento`,`saldo`,`retenido`,`condicion`,`diascre`,`nota`,`estatus`,`tasa`,`user`) VALUES 
 (8,6,'FAC','01','00000002','2025-12-17','2025-12-17',16,216.00,0.000,0.000,216.000,0.00,0.000,'Credito',10,NULL,'0',276.580,'Administracion'),
 (9,5,'FAC','01','01','2025-12-22','2025-12-22',16,917.10,0.000,0.000,917.100,0.00,0.000,'Credito',10,NULL,'0',285.400,'Administracion'),
 (10,3,'FAC','01','01','2026-01-31','2026-01-31',16,63.07,0.000,0.000,63.070,0.00,0.000,'Credito',10,NULL,'0',370.250,'Administracion'),
 (11,3,'FAC','01','01','2026-02-18','2026-02-18',16,691.99,0.000,0.000,807.010,0.00,0.000,'Credito',10,NULL,'0',396.370,'Administracion'),
 (12,3,'FAC','01','01','2026-06-08','2026-06-08',16,686.09,0.000,0.000,686.090,0.00,0.000,'Credito',10,NULL,'0',567.680,'Administracion'),
 (13,5,'FAC','01','01','2026-06-17','2026-06-17',16,326.00,0.000,0.000,326.000,0.00,0.000,'Credito',10,NULL,'0',592.520,'Administracion'),
 (14,3,'FAC','01','01','2026-07-01','2026-07-01',16,680.57,0.000,0.000,680.570,0.00,0.000,'Credito',10,NULL,'0',623.020,'Administracion');
INSERT INTO `compras` (`idcompra`,`idproveedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`fecha_hora`,`emision`,`impuesto`,`total`,`base`,`miva`,`exento`,`saldo`,`retenido`,`condicion`,`diascre`,`nota`,`estatus`,`tasa`,`user`) VALUES 
 (15,3,'FAC','01','01','2026-08-25','2026-08-25',16,1203.30,0.000,0.000,1203.300,0.00,0.000,'Credito',10,NULL,'0',785.070,'Administracion'),
 (16,10,'FAC','01','01','2026-09-10','2026-09-10',16,283.99,0.000,0.000,283.990,232.78,0.000,'Credito',10,NULL,'0',827.740,'Administracion');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`comprobante`
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`comprobante`
--

/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (1,7,0,0,462.00,1,'Dolares',0,462.000,276.58,4000.000,NULL,'0.00','2025-12-18 00:00:00'),
 (2,7,0,0,0.05,16,'DESC. FACT.',0,0.050,276.58,4000.000,NULL,'0.00','2025-12-18 00:00:00'),
 (3,8,0,0,216.00,1,'Dolares',0,216.000,276.58,4000.000,NULL,'0.00','2025-12-18 00:00:00'),
 (4,0,1,0,40.00,1,'Dolares',0,40.000,276.58,4000.000,NULL,'0.00','2025-12-18 00:00:00'),
 (5,0,2,0,2.00,1,'Dolares',0,2.000,276.58,4000.000,NULL,'0.00','2025-12-18 00:00:00'),
 (6,0,3,0,5.00,1,'Dolares',0,5.000,285.40,4000.000,NULL,'0.00','2025-12-21 13:17:42'),
 (7,0,4,0,4.00,1,'Dolares',0,4.000,285.40,4000.000,NULL,'0.00','2025-12-22 16:52:21'),
 (8,0,5,0,22.00,4,'Bolivares Efect.',0,6489.120,294.96,4000.000,'Tc: 294.96','0.00','2025-12-28 10:07:14'),
 (9,0,6,0,8.00,4,'Bolivares Efect.',0,2359.680,294.96,4000.000,'Tc: 294.96','0.00','2025-12-28 10:08:00'),
 (10,0,7,0,8.00,4,'Bolivares Efect.',0,2359.680,294.96,4000.000,'Tc: 294.96','0.00','2025-12-28 10:08:40');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (11,0,8,0,5.00,1,'Dolares',0,5.000,301.37,4000.000,NULL,'0.00','2025-12-30 19:48:28'),
 (12,0,9,0,72.00,1,'Dolares',0,72.000,370.25,4000.000,NULL,'73','2026-01-31 13:05:17'),
 (13,0,10,0,1.00,2,'Dolares Transf.',0,1.000,388.74,4000.000,NULL,'0.00','2026-02-11 17:36:00'),
 (14,0,11,0,1.00,1,'Dolares',0,1.000,396.37,4000.000,NULL,'0.00','2026-02-18 12:32:21'),
 (15,0,12,0,130.00,13,'transferencia bnc',0,51528.102,396.37,4000.000,'Tc: 396.37','0.00','2026-02-18 12:33:32'),
 (16,0,13,0,75.00,13,'transferencia bnc',0,29727.750,396.37,4000.000,'Tc: 396.37','0.00','2026-02-18 12:33:58'),
 (17,0,14,0,75.00,13,'transferencia bnc',0,29727.750,396.37,4000.000,'Tc: 396.37','0.00','2026-02-18 12:35:01'),
 (18,0,15,0,20.00,1,'Dolares',0,20.000,407.38,4000.000,NULL,'0.00','2026-02-24 16:37:35'),
 (19,0,16,0,20.00,1,'Dolares',0,20.000,411.08,4000.000,NULL,'0.00','2026-02-25 10:13:10'),
 (20,0,18,0,15.00,1,'Dolares',0,15.000,417.36,4000.000,NULL,'0.00','2026-02-27 15:03:18');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (21,0,19,0,62.00,1,'Dolares',0,62.000,427.93,4000.000,NULL,'0.00','2026-03-05 14:05:25'),
 (22,0,20,0,59.00,1,'Dolares',0,59.000,433.17,4000.000,NULL,'0.00','2026-03-07 14:36:03'),
 (23,0,21,0,50.00,1,'Dolares',0,50.000,433.17,4000.000,NULL,'0.00','2026-03-07 17:49:32'),
 (24,5,0,0,923.00,1,'Dolares',0,923.000,433.17,4000.000,NULL,'0.00','2026-03-07 00:00:00'),
 (25,9,0,0,917.10,1,'Dolares',0,917.100,433.17,4000.000,NULL,'0.00','2026-03-07 00:00:00'),
 (26,2,0,0,308.00,1,'Dolares',0,308.000,433.17,4000.000,NULL,'0.00','2026-03-07 00:00:00'),
 (27,3,0,0,24.90,1,'Dolares',0,24.900,433.17,4000.000,NULL,'2672.65','2026-03-07 00:00:00'),
 (28,4,0,0,639.44,13,'transferencia bnc',0,319720.000,433.17,4000.000,'Tc: 500','0.00','2026-03-07 00:00:00'),
 (29,10,0,0,63.07,13,'transferencia bnc',0,31535.000,433.17,4000.000,'Tc: 500','0.00','2026-03-07 00:00:00'),
 (30,11,0,0,691.99,13,'transferencia bnc',0,345995.000,433.17,4000.000,'Tc: 500','0.00','2026-03-07 00:00:00');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (31,6,0,0,16.03,13,'transferencia bnc',0,8016.000,433.17,4000.000,'Tc: 500','1500.60','2026-03-07 00:00:00'),
 (32,3,0,0,481.50,1,'Dolares',0,481.500,433.17,4000.000,NULL,'2191.15','2026-03-07 00:00:00'),
 (33,3,0,0,54.00,1,'Dolares',0,54.000,433.17,4000.000,NULL,'2137.15','2026-03-07 00:00:00'),
 (34,3,0,0,19.00,1,'Dolares',0,19.000,433.17,4000.000,NULL,'2118.15','2026-03-07 00:00:00'),
 (35,0,22,0,130.00,13,'transferencia bnc',0,59182.500,455.25,4000.000,'Tc: 455.25','0.00','2026-03-19 16:57:36'),
 (36,0,23,0,75.00,13,'transferencia bnc',0,34143.750,455.25,4000.000,'Tc: 455.25','0.00','2026-03-19 16:58:58'),
 (37,0,24,0,1.00,4,'Bolivares Efect.',0,370.000,370.00,4000.000,'Tc: 370','0.00','2026-04-04 11:21:17'),
 (38,0,25,0,50.00,1,'Dolares',0,50.000,474.06,4000.000,NULL,'0.00','2026-04-04 11:26:24'),
 (39,0,26,0,9.00,4,'Bolivares Efect.',0,4275.090,475.01,4000.000,'Tc: 475.01','0.00','2026-04-08 13:53:38'),
 (40,0,27,0,1.60,4,'Bolivares Efect.',0,760.020,475.01,4000.000,'Tc: 475.01','0.00','2026-04-08 15:55:26');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (41,0,28,0,25.00,1,'Dolares',0,25.000,475.96,4000.000,NULL,'0.00','2026-04-09 14:34:32'),
 (42,0,29,0,3.00,4,'Bolivares Efect.',0,1429.290,476.43,4000.000,'Tc: 476.43','0.00','2026-04-10 10:18:21'),
 (43,0,30,0,60.00,1,'Dolares',0,60.000,480.26,4000.000,NULL,'0.00','2026-04-17 13:36:21'),
 (44,0,31,0,104.00,1,'Dolares',0,104.000,480.26,4000.000,NULL,'0.00','2026-04-17 13:38:01'),
 (45,0,32,0,50.00,1,'Dolares',0,50.000,480.26,4000.000,NULL,'0.00','2026-04-17 16:59:00'),
 (46,0,33,0,20.00,1,'Dolares',0,20.000,483.34,4000.000,NULL,'0.00','2026-04-23 10:24:00'),
 (47,0,34,0,3.61,4,'Bolivares Efect.',0,1749.910,484.74,4000.000,'Tc: 484.74','0.00','2026-04-25 17:14:36'),
 (48,0,35,0,60.00,1,'Dolares',0,60.000,489.55,4000.000,NULL,'0.00','2026-05-02 17:41:16'),
 (49,0,36,0,50.00,1,'Dolares',0,50.000,499.86,4000.000,NULL,'0.00','2026-05-09 09:53:41'),
 (50,0,37,0,20.00,1,'Dolares',0,20.000,504.91,4000.000,NULL,'0.00','2026-05-12 14:26:38');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (51,0,38,0,1.00,4,'Bolivares Efect.',0,510.790,510.79,4000.000,'Tc: 510.79','0.00','2026-05-14 11:59:56'),
 (52,0,38,0,2.00,1,'Dolares',0,2.000,510.79,4000.000,NULL,'0.00','2026-05-14 11:59:56'),
 (53,0,39,0,25.00,1,'Dolares',0,25.000,517.96,4000.000,NULL,'0.00','2026-05-16 00:00:00'),
 (54,0,40,0,2.00,1,'Dolares',0,2.000,557.97,4000.000,NULL,'0.00','2026-06-02 15:16:45'),
 (55,0,41,0,100.00,13,'transferencia bnc',0,51796.000,557.97,4000.000,'Tc: 517.96','0.00','2026-06-02 15:21:06'),
 (56,0,42,0,150.00,13,'transferencia bnc',0,83164.500,557.97,4000.000,'Tc: 554.43','0.00','2026-06-02 15:22:26'),
 (57,0,43,0,50.00,1,'Dolares',0,50.000,557.97,4000.000,NULL,'0.00','2026-06-02 15:23:39'),
 (58,0,44,0,1.00,3,'Pesos',0,4000.000,563.29,4000.000,'Tc: 4000','0.00','2026-06-05 10:14:16'),
 (59,12,0,0,504.00,1,'Dolares',0,504.000,567.68,4000.000,NULL,'2.09','2026-06-08 15:28:54'),
 (60,12,0,0,180.00,1,'Dolares',0,180.000,567.68,4000.000,NULL,'2.09','2026-06-08 15:28:54');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (61,0,45,0,5.00,1,'Dolares',0,5.000,572.68,4000.000,NULL,'0.00','2026-06-10 00:00:00'),
 (62,0,46,0,2.00,1,'Dolares',0,2.000,587.41,4000.000,NULL,'0.00','2026-06-15 14:38:52'),
 (63,0,47,0,20.00,1,'Dolares',0,20.000,592.52,4000.000,NULL,'0.00','2026-06-17 16:43:05'),
 (64,0,47,0,110.00,13,'transferencia bnc',0,75647.000,592.52,4000.000,'Tc: 687.7','0.00','2026-06-17 16:43:05'),
 (65,13,0,0,320.00,1,'Dolares',0,320.000,592.52,4000.000,NULL,'6.00','2026-06-17 16:51:33'),
 (66,14,0,0,85.00,1,'Dolares',0,85.000,623.02,4000.000,NULL,'275.57','2026-07-01 18:31:16'),
 (67,14,0,0,280.00,1,'Dolares',0,280.000,623.02,4000.000,NULL,'275.57','2026-07-01 18:31:17'),
 (68,14,0,0,40.00,1,'Dolares',0,40.000,623.02,4000.000,NULL,'275.57','2026-07-01 18:31:17'),
 (69,0,48,0,20.00,1,'Dolares',0,20.000,623.02,4000.000,NULL,'0.00','2026-07-01 18:33:14'),
 (70,0,49,0,118.00,13,'transferencia bnc',0,85345.859,623.02,4000.000,'Tc: 723.27','0.00','2026-07-01 18:35:57');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (71,0,50,0,35.00,1,'Dolares',0,35.000,633.36,4000.000,NULL,'0.00','2026-07-01 18:37:27'),
 (72,0,51,0,50.00,1,'Dolares',0,50.000,667.05,4000.000,NULL,'0.00','2026-07-04 15:59:40'),
 (73,0,52,0,130.00,1,'Dolares',0,130.000,732.48,4000.000,NULL,'0.00','2026-07-17 10:16:23'),
 (74,0,53,0,4.00,1,'Dolares',0,4.000,736.93,4000.000,NULL,'0.00','2026-07-18 10:20:43'),
 (75,14,0,0,225.00,1,'Dolares',0,225.000,736.93,4000.000,NULL,'50.57','2026-07-11 00:00:00'),
 (76,3,0,0,300.00,1,'Dolares',0,300.000,742.23,4000.000,NULL,'1818.15','2026-07-24 00:00:00'),
 (77,0,55,0,50.00,1,'Dolares',0,50.000,748.79,4000.000,NULL,'0.00','2026-08-01 14:04:31'),
 (78,0,56,0,140.00,13,'transferencia bnc',0,120566.602,861.19,4000.000,'Tc: 861.19','0.00','2026-08-01 14:35:37'),
 (79,0,57,0,9.97,13,'transferencia bnc',0,8524.350,855.00,4000.000,'Tc: 855','0.00','2026-08-01 00:00:00'),
 (80,0,58,0,2.00,1,'Dolares',0,2.000,855.00,4000.000,NULL,'0.00','2026-08-01 15:03:57');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (81,0,59,0,34.00,1,'Dolares',0,34.000,748.79,4000.000,NULL,'0.00','2026-08-03 16:47:57'),
 (82,14,0,0,50.00,1,'Dolares',0,50.000,756.71,4000.000,NULL,'0.57','2026-08-07 00:00:00'),
 (83,0,9,0,73.00,2,'Dolares Transf.',0,73.000,756.71,4000.000,NULL,'0.00','2026-08-08 00:00:00'),
 (84,0,17,0,25.00,1,'Dolares',0,25.000,756.71,4000.000,NULL,'0.00','2026-08-08 00:00:00'),
 (85,0,54,0,35.00,1,'Dolares',0,35.000,756.71,4000.000,NULL,'0.00','2026-08-08 00:00:00'),
 (86,13,0,0,6.00,1,'Dolares',0,6.000,756.71,4000.000,NULL,'0.00','2026-08-08 00:00:00'),
 (87,3,0,0,1818.15,1,'Dolares',0,1818.150,756.71,4000.000,NULL,'0.00','2026-08-08 00:00:00'),
 (88,6,0,0,1500.60,1,'Dolares',0,1500.600,756.71,4000.000,NULL,'0.00','2026-08-08 00:00:00'),
 (89,12,0,0,2.09,1,'Dolares',0,2.090,756.71,4000.000,NULL,'0.00','2026-08-08 00:00:00'),
 (90,14,0,0,0.57,1,'Dolares',0,0.570,756.71,4000.000,NULL,'0.00','2026-08-08 00:00:00');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (91,0,60,0,130.00,1,'Dolares',0,130.000,772.54,4000.000,NULL,'0.00','2026-08-15 14:32:05'),
 (92,0,61,0,75.00,13,'transferencia bnc',0,67086.750,894.49,4000.000,'Tc: 894.49','0.00','2026-08-22 09:10:10'),
 (93,0,62,0,3.00,1,'Dolares',0,3.000,784.66,4000.000,NULL,'0.00','2026-08-24 13:59:44'),
 (94,0,63,0,50.00,1,'Dolares',0,50.000,798.33,4000.000,NULL,'0.00','2026-09-01 10:13:32'),
 (95,0,64,0,120.00,1,'Dolares',0,120.000,798.33,4000.000,NULL,'0.00','2026-09-01 10:40:47'),
 (96,0,65,0,10.60,1,'Dolares',0,10.600,807.39,4000.000,NULL,'0.00','2026-09-04 09:30:05'),
 (97,0,66,0,47.50,13,'transferencia bnc',0,46550.000,980.00,4000.000,'Tc: 980','0.00','2026-09-16 15:28:55'),
 (98,0,67,0,74.78,13,'transferencia bnc',0,73284.398,980.00,4000.000,'Tc: 980','0.00','2026-09-16 15:35:09'),
 (99,0,68,0,10.67,13,'transferencia bnc',0,9032.260,846.51,4000.000,'Tc: 846.51','0.00','2026-09-16 15:40:17'),
 (100,0,69,0,130.00,1,'Dolares',0,130.000,846.51,4000.000,NULL,'0.00','2026-09-17 09:18:26');
INSERT INTO `comprobante` (`idrecibo`,`idcompra`,`idgasto`,`idnota`,`monto`,`idpago`,`idbanco`,`id_banco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha_comp`) VALUES 
 (101,15,0,0,260.00,1,'Dolares',0,260.000,852.42,4000.000,NULL,'943.30','2026-09-22 00:00:00'),
 (102,0,70,0,5.00,1,'Dolares',0,5.000,852.42,4000.000,NULL,'0.00','2026-09-22 15:57:19'),
 (103,15,0,0,160.00,1,'Dolares',0,160.000,852.42,4000.000,NULL,'783.30','2026-09-24 00:00:00'),
 (104,15,0,0,783.30,2,'Dolares Transf.',0,783.300,860.01,4000.000,NULL,'0.00','2026-10-01 00:00:00'),
 (105,16,0,0,51.21,2,'Dolares Transf.',0,51.210,860.01,4000.000,NULL,'232.78','2026-10-01 00:00:00'),
 (106,0,71,0,40.00,1,'Dolares',0,40.000,866.56,4000.000,NULL,'10.00','2026-10-03 09:21:00');
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`ctascon`
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`ctascon`
--

/*!40000 ALTER TABLE `ctascon` DISABLE KEYS */;
INSERT INTO `ctascon` (`idcod`,`codigo`,`descrip`,`tipo`,`inactiva`) VALUES 
 (2,'0000020000','Ingreso Cobranza',1,0),
 (3,'000003000','Pago a Proveedores',2,0),
 (1,'00001000','Ingreso Ventas',1,0),
 (10,'00090000','Nota Administrativa CXC',2,0),
 (12,'0090000','Pago a Accionistas',2,0),
 (13,'01','AJUSTE',2,0),
 (11,'0900090','Otros Ingresos',1,0),
 (9,'10001000','Ingreso Nota Administrativa',1,0),
 (5,'100010000','Transferencia bancos',3,0),
 (14,'12','PRESTAMO',3,0),
 (4,'988777','Egreso Gastos',2,0),
 (7,'98987','Egreso Pago Compras',2,0),
 (8,'99000','Pago Comisiones',2,0);
/*!40000 ALTER TABLE `ctascon` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`datacsv`
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
-- Dumping data for table `svwebkids`.`datacsv`
--

/*!40000 ALTER TABLE `datacsv` DISABLE KEYS */;
/*!40000 ALTER TABLE `datacsv` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`detalle_ajustes`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`detalle_ajustes`
--

/*!40000 ALTER TABLE `detalle_ajustes` DISABLE KEYS */;
INSERT INTO `detalle_ajustes` (`iddetalle_ajuste`,`idajuste`,`idarticulo`,`tipo_ajuste`,`cantidad`,`costo`,`valorizado`) VALUES 
 (1,1,61,'Cargo',1.000,15.00,15.00),
 (2,2,139,'Cargo',4.000,1.26,5.04);
/*!40000 ALTER TABLE `detalle_ajustes` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`detalle_apartado`
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`detalle_apartado`
--

/*!40000 ALTER TABLE `detalle_apartado` DISABLE KEYS */;
INSERT INTO `detalle_apartado` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`cantidad`,`precio_venta`,`descuento`,`fecha`,`fecha_emi`) VALUES 
 (1,1,97,13.000,2.00,18.000,0.00,'2025-12-08 16:04:59','2025-12-08'),
 (2,2,107,7.500,1.00,17.500,0.00,'2025-12-08 16:26:50','2025-12-08'),
 (3,3,47,19.970,1.00,34.000,0.00,'2025-12-09 09:25:24','2025-12-09'),
 (4,4,95,10.000,1.00,20.000,0.00,'2025-12-09 09:26:32','2025-12-09'),
 (5,5,14,11.600,1.00,20.000,0.00,'2025-12-09 09:27:59','2025-12-09'),
 (6,5,51,20.660,1.00,35.000,0.00,'2025-12-09 09:27:59','2025-12-09'),
 (7,5,50,12.700,1.00,25.000,0.00,'2025-12-09 09:27:59','2025-12-09'),
 (8,5,54,17.330,1.00,31.000,0.00,'2025-12-09 09:27:59','2025-12-09'),
 (9,6,48,30.710,1.00,47.000,0.00,'2025-12-10 19:13:03','2025-12-10'),
 (10,6,97,13.000,1.00,24.000,0.00,'2025-12-10 19:13:03','2025-12-10'),
 (11,6,46,7.700,1.00,17.000,0.00,'2025-12-10 19:13:03','2025-12-10'),
 (12,6,48,30.710,1.00,47.000,0.00,'2025-12-10 19:13:03','2025-12-10'),
 (13,6,42,23.010,1.00,38.000,0.00,'2025-12-10 19:13:03','2025-12-10'),
 (14,7,42,23.010,1.00,30.000,0.00,'2025-12-13 17:40:03','2025-12-13');
INSERT INTO `detalle_apartado` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`cantidad`,`precio_venta`,`descuento`,`fecha`,`fecha_emi`) VALUES 
 (15,8,48,30.710,1.00,35.000,0.00,'2025-12-14 10:17:28','2025-12-14'),
 (16,9,48,30.710,1.00,35.000,0.00,'2025-12-14 12:30:42','2025-12-14'),
 (17,9,96,17.000,1.00,23.000,0.00,'2025-12-14 12:30:42','2025-12-14'),
 (18,10,46,7.700,1.00,20.000,0.00,'2025-12-17 15:59:04','2025-12-17'),
 (19,11,40,15.400,1.00,25.000,0.00,'2025-12-20 14:01:27','2025-12-20'),
 (20,11,94,5.400,1.00,15.000,0.00,'2025-12-20 14:01:27','2025-12-20'),
 (21,12,40,15.400,1.00,30.000,0.00,'2025-12-20 14:11:00','2025-12-20'),
 (22,12,94,5.400,1.00,15.000,0.00,'2025-12-20 14:11:00','2025-12-20'),
 (23,13,4,1.000,1.00,4.000,0.00,'2025-12-20 16:55:03','2025-12-20'),
 (24,14,59,3.640,1.00,7.000,0.00,'2025-12-20 18:57:10','2025-12-20'),
 (25,15,59,3.640,1.00,7.000,0.00,'2025-12-20 18:59:47','2025-12-20'),
 (26,16,40,15.400,1.00,25.000,0.00,'2025-12-20 19:44:03','2025-12-20'),
 (27,16,94,5.400,1.00,10.000,0.00,'2025-12-20 19:44:03','2025-12-20');
INSERT INTO `detalle_apartado` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`cantidad`,`precio_venta`,`descuento`,`fecha`,`fecha_emi`) VALUES 
 (28,17,60,10.130,1.00,15.000,0.00,'2026-01-24 11:36:24','2026-01-24'),
 (29,18,108,18.000,1.00,25.000,0.00,'2026-02-18 14:07:58','2026-02-18'),
 (30,19,113,3.320,1.00,15.000,0.00,'2026-03-31 16:06:14','2026-03-31'),
 (31,20,2,2.000,1.00,7.000,0.00,'2026-04-15 14:27:02','2026-04-15'),
 (32,21,113,3.320,1.00,15.000,0.00,'2026-04-24 09:37:56','2026-04-24'),
 (33,22,85,12.000,1.00,18.000,0.00,'2026-04-24 09:42:49','2026-04-24'),
 (34,23,1,0.970,1.00,4.000,0.00,'2026-04-29 17:14:37','2026-04-29'),
 (35,24,31,19.240,1.00,25.000,0.00,'2026-05-20 17:00:07','2026-05-20'),
 (36,25,16,5.000,1.00,10.000,0.00,'2026-06-12 13:50:08','2026-06-12'),
 (37,26,36,5.600,1.00,12.000,0.00,'2026-06-18 15:59:44','2026-06-18'),
 (38,27,48,30.710,1.00,35.000,0.00,'2026-07-03 09:41:23','2026-07-03'),
 (39,28,61,13.340,1.00,20.000,0.00,'2026-07-15 17:25:06','2026-07-15'),
 (40,29,126,13.050,1.00,23.000,0.00,'2026-08-01 10:36:16','2026-08-01');
INSERT INTO `detalle_apartado` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`cantidad`,`precio_venta`,`descuento`,`fecha`,`fecha_emi`) VALUES 
 (41,30,123,11.080,1.00,20.000,0.00,'2026-08-06 10:00:08','2026-08-06'),
 (42,31,99,14.850,1.00,20.000,0.00,'2026-08-08 09:17:56','2026-08-08'),
 (43,32,61,13.340,1.00,20.000,0.00,'2026-08-12 11:45:14','2026-08-12'),
 (44,32,141,23.460,1.00,30.000,0.00,'2026-08-12 11:45:14','2026-08-12'),
 (45,33,147,12.700,1.00,20.000,0.00,'2026-09-25 17:48:36','2026-09-25');
/*!40000 ALTER TABLE `detalle_apartado` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE `detalle_compras` (
  `iddetalle_compra` int(11) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` float(11,2) NOT NULL,
  `precio_compra` float(11,2) NOT NULL,
  `descuento` float(9,3) DEFAULT '0.000',
  `precio` double(15,3) DEFAULT '0.000',
  `precio_tasa` float(9,3) DEFAULT NULL,
  `precio_venta` float(11,2) DEFAULT NULL,
  `subtotal` float(9,3) DEFAULT '0.000',
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`iddetalle_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`detalle_compras`
--

/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (1,1,1,20.00,0.83,0.000,0.830,169.100,0.00,16.600,'2025-11-13'),
 (2,1,2,4.00,2.00,0.000,2.000,407.480,NULL,8.000,'2025-11-13'),
 (3,1,3,3.00,0.89,0.000,0.890,181.330,NULL,2.670,'2025-11-13'),
 (4,1,4,3.00,1.00,0.000,1.000,203.740,NULL,3.000,'2025-11-13'),
 (5,1,5,2.00,2.21,0.000,2.210,450.270,NULL,4.420,'2025-11-13'),
 (6,1,6,8.00,2.60,0.000,2.600,529.720,NULL,20.800,'2025-11-13'),
 (7,1,7,1.00,2.80,0.000,2.800,570.470,NULL,2.800,'2025-11-13'),
 (8,1,8,3.00,5.00,0.000,5.000,1018.700,NULL,15.000,'2025-11-13'),
 (9,1,9,1.00,1.00,0.000,1.000,203.740,NULL,1.000,'2025-11-13'),
 (10,1,10,7.00,1.00,0.000,1.000,203.740,NULL,7.000,'2025-11-13'),
 (11,1,11,1.00,8.00,0.000,8.000,1629.920,NULL,8.000,'2025-11-13'),
 (12,1,12,9.00,1.50,0.000,1.500,305.610,NULL,13.500,'2025-11-13'),
 (13,1,13,4.00,1.00,0.000,1.000,203.740,NULL,4.000,'2025-11-13'),
 (14,1,14,20.00,11.60,0.000,11.600,2363.380,NULL,232.000,'2025-11-13');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (15,1,15,26.00,10.00,0.000,10.000,2037.400,NULL,260.000,'2025-11-13'),
 (16,1,16,5.00,5.00,0.000,5.000,1018.700,NULL,25.000,'2025-11-13'),
 (17,1,17,15.00,3.00,0.000,3.000,611.220,NULL,45.000,'2025-11-13'),
 (18,1,18,10.00,3.00,0.000,3.000,611.220,NULL,30.000,'2025-11-13'),
 (19,1,19,12.00,5.00,0.000,5.000,1018.700,NULL,60.000,'2025-11-13'),
 (20,1,20,1.00,7.60,0.000,7.600,1548.420,NULL,7.600,'2025-11-13'),
 (21,1,21,6.00,8.00,0.000,8.000,1629.920,NULL,48.000,'2025-11-13'),
 (22,1,22,2.00,11.00,0.000,11.000,2241.140,NULL,22.000,'2025-11-13'),
 (23,1,23,3.00,8.00,0.000,8.000,1629.920,NULL,24.000,'2025-11-13'),
 (24,1,24,1.00,5.00,0.000,5.000,1018.700,NULL,5.000,'2025-11-13'),
 (25,1,25,5.00,5.00,0.000,5.000,1018.700,NULL,25.000,'2025-11-13'),
 (26,1,26,4.00,7.00,0.000,7.000,1426.180,NULL,28.000,'2025-11-13'),
 (27,1,27,4.00,11.60,0.000,11.600,2363.380,NULL,46.400,'2025-11-13');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (28,1,28,2.00,7.62,0.000,7.620,1552.500,NULL,15.240,'2025-11-13'),
 (29,1,29,1.00,7.79,0.000,7.790,1587.130,NULL,7.790,'2025-11-13'),
 (30,1,30,1.00,9.00,0.000,9.000,1833.660,NULL,9.000,'2025-11-13'),
 (31,1,31,18.00,5.40,0.000,5.400,1100.200,NULL,97.200,'2025-11-13'),
 (32,1,32,21.00,6.70,0.000,6.700,1365.060,NULL,140.700,'2025-11-13'),
 (33,1,33,51.00,8.60,0.000,8.600,1752.160,NULL,438.600,'2025-11-13'),
 (34,1,34,40.00,9.20,0.000,9.200,1874.410,NULL,368.000,'2025-11-13'),
 (35,1,35,9.00,0.14,0.000,0.140,28.520,NULL,1.260,'2025-11-13'),
 (36,1,36,2.00,5.90,0.000,5.900,1202.070,NULL,11.800,'2025-11-13'),
 (37,1,37,9.00,3.00,0.000,3.000,611.220,NULL,27.000,'2025-11-13'),
 (38,1,38,3.00,5.00,0.000,5.000,1018.700,NULL,15.000,'2025-11-13'),
 (39,1,39,3.00,4.00,0.000,4.000,814.960,NULL,12.000,'2025-11-13'),
 (40,2,40,20.00,15.40,0.000,15.400,3647.340,0.00,308.000,'2025-11-24'),
 (41,3,41,20.00,14.28,0.000,14.280,3382.080,0.00,285.600,'2025-11-25');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (42,3,42,5.00,23.01,0.000,23.010,5449.690,NULL,115.050,'2025-11-25'),
 (43,3,43,10.00,14.84,0.000,14.840,3514.710,NULL,148.400,'2025-11-25'),
 (44,3,44,3.00,28.50,0.000,28.500,6749.940,NULL,85.500,'2025-11-25'),
 (45,3,45,3.00,12.65,0.000,12.650,2996.030,NULL,37.950,'2025-11-25'),
 (46,3,46,7.00,7.70,0.000,7.700,1823.670,NULL,53.900,'2025-11-25'),
 (47,3,47,26.00,19.97,0.000,19.970,4729.690,NULL,519.220,'2025-11-25'),
 (48,3,48,8.00,30.71,0.000,30.710,7273.360,NULL,245.680,'2025-11-25'),
 (49,3,49,9.00,23.74,0.000,23.740,5622.580,NULL,213.660,'2025-11-25'),
 (50,3,50,18.00,12.70,0.000,12.700,3007.870,NULL,228.600,'2025-11-25'),
 (51,3,51,13.00,20.66,0.000,20.660,4893.110,NULL,268.580,'2025-11-25'),
 (52,3,52,6.00,19.60,0.000,19.600,4642.060,NULL,117.600,'2025-11-25'),
 (53,3,53,8.00,10.40,0.000,10.400,2463.140,NULL,83.200,'2025-11-25'),
 (54,3,54,17.00,17.33,0.000,17.330,4104.440,NULL,294.610,'2025-11-25');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (55,4,55,10.00,0.54,0.000,0.540,127.890,0.00,5.400,'2025-11-27'),
 (56,4,56,5.00,6.20,0.000,6.200,1468.410,NULL,31.000,'2025-11-27'),
 (57,4,57,5.00,15.17,0.000,15.170,3592.860,NULL,75.850,'2025-11-27'),
 (58,4,58,11.00,2.20,0.000,2.200,521.050,NULL,24.200,'2025-11-27'),
 (59,4,59,16.00,3.64,0.000,3.640,862.100,NULL,58.240,'2025-11-27'),
 (60,4,60,6.00,10.13,0.000,10.130,2399.190,NULL,60.780,'2025-11-27'),
 (61,4,61,21.00,13.34,0.000,13.340,3159.450,NULL,280.140,'2025-11-27'),
 (62,4,62,2.00,19.74,0.000,19.740,4675.220,NULL,39.480,'2025-11-27'),
 (63,4,63,6.00,3.80,0.000,3.800,899.990,NULL,22.800,'2025-11-27'),
 (64,4,64,1.00,9.55,0.000,9.550,2261.820,NULL,9.550,'2025-11-27'),
 (65,4,65,5.00,2.20,0.000,2.200,521.050,NULL,11.000,'2025-11-27'),
 (66,4,66,5.00,4.20,0.000,4.200,994.730,NULL,21.000,'2025-11-27'),
 (67,5,67,17.00,6.00,0.000,6.000,1421.040,0.00,102.000,'2025-12-01');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (68,5,68,4.00,8.00,0.000,8.000,1894.720,NULL,32.000,'2025-12-01'),
 (69,5,69,5.00,4.00,0.000,4.000,947.360,NULL,20.000,'2025-12-01'),
 (70,5,70,4.00,12.00,0.000,12.000,2842.080,NULL,48.000,'2025-12-01'),
 (71,5,71,3.00,7.00,0.000,7.000,1657.880,NULL,21.000,'2025-12-01'),
 (72,5,72,4.00,10.00,0.000,10.000,2368.400,NULL,40.000,'2025-12-01'),
 (73,5,73,4.00,3.00,0.000,3.000,710.520,NULL,12.000,'2025-12-01'),
 (74,5,74,16.00,2.00,0.000,2.000,473.680,NULL,32.000,'2025-12-01'),
 (75,5,75,5.00,6.00,0.000,6.000,1421.040,NULL,30.000,'2025-12-01'),
 (76,5,76,15.00,1.00,0.000,1.000,236.840,NULL,15.000,'2025-12-01'),
 (77,5,77,2.00,3.00,0.000,3.000,710.520,NULL,6.000,'2025-12-01'),
 (78,5,78,6.00,2.00,0.000,2.000,473.680,NULL,12.000,'2025-12-01'),
 (79,5,79,10.00,0.50,0.000,0.500,118.420,NULL,5.000,'2025-12-01'),
 (80,5,80,1.00,20.00,0.000,20.000,4736.800,NULL,20.000,'2025-12-01'),
 (81,5,81,2.00,1.00,0.000,1.000,236.840,NULL,2.000,'2025-12-01');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (82,5,82,4.00,1.00,0.000,1.000,236.840,NULL,4.000,'2025-12-01'),
 (83,5,83,1.00,2.00,0.000,2.000,473.680,NULL,2.000,'2025-12-01'),
 (84,5,84,1.00,3.00,0.000,3.000,710.520,NULL,3.000,'2025-12-01'),
 (85,5,85,2.00,12.00,0.000,12.000,2842.080,NULL,24.000,'2025-12-01'),
 (86,5,86,3.00,10.00,0.000,10.000,2368.400,NULL,30.000,'2025-12-01'),
 (87,5,87,19.00,6.00,0.000,6.000,1421.040,NULL,114.000,'2025-12-01'),
 (88,5,88,7.00,10.00,0.000,10.000,2368.400,NULL,70.000,'2025-12-01'),
 (89,5,89,7.00,13.00,0.000,13.000,3078.920,NULL,91.000,'2025-12-01'),
 (90,5,90,1.00,8.00,0.000,8.000,1894.720,NULL,8.000,'2025-12-01'),
 (91,5,91,2.00,10.00,0.000,10.000,2368.400,NULL,20.000,'2025-12-01'),
 (92,5,92,6.00,20.00,0.000,20.000,4736.800,NULL,120.000,'2025-12-01'),
 (93,5,103,1.00,40.00,0.000,40.000,9473.600,NULL,40.000,'2025-12-01'),
 (94,6,93,22.00,8.20,0.000,8.200,1942.090,0.00,180.400,'2025-12-01');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (95,6,94,28.00,5.40,0.000,5.400,1278.940,NULL,151.200,'2025-12-01'),
 (96,6,95,10.00,10.00,0.000,10.000,2368.400,NULL,100.000,'2025-12-01'),
 (97,6,96,11.00,17.00,0.000,17.000,4026.280,NULL,187.000,'2025-12-01'),
 (98,6,97,18.00,13.00,0.000,13.000,3078.920,NULL,234.000,'2025-12-01'),
 (99,6,98,9.00,17.90,0.000,17.900,4239.440,NULL,161.100,'2025-12-01'),
 (100,6,99,7.00,14.85,0.000,14.850,3517.070,NULL,103.950,'2025-12-01'),
 (101,6,100,9.00,15.62,0.000,15.620,3699.440,NULL,140.580,'2025-12-01'),
 (102,6,101,16.00,12.20,0.000,12.200,2889.450,NULL,195.200,'2025-12-01'),
 (103,6,102,8.00,7.90,0.000,7.900,1871.040,NULL,63.200,'2025-12-01'),
 (104,7,104,23.00,8.83,0.000,8.830,2091.300,0.00,203.090,'2025-12-03'),
 (105,7,105,6.00,8.33,0.000,8.330,1972.880,NULL,49.980,'2025-12-03'),
 (106,7,106,18.00,9.11,0.000,9.110,2157.610,NULL,163.980,'2025-12-03'),
 (107,7,107,6.00,7.50,0.000,7.500,1776.300,NULL,45.000,'2025-12-03');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (108,8,108,12.00,18.00,0.000,18.000,4978.440,0.00,216.000,'2025-12-17'),
 (109,9,14,42.00,10.47,0.000,10.470,2988.140,0.00,439.740,'2025-12-22'),
 (110,9,107,12.00,7.50,0.000,7.500,2140.500,NULL,90.000,'2025-12-22'),
 (111,9,15,24.00,16.14,0.000,16.140,4606.360,NULL,387.360,'2025-12-22'),
 (112,10,109,9.00,2.93,0.000,2.930,1084.830,0.00,26.370,'2026-01-31'),
 (113,10,110,4.00,2.46,0.000,2.460,910.810,NULL,9.840,'2026-01-31'),
 (114,10,111,5.00,2.72,0.000,2.720,1005.600,NULL,13.580,'2026-01-31'),
 (115,10,113,4.00,3.32,0.000,3.320,1229.230,NULL,13.280,'2026-01-31'),
 (116,11,24,11.00,10.10,0.000,10.100,4003.340,0.00,111.100,'2026-02-18'),
 (117,11,6,7.00,15.00,0.000,15.000,5945.550,NULL,105.000,'2026-02-18'),
 (118,11,31,14.00,19.24,0.000,19.240,7626.160,NULL,269.360,'2026-02-18'),
 (119,11,13,15.00,2.34,0.000,2.340,927.510,NULL,35.100,'2026-02-18'),
 (120,11,5,2.00,4.59,0.000,4.590,1819.340,NULL,9.180,'2026-02-18');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (121,11,30,8.00,1.00,0.000,1.000,396.370,NULL,8.000,'2026-02-18'),
 (122,11,114,4.00,2.40,0.000,2.400,951.290,NULL,9.600,'2026-02-18'),
 (123,11,115,10.00,12.78,0.000,12.780,5065.610,NULL,127.800,'2026-02-18'),
 (124,11,116,3.00,2.25,0.000,2.250,891.830,NULL,6.750,'2026-02-18'),
 (125,11,117,2.00,5.05,0.000,5.050,2001.670,NULL,10.100,'2026-02-18'),
 (126,12,42,6.00,10.54,0.000,10.540,5983.350,0.00,63.240,'2026-06-08'),
 (127,12,63,6.00,1.17,0.000,1.170,664.190,NULL,7.020,'2026-06-08'),
 (128,12,45,6.00,8.90,0.000,8.900,5052.350,NULL,53.400,'2026-06-08'),
 (129,12,26,4.00,15.51,0.000,15.510,8804.720,NULL,62.040,'2026-06-08'),
 (130,12,39,3.00,19.31,0.000,19.310,10961.900,NULL,57.930,'2026-06-08'),
 (131,12,40,1.00,14.48,0.000,14.480,8220.010,NULL,14.480,'2026-06-08'),
 (132,12,5,2.00,12.07,0.000,12.070,6851.900,NULL,24.140,'2026-06-08'),
 (133,12,36,3.00,5.60,0.000,5.600,3179.010,NULL,16.800,'2026-06-08');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (134,12,96,4.00,4.53,0.000,4.530,2571.590,NULL,18.120,'2026-06-08'),
 (135,12,60,3.00,8.50,0.000,8.500,4825.280,NULL,25.500,'2026-06-08'),
 (136,12,71,6.00,9.13,0.000,9.130,5182.920,NULL,54.780,'2026-06-08'),
 (137,12,126,2.00,13.05,0.000,13.050,7408.220,NULL,26.100,'2026-06-08'),
 (138,12,124,1.00,22.00,0.000,22.000,12488.960,NULL,22.000,'2026-06-08'),
 (139,12,123,6.00,11.08,0.000,11.080,6289.890,NULL,66.480,'2026-06-08'),
 (140,12,122,8.00,5.01,0.000,5.010,2844.080,NULL,40.080,'2026-06-08'),
 (141,12,121,6.00,9.10,0.000,9.100,5165.890,NULL,54.600,'2026-06-08'),
 (142,12,120,4.00,7.92,0.000,7.920,4496.030,NULL,31.680,'2026-06-08'),
 (143,12,119,5.00,1.93,0.000,1.930,1095.620,NULL,9.650,'2026-06-08'),
 (144,12,118,1.00,17.33,0.000,17.330,9837.890,NULL,17.330,'2026-06-08'),
 (145,12,125,1.00,20.72,0.000,20.720,11762.330,NULL,20.720,'2026-06-08'),
 (146,13,127,27.00,12.07,0.000,12.070,7154.090,0.00,326.000,'2026-06-17');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (147,14,145,2.00,16.18,0.000,16.180,10080.460,0.00,32.360,'2026-07-01'),
 (148,14,144,2.00,15.63,0.000,15.630,9737.800,NULL,31.260,'2026-07-01'),
 (149,14,143,2.00,17.62,0.000,17.620,10977.610,NULL,35.240,'2026-07-01'),
 (150,14,142,4.00,13.39,0.000,13.390,8342.240,NULL,53.560,'2026-07-01'),
 (151,14,141,1.00,23.46,0.000,23.460,14616.050,NULL,23.460,'2026-07-01'),
 (152,14,140,6.00,4.02,0.000,4.020,2504.540,NULL,24.120,'2026-07-01'),
 (153,14,139,8.00,1.26,0.000,1.260,785.010,NULL,10.080,'2026-07-01'),
 (154,14,138,2.00,7.77,0.000,7.770,4840.870,NULL,15.540,'2026-07-01'),
 (155,14,137,2.00,7.17,0.000,7.170,4467.050,NULL,14.340,'2026-07-01'),
 (156,14,136,2.00,4.84,0.000,4.840,3015.420,NULL,9.680,'2026-07-01'),
 (157,14,135,4.00,2.74,0.000,2.740,1707.070,NULL,10.960,'2026-07-01'),
 (158,14,134,1.00,18.35,0.000,18.350,11432.420,NULL,18.350,'2026-07-01'),
 (159,14,133,6.00,9.25,0.000,9.250,5762.930,NULL,55.500,'2026-07-01');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (160,14,132,3.00,10.30,0.000,10.300,6417.110,NULL,30.900,'2026-07-01'),
 (161,14,131,15.00,5.06,0.000,5.060,3152.480,NULL,75.900,'2026-07-01'),
 (162,14,130,16.00,1.90,0.000,1.900,1183.740,NULL,30.400,'2026-07-01'),
 (163,14,129,5.00,13.90,0.000,13.900,8659.980,NULL,69.500,'2026-07-01'),
 (164,14,128,4.00,11.50,0.000,11.500,7164.730,NULL,46.000,'2026-07-01'),
 (165,14,40,5.00,14.68,0.000,14.680,9145.930,NULL,73.400,'2026-07-01'),
 (166,14,111,2.00,10.01,0.000,10.010,6236.430,NULL,20.020,'2026-07-01'),
 (167,15,5,2.00,25.30,0.000,25.300,19862.270,0.00,50.600,'2026-08-25'),
 (168,15,109,2.00,11.21,0.000,11.210,8800.630,NULL,22.420,'2026-08-25'),
 (169,15,110,2.00,12.74,0.000,12.740,10001.790,NULL,25.480,'2026-08-25'),
 (170,15,45,2.00,13.20,0.000,13.200,10362.920,NULL,26.400,'2026-08-25'),
 (171,15,116,2.00,9.49,0.000,9.490,7450.310,NULL,18.980,'2026-08-25'),
 (172,15,62,2.00,12.97,0.000,12.970,10182.360,NULL,25.940,'2026-08-25');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (173,15,2,2.00,7.26,0.000,7.260,5699.610,NULL,14.520,'2026-08-25'),
 (174,15,63,2.00,2.80,0.000,2.800,2198.200,NULL,5.600,'2026-08-25'),
 (175,15,114,2.00,6.56,0.000,6.560,5150.060,NULL,13.120,'2026-08-25'),
 (176,15,43,2.00,4.88,0.000,4.880,3831.140,NULL,9.760,'2026-08-25'),
 (177,15,51,2.00,8.90,0.000,8.900,6987.120,NULL,17.800,'2026-08-25'),
 (178,15,141,11.00,0.92,0.000,0.920,722.260,NULL,10.120,'2026-08-25'),
 (179,15,134,15.00,6.38,0.000,6.380,5008.750,NULL,95.700,'2026-08-25'),
 (180,15,124,14.00,0.70,0.000,0.700,549.550,NULL,9.800,'2026-08-25'),
 (181,15,96,4.00,12.67,0.000,12.670,9946.840,NULL,50.680,'2026-08-25'),
 (182,15,119,4.00,19.80,0.000,19.800,15544.390,NULL,79.200,'2026-08-25'),
 (183,15,146,5.00,1.00,0.000,1.000,785.070,NULL,5.000,'2026-08-25'),
 (184,15,147,5.00,12.70,0.000,12.700,9970.390,NULL,63.500,'2026-08-25'),
 (185,15,148,7.00,18.04,0.000,18.040,14162.660,NULL,126.280,'2026-08-25');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (186,15,149,6.00,14.90,0.000,14.900,11697.540,NULL,89.400,'2026-08-25'),
 (187,15,150,1.00,4.00,0.000,4.000,3140.280,NULL,4.000,'2026-08-25'),
 (188,15,151,1.00,16.72,0.000,16.720,13126.370,NULL,16.720,'2026-08-25'),
 (189,15,152,1.00,4.87,0.000,4.870,3823.290,NULL,4.870,'2026-08-25'),
 (190,15,153,1.00,10.79,0.000,10.790,8470.910,NULL,10.790,'2026-08-25'),
 (191,15,154,1.00,25.80,0.000,25.800,20254.811,NULL,25.800,'2026-08-25'),
 (192,15,155,1.00,11.92,0.000,11.920,9358.030,NULL,11.920,'2026-08-25'),
 (193,15,156,4.00,7.26,0.000,7.260,5699.610,NULL,29.040,'2026-08-25'),
 (194,15,157,4.00,2.51,0.000,2.510,1970.530,NULL,10.040,'2026-08-25'),
 (195,15,158,3.00,9.33,0.000,9.330,7324.700,NULL,27.990,'2026-08-25'),
 (196,15,159,3.00,8.69,0.000,8.690,6822.260,NULL,26.070,'2026-08-25'),
 (197,15,160,4.00,8.71,0.000,8.710,6837.960,NULL,34.840,'2026-08-25'),
 (198,15,161,4.00,10.78,0.000,10.780,8463.050,NULL,43.120,'2026-08-25');
INSERT INTO `detalle_compras` (`iddetalle_compra`,`idcompra`,`idarticulo`,`cantidad`,`precio_compra`,`descuento`,`precio`,`precio_tasa`,`precio_venta`,`subtotal`,`fecha`) VALUES 
 (199,15,162,3.00,9.71,0.000,9.710,7623.030,NULL,29.130,'2026-08-25'),
 (200,15,163,3.00,19.90,0.000,19.900,15622.890,NULL,59.700,'2026-08-25'),
 (201,15,164,3.00,22.07,0.000,22.070,17326.490,NULL,66.210,'2026-08-25'),
 (202,15,165,21.00,1.10,0.000,1.100,863.580,NULL,23.100,'2026-08-25'),
 (203,15,166,1.00,7.80,0.000,7.800,6123.550,NULL,7.800,'2026-08-25'),
 (204,15,167,2.00,5.93,0.000,5.930,4655.470,NULL,11.860,'2026-08-25'),
 (205,16,118,24.00,11.83,0.000,11.830,9794.650,0.00,283.990,'2026-09-10');
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`detalle_devolucion`
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`detalle_devolucion`
--

/*!40000 ALTER TABLE `detalle_devolucion` DISABLE KEYS */;
INSERT INTO `detalle_devolucion` (`iddetalle_devolucion`,`iddevolucion`,`idarticulo`,`cantidad`,`precio_venta`,`descuento`) VALUES 
 (1,1,3,1,2.00,0.00),
 (2,2,5,1,4.00,0.00),
 (3,3,4,1,2.00,0.00),
 (4,4,46,1,12.75,25.00),
 (5,5,80,1,40.00,0.00),
 (6,5,18,1,7.00,0.00),
 (7,6,47,1,34.00,0.00),
 (8,7,95,1,20.00,0.00),
 (9,8,14,1,20.00,0.00),
 (10,8,51,1,35.00,0.00),
 (11,8,50,1,25.00,0.00),
 (12,9,1,1,4.00,0.00),
 (13,9,43,1,27.00,0.00),
 (14,10,94,1,13.50,0.00),
 (15,10,47,1,34.00,0.00),
 (16,10,15,1,20.00,0.00),
 (17,10,19,1,13.50,0.00),
 (18,10,43,1,27.00,0.00),
 (19,10,63,1,7.00,0.00),
 (20,10,61,1,27.00,0.00),
 (21,10,61,1,27.00,0.00),
 (22,10,26,1,16.00,0.00),
 (23,11,46,1,20.00,0.00),
 (24,12,101,1,27.00,0.00),
 (25,13,47,1,25.00,0.00),
 (26,13,96,1,23.00,0.00),
 (27,13,94,1,10.00,0.00),
 (28,13,15,1,15.00,0.00),
 (29,13,6,1,4.00,0.00),
 (30,13,13,1,2.00,0.00),
 (31,14,59,1,7.00,0.00),
 (32,15,40,1,25.00,0.00),
 (33,15,93,1,20.00,0.00),
 (34,16,61,1,15.00,0.00),
 (35,16,14,1,18.00,0.00),
 (36,16,51,1,23.00,0.00);
INSERT INTO `detalle_devolucion` (`iddetalle_devolucion`,`iddevolucion`,`idarticulo`,`cantidad`,`precio_venta`,`descuento`) VALUES 
 (37,16,94,2,10.00,0.00),
 (38,16,33,1,15.00,0.00),
 (39,16,14,1,20.00,0.00),
 (40,16,93,1,13.00,0.00),
 (41,17,45,1,18.00,0.00),
 (42,18,31,1,10.00,0.00),
 (43,18,34,1,20.00,0.00),
 (44,19,108,1,25.00,0.00),
 (45,19,41,1,25.00,0.00),
 (46,19,93,1,15.00,0.00),
 (47,20,93,1,15.00,0.00),
 (48,21,61,1,20.00,0.00),
 (49,22,87,1,13.10,0.00),
 (50,23,85,1,18.00,0.00),
 (51,24,1,1,4.00,0.00),
 (52,25,1,1,4.00,0.00),
 (53,26,16,1,10.00,0.00),
 (54,27,127,1,18.00,0.00),
 (55,28,30,1,2.00,0.00),
 (56,28,24,1,15.00,0.00),
 (57,29,30,1,2.00,0.00),
 (58,29,24,1,15.00,0.00),
 (59,30,129,1,20.00,0.00);
/*!40000 ALTER TABLE `detalle_devolucion` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`detalle_devolucioncompras`
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
-- Dumping data for table `svwebkids`.`detalle_devolucioncompras`
--

/*!40000 ALTER TABLE `detalle_devolucioncompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_devolucioncompras` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`detalle_pedido`
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
  `precio` float(12,3) DEFAULT '0.000',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  `unidad` varchar(15) DEFAULT 'UND',
  `cntgrupo` float(9,3) DEFAULT '1.000',
  PRIMARY KEY (`iddetalle_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`detalle_pedido`
--

/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `costoarticulo` float(9,3) DEFAULT NULL,
  `iva` int(11) DEFAULT '0',
  `precioriginal` float(11,3) DEFAULT '0.000',
  `cantidad` float(7,2) NOT NULL,
  `precio_venta` float(11,3) NOT NULL,
  `descuento` float(7,2) NOT NULL,
  `precio` float(9,3) DEFAULT NULL,
  `pcomiarti` float(9,3) DEFAULT '0.000',
  `mcomiarti` float(9,3) DEFAULT '0.000',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  `unidad` varchar(10) DEFAULT 'UND',
  `cntgrp` int(11) DEFAULT '1',
  PRIMARY KEY (`iddetalle_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=800 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`detalle_venta`
--

/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (1,1,3,0.890,0,0.000,1.00,2.000,0.00,2.000,0.000,0.000,'2025-11-13 17:50:25','2025-11-13','UND',1),
 (2,2,5,2.210,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2025-11-13 18:01:38','2025-11-13','UND',1),
 (3,3,4,1.000,0,0.000,1.00,2.000,0.00,2.000,0.000,0.000,'2025-11-15 13:34:17','2025-11-15','UND',1),
 (4,4,46,7.700,0,0.000,1.00,12.750,25.00,17.000,0.000,0.000,'2025-11-25 12:52:11','2025-11-25','UND',1),
 (5,5,80,20.000,0,0.000,1.00,40.000,0.00,40.000,0.000,0.000,'2025-12-05 19:04:41','2025-12-05','UND',1),
 (6,5,18,3.000,0,0.000,1.00,7.000,0.00,7.000,0.000,0.000,'2025-12-05 19:04:41','2025-12-05','UND',1),
 (7,6,41,14.280,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2025-12-06 16:59:57','2025-12-06','UND',1),
 (8,7,47,19.970,0,0.000,1.00,34.000,0.00,34.000,0.000,0.000,'2025-12-06 17:34:12','2025-12-06','UND',1),
 (9,8,41,14.280,0,0.000,1.00,27.000,0.00,27.000,0.000,0.000,'2025-12-06 17:38:57','2025-12-06','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (10,8,93,8.200,0,0.000,1.00,17.500,0.00,17.500,0.000,0.000,'2025-12-06 17:38:57','2025-12-06','UND',1),
 (11,8,40,15.400,0,0.000,1.00,30.000,0.00,30.000,0.000,0.000,'2025-12-06 17:38:57','2025-12-06','UND',1),
 (12,8,106,9.110,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-06 17:38:57','2025-12-06','UND',1),
 (13,8,14,11.600,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-06 17:38:57','2025-12-06','UND',1),
 (14,8,50,12.700,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2025-12-06 17:38:57','2025-12-06','UND',1),
 (15,8,43,14.840,0,0.000,1.00,27.000,0.00,27.000,0.000,0.000,'2025-12-06 17:38:57','2025-12-06','UND',1),
 (16,8,14,11.600,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-06 17:38:57','2025-12-06','UND',1),
 (17,9,54,17.330,0,0.000,1.00,31.000,0.00,31.000,0.000,0.000,'2025-12-06 17:46:01','2025-12-06','UND',1),
 (18,10,94,5.400,0,0.000,1.00,13.500,0.00,13.500,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (19,10,47,19.970,0,0.000,1.00,34.000,0.00,34.000,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1),
 (20,10,15,10.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1),
 (21,10,19,5.000,0,0.000,1.00,13.500,0.00,13.500,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1),
 (22,10,43,14.840,0,0.000,1.00,27.000,0.00,27.000,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1),
 (23,10,63,3.800,0,0.000,1.00,7.000,0.00,7.000,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1),
 (24,10,61,13.340,0,0.000,1.00,27.000,0.00,27.000,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1),
 (25,10,61,13.340,0,0.000,1.00,27.000,0.00,27.000,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1),
 (26,10,26,7.000,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2025-12-06 17:49:37','2025-12-06','UND',1),
 (27,11,19,5.000,0,0.000,1.00,13.500,0.00,13.500,0.000,0.000,'2025-12-06 17:50:56','2025-12-06','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (28,12,95,10.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-06 17:54:23','2025-12-06','UND',1),
 (29,13,14,11.600,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-06 17:59:09','2025-12-06','UND',1),
 (30,13,51,20.660,0,0.000,1.00,35.000,0.00,35.000,0.000,0.000,'2025-12-06 17:59:09','2025-12-06','UND',1),
 (31,13,50,12.700,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2025-12-06 17:59:09','2025-12-06','UND',1),
 (32,14,43,14.840,0,0.000,1.00,27.000,0.00,27.000,0.000,0.000,'2025-12-06 18:03:23','2025-12-06','UND',1),
 (33,14,2,2.000,0,0.000,1.00,7.000,0.00,7.000,0.000,0.000,'2025-12-06 18:03:23','2025-12-06','UND',1),
 (34,15,79,0.500,0,0.000,1.00,1.500,0.00,1.500,0.000,0.000,'2025-12-06 18:05:39','2025-12-06','UND',1),
 (35,15,12,1.500,0,0.000,1.00,7.000,0.00,7.000,0.000,0.000,'2025-12-06 18:05:39','2025-12-06','UND',1),
 (36,16,6,2.600,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2025-12-06 18:26:43','2025-12-06','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (37,17,49,23.740,0,0.000,1.00,30.750,25.00,41.000,0.000,0.000,'2025-12-06 18:43:52','2025-12-06','UND',1),
 (38,17,43,14.840,0,0.000,1.00,20.250,25.00,27.000,0.000,0.000,'2025-12-06 18:43:52','2025-12-06','UND',1),
 (39,17,12,1.500,0,0.000,1.00,5.250,25.00,7.000,0.000,0.000,'2025-12-06 18:43:52','2025-12-06','UND',1),
 (40,17,61,13.340,0,0.000,1.00,20.250,25.00,27.000,0.000,0.000,'2025-12-06 18:43:52','2025-12-06','UND',1),
 (41,17,55,0.540,0,0.000,4.00,1.120,25.00,1.500,0.000,0.000,'2025-12-06 18:43:52','2025-12-06','UND',1),
 (42,18,31,5.400,0,0.000,1.00,13.500,0.00,13.500,0.000,0.000,'2025-12-08 10:23:05','2025-12-08','UND',1),
 (43,18,5,2.210,0,0.000,1.00,5.500,0.00,5.500,0.000,0.000,'2025-12-08 10:23:05','2025-12-08','UND',1),
 (44,18,6,2.600,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2025-12-08 10:23:05','2025-12-08','UND',1),
 (45,19,40,15.400,0,0.000,1.00,30.000,0.00,30.000,0.000,0.000,'2025-12-08 16:10:52','2025-12-08','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (46,19,49,23.740,0,0.000,1.00,41.000,0.00,41.000,0.000,0.000,'2025-12-08 16:10:52','2025-12-08','UND',1),
 (47,20,1,0.830,0,0.000,1.00,4.000,0.00,3.000,0.000,0.000,'2025-12-09 13:38:21','2025-12-09','UND',1),
 (48,20,43,14.840,0,0.000,1.00,27.000,0.00,20.000,0.000,0.000,'2025-12-09 13:38:21','2025-12-09','UND',1),
 (49,21,1,0.830,0,0.000,1.00,4.000,0.00,3.000,0.000,0.000,'2025-12-09 13:50:26','2025-12-09','UND',1),
 (50,21,43,14.840,0,0.000,1.00,27.000,0.00,20.000,0.000,0.000,'2025-12-09 13:50:26','2025-12-09','UND',1),
 (51,22,101,12.200,0,0.000,1.00,23.000,0.00,17.000,0.000,0.000,'2025-12-09 14:05:28','2025-12-09','UND',1),
 (52,22,51,20.660,0,0.000,1.00,35.000,0.00,26.000,0.000,0.000,'2025-12-09 14:05:28','2025-12-09','UND',1),
 (53,23,68,8.000,0,0.000,1.00,17.500,0.00,13.000,0.000,0.000,'2025-12-09 15:54:41','2025-12-09','UND',1),
 (54,23,24,5.000,0,0.000,1.00,13.500,0.00,10.000,0.000,0.000,'2025-12-09 15:54:41','2025-12-09','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (55,23,89,13.000,0,0.000,1.00,27.000,0.00,20.000,0.000,0.000,'2025-12-09 15:54:41','2025-12-09','UND',1),
 (56,23,71,7.000,0,0.000,1.00,16.000,0.00,12.000,0.000,0.000,'2025-12-09 15:54:41','2025-12-09','UND',1),
 (57,23,107,7.500,0,0.000,1.00,17.500,0.00,13.000,0.000,0.000,'2025-12-09 15:54:41','2025-12-09','UND',1),
 (58,23,106,9.110,0,0.000,1.00,20.000,0.00,15.000,0.000,0.000,'2025-12-09 15:54:41','2025-12-09','UND',1),
 (59,24,94,5.400,0,0.000,1.00,13.500,0.00,10.000,0.000,0.000,'2025-12-09 16:40:18','2025-12-09','UND',1),
 (60,24,41,14.280,0,0.000,1.00,27.000,0.00,20.000,0.000,0.000,'2025-12-09 16:40:18','2025-12-09','UND',1),
 (61,24,40,15.400,0,0.000,1.00,30.000,0.00,22.000,0.000,0.000,'2025-12-09 16:40:18','2025-12-09','UND',1),
 (62,24,97,13.000,0,0.000,1.00,24.000,0.00,18.000,0.000,0.000,'2025-12-09 16:40:18','2025-12-09','UND',1),
 (63,24,96,17.000,0,0.000,1.00,31.000,0.00,23.000,0.000,0.000,'2025-12-09 16:40:18','2025-12-09','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (64,25,33,8.600,0,0.000,1.00,13.120,25.00,13.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1),
 (65,25,101,12.200,0,0.000,1.00,17.250,25.00,17.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1),
 (66,25,98,17.900,0,0.000,1.00,23.250,25.00,23.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1),
 (67,25,98,17.900,0,0.000,1.00,23.250,25.00,23.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1),
 (68,25,52,19.600,0,0.000,1.00,25.500,25.00,25.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1),
 (69,25,105,8.330,0,0.000,1.00,15.000,25.00,15.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1),
 (70,25,58,2.200,0,0.000,1.00,5.250,25.00,5.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1),
 (71,25,106,9.110,0,0.000,1.00,15.000,25.00,15.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1),
 (72,25,51,20.660,0,0.000,1.00,26.250,25.00,26.000,0.000,0.000,'2025-12-10 14:00:01','2025-12-10','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (73,26,14,11.600,0,0.000,1.00,16.000,20.00,15.000,0.000,0.000,'2025-12-10 14:14:57','2025-12-10','UND',1),
 (74,26,51,20.660,0,0.000,1.00,28.000,20.00,26.000,0.000,0.000,'2025-12-10 14:14:57','2025-12-10','UND',1),
 (75,26,50,12.700,0,0.000,1.00,20.000,20.00,18.000,0.000,0.000,'2025-12-10 14:14:57','2025-12-10','UND',1),
 (76,26,54,17.330,0,0.000,1.00,24.800,20.00,23.000,0.000,0.000,'2025-12-10 14:14:57','2025-12-10','UND',1),
 (77,26,31,5.400,0,0.000,2.00,10.800,20.00,10.000,0.000,0.000,'2025-12-10 14:14:57','2025-12-10','UND',1),
 (78,26,33,8.600,0,0.000,1.00,14.000,20.00,13.000,0.000,0.000,'2025-12-10 14:14:57','2025-12-10','UND',1),
 (79,27,94,5.400,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2025-12-10 15:27:51','2025-12-10','UND',1),
 (80,27,47,19.970,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2025-12-10 15:27:51','2025-12-10','UND',1),
 (81,27,15,10.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2025-12-10 15:27:51','2025-12-10','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (82,27,19,5.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2025-12-10 15:27:51','2025-12-10','UND',1),
 (83,27,43,14.840,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-10 15:27:51','2025-12-10','UND',1),
 (84,27,63,3.800,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2025-12-10 15:27:51','2025-12-10','UND',1),
 (85,27,61,13.340,0,0.000,2.00,20.000,0.00,20.000,0.000,0.000,'2025-12-10 15:27:51','2025-12-10','UND',1),
 (86,27,26,7.000,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2025-12-10 15:27:51','2025-12-10','UND',1),
 (87,28,51,20.660,0,0.000,1.00,35.000,0.00,26.000,0.000,0.000,'2025-12-10 18:43:02','2025-12-10','UND',1),
 (88,29,30,9.000,0,0.000,1.00,15.000,0.00,20.000,0.000,0.000,'2025-12-11 09:28:16','2025-12-11','UND',1),
 (89,30,104,9.550,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-11 09:29:50','2025-12-11','UND',1),
 (90,31,57,15.170,0,0.000,1.00,32.000,0.00,32.000,0.000,0.000,'2025-12-11 14:11:00','2025-12-11','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (91,32,93,8.200,0,0.000,1.00,13.000,0.00,21.000,0.000,0.000,'2025-12-12 09:21:43','2025-12-12','UND',1),
 (92,33,50,12.700,0,0.000,1.00,28.000,0.00,28.000,0.000,0.000,'2025-12-12 10:09:16','2025-12-12','UND',1),
 (93,34,57,15.170,0,0.000,1.00,32.000,0.00,32.000,0.000,0.000,'2025-12-12 10:35:12','2025-12-12','UND',1),
 (94,35,97,13.000,0,0.000,1.00,18.000,0.00,29.000,0.000,0.000,'2025-12-12 11:19:35','2025-12-12','UND',1),
 (95,35,45,12.650,0,0.000,1.00,18.000,0.00,29.000,0.000,0.000,'2025-12-12 11:19:35','2025-12-12','UND',1),
 (96,36,96,17.000,0,0.000,1.00,37.000,0.00,37.000,0.000,0.000,'2025-12-12 12:07:51','2025-12-12','UND',1),
 (97,36,96,17.000,0,0.000,1.00,37.000,0.00,37.000,0.000,0.000,'2025-12-12 12:07:51','2025-12-12','UND',1),
 (98,37,63,3.800,0,0.000,1.00,5.000,0.00,8.000,0.000,0.000,'2025-12-13 16:46:05','2025-12-13','UND',1),
 (99,38,82,1.000,0,0.000,1.00,6.500,0.00,6.500,0.000,0.000,'2025-12-14 10:36:04','2025-12-14','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (100,39,19,5.000,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-14 11:07:15','2025-12-14','UND',1),
 (101,40,14,11.600,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-14 12:20:50','2025-12-14','UND',1),
 (102,40,104,9.550,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-14 12:20:50','2025-12-14','UND',1),
 (103,41,99,14.850,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-15 13:26:12','2025-12-15','UND',1),
 (104,41,63,3.800,0,0.000,1.00,5.000,0.00,8.000,0.000,0.000,'2025-12-15 13:26:12','2025-12-15','UND',1),
 (105,42,14,11.600,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-15 14:42:37','2025-12-15','UND',1),
 (106,42,33,9.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-15 14:42:37','2025-12-15','UND',1),
 (107,43,40,15.400,0,0.000,1.00,40.000,0.00,40.000,0.000,0.000,'2025-12-15 16:38:53','2025-12-15','UND',1),
 (108,43,94,5.400,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2025-12-15 16:38:53','2025-12-15','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (109,44,32,6.700,0,0.000,1.00,12.000,0.00,20.000,0.000,0.000,'2025-12-16 17:45:59','2025-12-16','UND',1),
 (110,44,101,12.200,0,0.000,1.00,17.000,0.00,27.000,0.000,0.000,'2025-12-16 17:45:59','2025-12-16','UND',1),
 (111,45,98,17.900,0,0.000,1.00,20.000,0.00,37.000,0.000,0.000,'2025-12-16 18:03:12','2025-12-16','UND',1),
 (112,46,101,12.200,0,0.000,1.00,27.000,0.00,27.000,0.000,0.000,'2025-12-16 18:08:09','2025-12-16','UND',1),
 (113,47,93,8.200,0,0.000,1.00,15.000,0.00,21.000,0.000,0.000,'2025-12-16 18:14:55','2025-12-16','UND',1),
 (114,47,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-16 18:14:55','2025-12-16','UND',1),
 (115,48,46,7.700,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-17 15:33:22','2025-12-17','UND',1),
 (116,49,14,11.600,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-17 16:26:41','2025-12-17','UND',1),
 (117,50,49,23.740,0,0.000,1.00,30.000,0.00,48.000,0.000,0.000,'2025-12-17 17:41:46','2025-12-17','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (118,51,106,9.110,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2025-12-17 18:27:15','2025-12-17','UND',1),
 (119,51,79,0.500,0,0.000,2.00,1.500,0.00,1.700,0.000,0.000,'2025-12-17 18:27:15','2025-12-17','UND',1),
 (120,52,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-17 18:34:10','2025-12-17','UND',1),
 (121,52,96,17.000,0,0.000,1.00,23.000,0.00,37.000,0.000,0.000,'2025-12-17 18:34:10','2025-12-17','UND',1),
 (122,52,94,5.400,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-17 18:34:10','2025-12-17','UND',1),
 (123,52,15,10.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-17 18:34:10','2025-12-17','UND',1),
 (124,52,6,2.600,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-17 18:34:10','2025-12-17','UND',1),
 (125,52,13,1.000,0,0.000,1.00,2.000,0.00,3.000,0.000,0.000,'2025-12-17 18:34:10','2025-12-17','UND',1),
 (126,53,47,19.970,0,0.000,1.00,35.000,0.00,40.000,0.000,0.000,'2025-12-18 10:17:33','2025-12-18','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (127,53,96,17.000,0,0.000,1.00,30.000,0.00,37.000,0.000,0.000,'2025-12-18 10:17:33','2025-12-18','UND',1),
 (128,53,94,5.400,0,0.000,1.00,15.000,0.00,16.000,0.000,0.000,'2025-12-18 10:17:33','2025-12-18','UND',1),
 (129,53,15,10.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-18 10:17:33','2025-12-18','UND',1),
 (130,53,6,2.600,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-18 10:17:33','2025-12-18','UND',1),
 (131,53,13,1.000,0,0.000,1.00,2.000,0.00,3.000,0.000,0.000,'2025-12-18 10:17:33','2025-12-18','UND',1),
 (132,54,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-18 11:59:57','2025-12-18','UND',1),
 (133,54,93,8.200,0,0.000,1.00,20.000,0.00,21.000,0.000,0.000,'2025-12-18 11:59:57','2025-12-18','UND',1),
 (134,55,14,11.600,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2025-12-18 12:51:39','2025-12-18','UND',1),
 (135,55,106,9.110,0,0.000,1.00,32.000,0.00,24.000,0.000,0.000,'2025-12-18 12:51:39','2025-12-18','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (136,56,41,14.280,0,0.000,1.00,25.000,0.00,32.000,0.000,0.000,'2025-12-18 14:33:57','2025-12-18','UND',1),
 (137,57,6,2.600,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-18 16:03:07','2025-12-18','UND',1),
 (138,57,1,0.970,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-18 16:03:07','2025-12-18','UND',1),
 (139,57,1,0.970,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-18 16:03:07','2025-12-18','UND',1),
 (140,57,1,0.970,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-18 16:03:07','2025-12-18','UND',1),
 (141,58,99,14.850,0,0.000,1.00,25.000,0.00,32.000,0.000,0.000,'2025-12-18 16:45:06','2025-12-18','UND',1),
 (142,58,101,12.200,0,0.000,1.00,20.000,0.00,27.000,0.000,0.000,'2025-12-18 16:45:06','2025-12-18','UND',1),
 (143,58,53,10.400,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-18 16:45:06','2025-12-18','UND',1),
 (144,58,33,9.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-18 16:45:06','2025-12-18','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (145,59,14,11.600,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-19 15:20:21','2025-12-19','UND',1),
 (146,60,14,11.600,0,0.000,1.00,27.000,0.00,24.000,0.000,0.000,'2025-12-19 15:30:08','2025-12-19','UND',1),
 (147,60,106,9.110,0,0.000,1.00,36.000,0.00,24.000,0.000,0.000,'2025-12-19 15:30:08','2025-12-19','UND',1),
 (148,61,101,12.200,0,0.000,1.00,31.000,0.00,27.000,0.000,0.000,'2025-12-19 17:46:56','2025-12-19','UND',1),
 (149,61,107,7.500,0,0.000,1.00,23.000,0.00,21.000,0.000,0.000,'2025-12-19 17:46:56','2025-12-19','UND',1),
 (150,61,14,11.600,0,0.000,1.00,27.000,0.00,24.000,0.000,0.000,'2025-12-19 17:46:56','2025-12-19','UND',1),
 (151,62,59,3.640,0,0.000,1.00,7.000,0.00,11.000,0.000,0.000,'2025-12-20 15:43:16','2025-12-20','UND',1),
 (152,63,63,3.800,0,0.000,1.00,8.000,0.00,8.000,0.000,0.000,'2025-12-20 15:50:53','2025-12-20','UND',1),
 (153,64,61,13.340,0,0.000,1.00,32.000,0.00,32.000,0.000,0.000,'2025-12-20 15:53:16','2025-12-20','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (154,64,1,0.970,0,0.000,1.00,6.500,0.00,6.500,0.000,0.000,'2025-12-20 15:53:16','2025-12-20','UND',1),
 (155,65,39,4.000,0,0.000,1.00,8.000,0.00,6.500,0.000,0.000,'2025-12-20 16:35:43','2025-12-20','UND',1),
 (156,65,6,2.600,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-20 16:35:43','2025-12-20','UND',1),
 (157,66,26,7.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-20 16:51:41','2025-12-20','UND',1),
 (158,67,49,23.740,0,0.000,1.00,30.000,0.00,48.000,0.000,0.000,'2025-12-20 17:21:59','2025-12-20','UND',1),
 (159,68,51,20.660,0,0.000,1.00,40.000,0.00,42.000,0.000,0.000,'2025-12-20 17:42:22','2025-12-20','UND',1),
 (160,69,1,0.970,0,0.000,1.00,6.500,0.00,6.500,0.000,0.000,'2025-12-20 18:18:28','2025-12-20','UND',1),
 (161,70,61,13.340,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-20 18:24:50','2025-12-20','UND',1),
 (162,71,108,18.000,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-20 18:32:02','2025-12-20','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (163,71,96,17.000,0,0.000,1.00,25.000,0.00,37.000,0.000,0.000,'2025-12-20 18:32:02','2025-12-20','UND',1),
 (164,71,61,13.340,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-20 18:32:02','2025-12-20','UND',1),
 (165,71,48,30.710,0,0.000,1.00,40.000,0.00,50.000,0.000,0.000,'2025-12-20 18:32:02','2025-12-20','UND',1),
 (166,72,13,1.000,0,0.000,2.00,2.000,0.00,3.000,0.000,0.000,'2025-12-20 18:42:16','2025-12-20','UND',1),
 (167,73,47,19.970,0,0.000,1.00,40.000,0.00,40.000,0.000,0.000,'2025-12-21 10:37:41','2025-12-21','UND',1),
 (168,74,14,11.600,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-21 10:43:50','2025-12-21','UND',1),
 (169,75,93,8.200,0,0.000,1.00,15.000,0.00,21.000,0.000,0.000,'2025-12-21 10:57:57','2025-12-21','UND',1),
 (170,76,19,5.000,0,0.000,1.00,13.000,0.00,16.000,0.000,0.000,'2025-12-21 11:11:31','2025-12-21','UND',1),
 (171,77,41,14.280,0,0.000,1.00,48.000,0.00,32.000,0.000,0.000,'2025-12-21 11:26:29','2025-12-21','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (172,78,60,10.130,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-21 11:29:09','2025-12-21','UND',1),
 (173,79,33,9.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-21 12:27:58','2025-12-21','UND',1),
 (174,80,32,6.700,0,0.000,1.00,12.000,0.00,20.000,0.000,0.000,'2025-12-22 12:28:07','2025-12-22','UND',1),
 (175,80,96,17.000,0,0.000,1.00,25.000,0.00,37.000,0.000,0.000,'2025-12-22 12:28:07','2025-12-22','UND',1),
 (176,80,48,30.710,0,0.000,1.00,40.000,0.00,50.000,0.000,0.000,'2025-12-22 12:28:07','2025-12-22','UND',1),
 (177,80,107,7.500,0,0.000,1.00,13.000,0.00,8.850,0.000,0.000,'2025-12-22 12:28:07','2025-12-22','UND',1),
 (178,80,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-22 12:28:07','2025-12-22','UND',1),
 (179,81,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-22 13:28:05','2025-12-22','UND',1),
 (180,81,19,5.000,0,0.000,1.00,15.000,0.00,16.000,0.000,0.000,'2025-12-22 13:28:05','2025-12-22','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (181,81,79,0.500,0,0.000,1.00,1.000,0.00,1.700,0.000,0.000,'2025-12-22 13:28:05','2025-12-22','UND',1),
 (182,81,55,0.540,0,0.000,1.00,1.500,0.00,2.500,0.000,0.000,'2025-12-22 13:28:05','2025-12-22','UND',1),
 (183,81,13,1.000,0,0.000,1.00,2.000,0.00,3.000,0.000,0.000,'2025-12-22 13:28:05','2025-12-22','UND',1),
 (184,82,59,3.640,0,0.000,1.00,11.000,0.00,11.000,0.000,0.000,'2025-12-22 14:58:19','2025-12-22','UND',1),
 (185,82,42,23.010,0,0.000,1.00,56.000,0.00,48.000,0.000,0.000,'2025-12-22 14:58:19','2025-12-22','UND',1),
 (186,83,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-22 15:34:36','2025-12-22','UND',1),
 (187,83,96,17.000,0,0.000,1.00,25.000,0.00,37.000,0.000,0.000,'2025-12-22 15:34:36','2025-12-22','UND',1),
 (188,83,101,12.200,0,0.000,1.00,20.000,0.00,27.000,0.000,0.000,'2025-12-22 15:34:36','2025-12-22','UND',1),
 (189,83,93,8.200,0,0.000,1.00,20.000,0.00,21.000,0.000,0.000,'2025-12-22 15:34:36','2025-12-22','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (190,84,93,8.200,0,0.000,1.00,10.000,0.00,21.000,0.000,0.000,'2025-12-22 16:01:41','2025-12-22','UND',1),
 (191,85,54,17.330,0,0.000,1.00,48.000,0.00,37.000,0.000,0.000,'2025-12-22 16:33:01','2025-12-22','UND',1),
 (192,86,34,9.200,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2025-12-22 16:44:13','2025-12-22','UND',1),
 (193,86,106,9.110,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2025-12-22 16:44:13','2025-12-22','UND',1),
 (194,86,15,16.140,0,0.000,1.00,32.000,0.00,32.000,0.000,0.000,'2025-12-22 16:44:13','2025-12-22','UND',1),
 (195,86,93,8.200,0,0.000,1.00,21.000,0.00,21.000,0.000,0.000,'2025-12-22 16:44:13','2025-12-22','UND',1),
 (196,86,34,9.200,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2025-12-22 16:44:13','2025-12-22','UND',1),
 (197,86,32,6.700,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2025-12-22 16:44:13','2025-12-22','UND',1),
 (198,87,14,10.470,0,0.000,4.00,20.000,0.00,32.000,0.000,0.000,'2025-12-22 16:46:55','2025-12-22','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (199,87,104,9.550,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-22 16:46:55','2025-12-22','UND',1),
 (200,87,106,9.110,0,0.000,1.00,20.000,0.00,24.000,0.000,0.000,'2025-12-22 16:46:55','2025-12-22','UND',1),
 (201,87,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-22 16:46:55','2025-12-22','UND',1),
 (202,87,33,9.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-22 16:46:55','2025-12-22','UND',1),
 (203,88,32,6.700,0,0.000,1.00,12.000,0.00,20.000,0.000,0.000,'2025-12-22 16:51:08','2025-12-22','UND',1),
 (204,88,14,10.470,0,0.000,2.00,20.000,0.00,32.000,0.000,0.000,'2025-12-22 16:51:08','2025-12-22','UND',1),
 (205,88,102,7.900,0,0.000,1.00,12.000,0.00,20.000,0.000,0.000,'2025-12-22 16:51:08','2025-12-22','UND',1),
 (206,89,6,2.600,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-22 16:51:50','2025-12-22','UND',1),
 (207,90,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-22 17:15:39','2025-12-22','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (208,90,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-22 17:15:39','2025-12-22','UND',1),
 (209,90,96,17.000,0,0.000,1.00,25.000,0.00,37.000,0.000,0.000,'2025-12-22 17:15:39','2025-12-22','UND',1),
 (210,90,49,23.740,0,0.000,1.00,30.000,0.00,48.000,0.000,0.000,'2025-12-22 17:15:39','2025-12-22','UND',1),
 (211,91,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-23 11:06:54','2025-12-23','UND',1),
 (212,91,95,10.000,0,0.000,1.00,20.000,0.00,24.000,0.000,0.000,'2025-12-23 11:06:54','2025-12-23','UND',1),
 (213,91,19,5.000,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-23 11:06:54','2025-12-23','UND',1),
 (214,91,96,17.000,0,0.000,1.00,25.000,0.00,37.000,0.000,0.000,'2025-12-23 11:06:54','2025-12-23','UND',1),
 (215,91,15,16.140,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-23 11:06:54','2025-12-23','UND',1),
 (216,92,54,17.330,0,0.000,1.00,25.000,0.00,37.000,0.000,0.000,'2025-12-23 11:48:27','2025-12-23','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (217,93,26,7.000,0,0.000,1.00,32.000,0.00,20.000,0.000,0.000,'2025-12-23 13:00:01','2025-12-23','UND',1),
 (218,93,61,13.340,0,0.000,1.00,32.000,0.00,32.000,0.000,0.000,'2025-12-23 13:00:01','2025-12-23','UND',1),
 (219,94,61,13.340,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-23 13:15:56','2025-12-23','UND',1),
 (220,95,97,13.000,0,0.000,1.00,20.000,0.00,29.000,0.000,0.000,'2025-12-23 15:30:52','2025-12-23','UND',1),
 (221,96,59,3.640,0,0.000,1.00,7.000,0.00,11.000,0.000,0.000,'2025-12-23 15:54:09','2025-12-23','UND',1),
 (222,97,79,0.500,0,0.000,1.00,1.000,0.00,1.700,0.000,0.000,'2025-12-23 15:55:20','2025-12-23','UND',1),
 (223,98,1,0.970,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-23 16:16:54','2025-12-23','UND',1),
 (224,99,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-23 17:03:58','2025-12-23','UND',1),
 (225,99,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-23 17:03:58','2025-12-23','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (226,99,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-23 17:03:58','2025-12-23','UND',1),
 (227,99,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-23 17:03:58','2025-12-23','UND',1),
 (228,99,41,14.280,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-23 17:03:58','2025-12-23','UND',1),
 (229,99,100,15.620,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-23 17:03:58','2025-12-23','UND',1),
 (230,99,50,12.700,0,0.000,1.00,20.000,0.00,28.000,0.000,0.000,'2025-12-23 17:03:58','2025-12-23','UND',1),
 (231,100,39,4.000,0,0.000,1.00,13.000,0.00,6.500,0.000,0.000,'2025-12-23 18:08:41','2025-12-23','UND',1),
 (232,101,54,17.330,0,0.000,1.00,30.000,0.00,37.000,0.000,0.000,'2025-12-23 18:38:10','2025-12-23','UND',1),
 (233,102,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-23 19:11:39','2025-12-23','UND',1),
 (234,103,1,0.970,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-24 10:10:12','2025-12-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (235,104,61,13.340,0,0.000,1.00,15.000,0.00,32.000,0.000,0.000,'2025-12-24 10:25:07','2025-12-24','UND',1),
 (236,104,14,10.470,0,0.000,1.00,18.000,0.00,32.000,0.000,0.000,'2025-12-24 10:25:07','2025-12-24','UND',1),
 (237,104,51,20.660,0,0.000,1.00,23.000,0.00,42.000,0.000,0.000,'2025-12-24 10:25:07','2025-12-24','UND',1),
 (238,104,94,5.400,0,0.000,2.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 10:25:07','2025-12-24','UND',1),
 (239,104,33,9.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-24 10:25:07','2025-12-24','UND',1),
 (240,104,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 10:25:07','2025-12-24','UND',1),
 (241,104,93,8.200,0,0.000,1.00,13.000,0.00,21.000,0.000,0.000,'2025-12-24 10:25:07','2025-12-24','UND',1),
 (242,105,101,12.200,0,0.000,1.00,17.000,0.00,27.000,0.000,0.000,'2025-12-24 10:27:01','2025-12-24','UND',1),
 (243,106,54,17.330,0,0.000,1.00,37.000,0.00,37.000,0.000,0.000,'2025-12-24 10:39:59','2025-12-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (244,106,31,6.870,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2025-12-24 10:39:59','2025-12-24','UND',1),
 (245,106,101,12.200,0,0.000,1.00,27.000,0.00,27.000,0.000,0.000,'2025-12-24 10:39:59','2025-12-24','UND',1),
 (246,107,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 10:42:28','2025-12-24','UND',1),
 (247,107,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 10:42:28','2025-12-24','UND',1),
 (248,108,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (249,108,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (250,108,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (251,108,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (252,108,34,9.200,0,0.000,1.00,20.000,0.00,24.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (253,108,34,9.200,0,0.000,1.00,20.000,0.00,24.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (254,108,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (255,108,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (256,108,33,9.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (257,108,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (258,108,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 10:53:48','2025-12-24','UND',1),
 (259,109,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-24 11:12:20','2025-12-24','UND',1),
 (260,109,47,19.970,0,0.000,1.00,30.000,0.00,40.000,0.000,0.000,'2025-12-24 11:12:20','2025-12-24','UND',1),
 (261,110,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 11:20:21','2025-12-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (262,111,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 11:21:37','2025-12-24','UND',1),
 (263,112,93,8.200,0,0.000,1.00,12.000,0.00,21.000,0.000,0.000,'2025-12-24 11:35:08','2025-12-24','UND',1),
 (264,113,14,10.470,0,0.000,2.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 13:00:57','2025-12-24','UND',1),
 (265,114,31,6.870,0,0.000,2.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 13:03:52','2025-12-24','UND',1),
 (266,115,41,14.280,0,0.000,1.00,30.000,0.00,32.000,0.000,0.000,'2025-12-24 13:18:22','2025-12-24','UND',1),
 (267,116,93,8.200,0,0.000,1.00,15.000,0.00,21.000,0.000,0.000,'2025-12-24 13:29:43','2025-12-24','UND',1),
 (268,117,52,19.600,0,0.000,1.00,40.000,0.00,40.000,0.000,0.000,'2025-12-24 13:32:24','2025-12-24','UND',1),
 (269,118,91,10.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-24 13:39:59','2025-12-24','UND',1),
 (270,119,79,0.500,0,0.000,1.00,1.000,0.00,1.700,0.000,0.000,'2025-12-24 13:52:08','2025-12-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (271,120,104,9.550,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2025-12-24 14:20:35','2025-12-24','UND',1),
 (272,120,43,14.840,0,0.000,1.00,32.000,0.00,32.000,0.000,0.000,'2025-12-24 14:20:35','2025-12-24','UND',1),
 (273,121,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-24 14:43:33','2025-12-24','UND',1),
 (274,122,49,23.740,0,0.000,1.00,30.000,0.00,48.000,0.000,0.000,'2025-12-24 14:56:20','2025-12-24','UND',1),
 (275,123,51,20.660,0,0.000,1.00,30.000,0.00,42.000,0.000,0.000,'2025-12-24 15:13:11','2025-12-24','UND',1),
 (276,124,32,6.700,0,0.000,1.00,12.000,0.00,20.000,0.000,0.000,'2025-12-24 16:22:31','2025-12-24','UND',1),
 (277,124,27,11.600,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 16:22:31','2025-12-24','UND',1),
 (278,124,61,13.340,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 16:22:31','2025-12-24','UND',1),
 (279,125,79,0.500,0,0.000,2.00,1.000,0.00,1.700,0.000,0.000,'2025-12-24 16:25:35','2025-12-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (280,125,56,6.200,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 16:25:35','2025-12-24','UND',1),
 (281,126,73,3.000,0,0.000,1.00,6.000,0.00,10.000,0.000,0.000,'2025-12-24 17:45:49','2025-12-24','UND',1),
 (282,127,94,5.400,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 17:52:01','2025-12-24','UND',1),
 (283,127,61,13.340,0,0.000,1.00,15.000,0.00,32.000,0.000,0.000,'2025-12-24 17:52:01','2025-12-24','UND',1),
 (284,127,27,11.600,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 17:52:01','2025-12-24','UND',1),
 (285,127,51,20.660,0,0.000,1.00,20.000,0.00,42.000,0.000,0.000,'2025-12-24 17:52:02','2025-12-24','UND',1),
 (286,127,33,9.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-24 17:52:02','2025-12-24','UND',1),
 (287,127,93,8.200,0,0.000,1.00,13.000,0.00,21.000,0.000,0.000,'2025-12-24 17:52:02','2025-12-24','UND',1),
 (288,127,94,5.400,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-24 17:52:02','2025-12-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (289,127,15,16.140,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-24 17:52:02','2025-12-24','UND',1),
 (290,128,101,12.200,0,0.000,1.00,20.000,0.00,27.000,0.000,0.000,'2025-12-24 18:32:32','2025-12-24','UND',1),
 (291,128,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-24 18:32:32','2025-12-24','UND',1),
 (292,128,97,13.000,0,0.000,1.00,20.000,0.00,29.000,0.000,0.000,'2025-12-24 18:32:32','2025-12-24','UND',1),
 (293,129,97,13.000,0,0.000,1.00,10.000,0.00,29.000,0.000,0.000,'2025-12-24 19:20:39','2025-12-24','UND',1),
 (294,129,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-24 19:20:39','2025-12-24','UND',1),
 (295,130,6,2.600,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-26 10:13:25','2025-12-26','UND',1),
 (296,131,1,0.970,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-26 12:16:43','2025-12-26','UND',1),
 (297,132,40,15.400,0,0.000,1.00,40.000,0.00,40.000,0.000,0.000,'2025-12-26 14:05:02','2025-12-26','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (298,132,94,5.400,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2025-12-26 14:05:03','2025-12-26','UND',1),
 (299,133,31,6.870,0,0.000,1.00,18.000,0.00,16.000,0.000,0.000,'2025-12-26 16:31:36','2025-12-26','UND',1),
 (300,133,33,9.000,0,0.000,1.00,27.000,0.00,24.000,0.000,0.000,'2025-12-26 16:31:36','2025-12-26','UND',1),
 (301,133,79,0.500,0,0.000,1.00,1.800,0.00,1.700,0.000,0.000,'2025-12-26 16:31:36','2025-12-26','UND',1),
 (302,133,35,0.140,0,0.000,1.00,1.800,0.00,1.600,0.000,0.000,'2025-12-26 16:31:36','2025-12-26','UND',1),
 (303,133,35,0.140,0,0.000,1.00,1.800,0.00,1.600,0.000,0.000,'2025-12-26 16:31:36','2025-12-26','UND',1),
 (304,134,105,8.330,0,0.000,1.00,22.000,0.00,20.000,0.000,0.000,'2025-12-26 16:38:50','2025-12-26','UND',1),
 (305,135,59,3.640,0,0.000,1.00,7.000,0.00,11.000,0.000,0.000,'2025-12-27 12:32:48','2025-12-27','UND',1),
 (306,136,33,9.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-27 15:56:38','2025-12-27','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (307,136,100,15.620,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-27 15:56:38','2025-12-27','UND',1),
 (308,137,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-27 18:21:22','2025-12-27','UND',1),
 (309,137,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-27 18:21:22','2025-12-27','UND',1),
 (310,138,41,14.280,0,0.000,1.00,36.000,0.00,32.000,0.000,0.000,'2025-12-28 09:40:59','2025-12-28','UND',1),
 (311,139,93,8.200,0,0.000,1.00,13.000,0.00,21.000,0.000,0.000,'2025-12-28 14:17:24','2025-12-28','UND',1),
 (312,140,45,12.650,0,0.000,1.00,18.000,0.00,29.000,0.000,0.000,'2025-12-29 11:54:09','2025-12-29','UND',1),
 (313,141,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-29 13:54:45','2025-12-29','UND',1),
 (314,141,104,9.550,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-29 13:54:45','2025-12-29','UND',1),
 (315,142,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-29 14:20:31','2025-12-29','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (316,143,94,5.400,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-29 14:23:44','2025-12-29','UND',1),
 (317,144,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-29 15:20:13','2025-12-29','UND',1),
 (318,145,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-29 15:29:04','2025-12-29','UND',1),
 (319,145,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-29 15:29:04','2025-12-29','UND',1),
 (320,146,106,9.110,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-29 17:10:31','2025-12-29','UND',1),
 (321,146,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-29 17:10:32','2025-12-29','UND',1),
 (322,147,31,6.870,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-30 09:42:49','2025-12-30','UND',1),
 (323,147,34,9.200,0,0.000,1.00,20.000,0.00,24.000,0.000,0.000,'2025-12-30 09:42:49','2025-12-30','UND',1),
 (324,148,32,6.700,0,0.000,1.00,12.000,0.00,20.000,0.000,0.000,'2025-12-30 10:36:06','2025-12-30','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (325,148,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-30 10:36:06','2025-12-30','UND',1),
 (326,148,58,2.200,0,0.000,1.00,5.000,0.00,8.000,0.000,0.000,'2025-12-30 10:36:06','2025-12-30','UND',1),
 (327,149,31,6.870,0,0.000,1.00,18.000,0.00,16.000,0.000,0.000,'2025-12-30 11:20:54','2025-12-30','UND',1),
 (328,149,34,9.200,0,0.000,1.00,36.000,0.00,24.000,0.000,0.000,'2025-12-30 11:20:54','2025-12-30','UND',1),
 (329,150,78,2.000,0,0.000,1.00,3.000,0.00,5.000,0.000,0.000,'2025-12-30 12:10:26','2025-12-30','UND',1),
 (330,150,89,13.000,0,0.000,1.00,25.000,0.00,32.000,0.000,0.000,'2025-12-30 12:10:26','2025-12-30','UND',1),
 (331,151,51,20.660,0,0.000,1.00,30.000,0.00,42.000,0.000,0.000,'2025-12-30 12:47:35','2025-12-30','UND',1),
 (332,152,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-30 13:48:12','2025-12-30','UND',1),
 (333,153,94,5.400,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-30 15:29:52','2025-12-30','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (334,154,107,7.500,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-30 16:08:38','2025-12-30','UND',1),
 (335,154,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-30 16:08:38','2025-12-30','UND',1),
 (336,154,46,7.700,0,0.000,1.00,12.000,0.00,20.000,0.000,0.000,'2025-12-30 16:08:38','2025-12-30','UND',1),
 (337,154,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-30 16:08:38','2025-12-30','UND',1),
 (338,155,104,9.550,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-30 16:25:20','2025-12-30','UND',1),
 (339,156,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-30 17:44:28','2025-12-30','UND',1),
 (340,156,40,15.400,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-30 17:44:28','2025-12-30','UND',1),
 (341,156,41,14.280,0,0.000,1.00,30.000,0.00,32.000,0.000,0.000,'2025-12-30 17:44:28','2025-12-30','UND',1),
 (342,156,43,14.840,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-30 17:44:28','2025-12-30','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (343,156,93,8.200,0,0.000,1.00,20.000,0.00,21.000,0.000,0.000,'2025-12-30 17:44:28','2025-12-30','UND',1),
 (344,157,98,17.900,0,0.000,1.00,30.000,0.00,37.000,0.000,0.000,'2025-12-30 18:00:14','2025-12-30','UND',1),
 (345,158,51,20.660,0,0.000,1.00,30.000,0.00,42.000,0.000,0.000,'2025-12-30 19:36:41','2025-12-30','UND',1),
 (346,159,108,18.000,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-30 19:47:29','2025-12-30','UND',1),
 (347,159,41,14.280,0,0.000,1.00,25.000,0.00,32.000,0.000,0.000,'2025-12-30 19:47:29','2025-12-30','UND',1),
 (348,159,93,8.200,0,0.000,1.00,15.000,0.00,21.000,0.000,0.000,'2025-12-30 19:47:29','2025-12-30','UND',1),
 (349,160,47,19.970,0,0.000,1.00,30.000,0.00,40.000,0.000,0.000,'2025-12-31 09:26:33','2025-12-31','UND',1),
 (350,161,37,3.000,0,0.000,1.00,5.000,0.00,8.000,0.000,0.000,'2025-12-31 09:30:43','2025-12-31','UND',1),
 (351,162,1,0.970,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-31 09:55:14','2025-12-31','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (352,162,43,14.840,0,0.000,1.00,30.000,0.00,32.000,0.000,0.000,'2025-12-31 09:55:14','2025-12-31','UND',1),
 (353,163,41,14.280,0,0.000,1.00,30.000,0.00,32.000,0.000,0.000,'2025-12-31 10:21:21','2025-12-31','UND',1),
 (354,163,47,19.970,0,0.000,1.00,30.000,0.00,40.000,0.000,0.000,'2025-12-31 10:21:21','2025-12-31','UND',1),
 (355,164,75,6.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-31 10:22:40','2025-12-31','UND',1),
 (356,165,15,16.140,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-31 10:27:38','2025-12-31','UND',1),
 (357,166,93,8.200,0,0.000,1.00,15.000,0.00,21.000,0.000,0.000,'2025-12-31 10:29:55','2025-12-31','UND',1),
 (358,167,108,18.000,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-31 10:38:24','2025-12-31','UND',1),
 (359,167,49,23.740,0,0.000,1.00,25.000,0.00,48.000,0.000,0.000,'2025-12-31 10:38:24','2025-12-31','UND',1),
 (360,167,93,8.200,0,0.000,1.00,15.000,0.00,21.000,0.000,0.000,'2025-12-31 10:38:24','2025-12-31','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (361,168,19,5.000,0,0.000,1.00,15.000,0.00,16.000,0.000,0.000,'2025-12-31 10:59:18','2025-12-31','UND',1),
 (362,169,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-31 11:03:44','2025-12-31','UND',1),
 (363,170,2,2.000,0,0.000,1.00,7.000,0.00,11.000,0.000,0.000,'2025-12-31 11:10:15','2025-12-31','UND',1),
 (364,171,104,9.550,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2025-12-31 11:31:35','2025-12-31','UND',1),
 (365,172,50,12.700,0,0.000,1.00,20.000,0.00,28.000,0.000,0.000,'2025-12-31 11:43:31','2025-12-31','UND',1),
 (366,173,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2025-12-31 11:44:49','2025-12-31','UND',1),
 (367,174,93,8.200,0,0.000,1.00,10.000,0.00,21.000,0.000,0.000,'2025-12-31 11:46:27','2025-12-31','UND',1),
 (368,174,93,8.200,0,0.000,1.00,15.000,0.00,21.000,0.000,0.000,'2025-12-31 11:46:27','2025-12-31','UND',1),
 (369,175,51,20.660,0,0.000,1.00,26.000,0.00,42.000,0.000,0.000,'2025-12-31 11:49:40','2025-12-31','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (370,176,6,2.600,0,0.000,1.00,4.000,0.00,6.500,0.000,0.000,'2025-12-31 11:53:20','2025-12-31','UND',1),
 (371,177,59,3.640,0,0.000,1.00,7.000,0.00,11.000,0.000,0.000,'2025-12-31 11:55:14','2025-12-31','UND',1),
 (372,178,61,13.340,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-31 12:47:55','2025-12-31','UND',1),
 (373,179,94,5.400,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2025-12-31 12:54:24','2025-12-31','UND',1),
 (374,179,15,16.140,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2025-12-31 12:54:24','2025-12-31','UND',1),
 (375,180,100,15.620,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2026-01-13 16:53:58','2026-01-13','UND',1),
 (376,181,66,4.200,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2026-01-13 17:01:59','2026-01-13','UND',1),
 (377,182,47,19.970,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2026-01-17 14:57:51','2026-01-17','UND',1),
 (378,183,25,5.000,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2026-01-18 11:24:38','2026-01-18','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (379,184,71,7.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-01-21 17:09:35','2026-01-21','UND',1),
 (380,184,5,2.210,0,0.000,1.00,8.800,0.00,4.000,0.000,0.000,'2026-01-21 17:09:35','2026-01-21','UND',1),
 (381,185,92,20.000,0,0.000,1.00,30.000,0.00,48.000,0.000,0.000,'2026-01-21 17:14:17','2026-01-21','UND',1),
 (382,185,102,7.900,0,0.000,1.00,12.000,0.00,20.000,0.000,0.000,'2026-01-21 17:14:17','2026-01-21','UND',1),
 (383,186,47,19.970,0,0.000,1.00,48.000,0.00,40.000,0.000,0.000,'2026-01-22 11:48:58','2026-01-22','UND',1),
 (384,187,50,12.700,0,0.000,1.00,18.000,0.00,28.000,0.000,0.000,'2026-01-22 14:49:26','2026-01-22','UND',1),
 (385,188,97,13.000,0,0.000,1.00,20.000,0.00,29.000,0.000,0.000,'2026-01-24 09:42:18','2026-01-24','UND',1),
 (386,189,1,0.970,0,0.000,1.00,6.500,0.00,6.500,0.000,0.000,'2026-01-24 14:43:14','2026-01-24','UND',1),
 (387,190,107,7.500,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2026-01-24 15:16:14','2026-01-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (388,191,34,9.200,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2026-01-27 10:32:27','2026-01-27','UND',1),
 (389,192,16,5.000,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2026-02-03 09:34:07','2026-02-03','UND',1),
 (390,193,77,3.000,0,0.000,1.00,6.000,0.00,10.000,0.000,0.000,'2026-02-03 18:03:39','2026-02-03','UND',1),
 (391,193,88,10.000,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2026-02-03 18:03:39','2026-02-03','UND',1),
 (392,194,67,6.000,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2026-02-05 11:18:41','2026-02-05','UND',1),
 (393,194,67,6.000,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2026-02-05 11:18:41','2026-02-05','UND',1),
 (394,194,74,2.000,0,0.000,1.00,6.500,0.00,6.500,0.000,0.000,'2026-02-05 11:18:41','2026-02-05','UND',1),
 (395,194,74,2.000,0,0.000,1.00,6.500,0.00,6.500,0.000,0.000,'2026-02-05 11:18:41','2026-02-05','UND',1),
 (396,194,60,10.130,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2026-02-05 11:18:41','2026-02-05','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (397,195,111,2.716,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-02-05 17:33:57','2026-02-05','UND',1),
 (398,196,47,19.970,0,0.000,1.00,35.000,0.00,40.000,0.000,0.000,'2026-02-10 11:28:11','2026-02-10','UND',1),
 (399,197,107,7.500,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2026-02-12 14:44:57','2026-02-12','UND',1),
 (400,198,111,2.716,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-02-12 16:42:19','2026-02-12','UND',1),
 (401,199,108,18.000,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2026-02-12 17:53:50','2026-02-12','UND',1),
 (402,200,58,2.200,0,0.000,1.00,5.000,0.00,8.000,0.000,0.000,'2026-02-13 18:14:07','2026-02-13','UND',1),
 (403,200,8,5.000,0,0.000,1.00,10.000,0.00,15.000,0.000,0.000,'2026-02-13 18:14:07','2026-02-13','UND',1),
 (404,200,109,2.930,0,0.000,1.00,12.000,0.00,2.930,0.000,0.000,'2026-02-13 18:14:07','2026-02-13','UND',1),
 (405,200,109,2.930,0,0.000,1.00,12.000,0.00,2.930,0.000,0.000,'2026-02-13 18:14:07','2026-02-13','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (406,201,50,12.700,0,0.000,1.00,20.000,0.00,28.000,0.000,0.000,'2026-02-14 13:04:13','2026-02-14','UND',1),
 (407,202,115,12.780,0,0.000,1.00,15.000,0.00,21.000,0.000,0.000,'2026-02-18 12:25:39','2026-02-18','UND',1),
 (408,203,56,6.200,0,0.000,1.00,10.000,0.00,16.000,0.000,0.000,'2026-02-20 15:01:40','2026-02-20','UND',1),
 (409,204,111,2.716,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-02-20 18:32:31','2026-02-20','UND',1),
 (410,204,110,2.460,0,0.000,1.00,12.000,0.00,2.460,0.000,0.000,'2026-02-20 18:32:31','2026-02-20','UND',1),
 (411,205,14,10.470,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2026-02-21 11:40:38','2026-02-21','UND',1),
 (412,205,116,2.250,0,0.000,1.00,5.000,0.00,8.000,0.000,0.000,'2026-02-21 11:40:38','2026-02-21','UND',1),
 (413,206,108,18.000,0,0.000,1.00,25.000,0.00,40.000,0.000,0.000,'2026-02-21 17:04:42','2026-02-21','UND',1),
 (414,207,54,17.330,0,0.000,1.00,30.000,0.00,37.000,0.000,0.000,'2026-02-26 15:20:36','2026-02-26','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (415,208,12,1.500,0,0.000,1.00,5.000,0.00,8.000,0.000,0.000,'2026-02-27 15:02:43','2026-02-27','UND',1),
 (416,208,24,10.100,0,0.000,1.00,10.000,0.00,21.000,0.000,0.000,'2026-02-27 15:02:43','2026-02-27','UND',1),
 (417,209,116,2.250,0,0.000,1.00,5.000,0.00,8.000,0.000,0.000,'2026-03-03 10:35:10','2026-03-03','UND',1),
 (418,210,30,1.000,0,0.000,1.00,2.000,0.00,3.000,0.000,0.000,'2026-03-04 14:30:41','2026-03-04','UND',1),
 (419,211,6,15.000,0,0.000,1.00,20.000,0.00,28.000,0.000,0.000,'2026-03-07 10:31:04','2026-03-07','UND',1),
 (420,211,31,19.240,0,0.000,1.00,25.000,0.00,35.000,0.000,0.000,'2026-03-07 10:31:04','2026-03-07','UND',1),
 (421,212,61,13.340,0,0.000,1.00,20.000,0.00,32.000,0.000,0.000,'2026-03-07 13:58:43','2026-03-07','UND',1),
 (422,212,31,19.240,0,0.000,1.00,25.000,0.00,35.000,0.000,0.000,'2026-03-07 13:58:43','2026-03-07','UND',1),
 (423,213,70,12.000,0,0.000,1.00,17.000,0.00,27.000,0.000,0.000,'2026-03-07 14:18:27','2026-03-07','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (424,213,60,10.130,0,0.000,1.00,15.000,0.00,24.000,0.000,0.000,'2026-03-07 14:18:27','2026-03-07','UND',1),
 (425,214,47,19.970,0,0.000,1.00,35.000,0.00,25.000,0.000,0.000,'2026-03-07 18:34:11','2026-03-07','UND',1),
 (426,215,96,17.000,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-03-08 11:19:00','2026-03-08','UND',1),
 (427,216,43,14.840,0,0.000,1.00,30.000,0.00,20.000,0.000,0.000,'2026-03-10 16:01:34','2026-03-10','UND',1),
 (428,217,107,7.500,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-03-10 16:08:34','2026-03-10','UND',1),
 (429,217,98,17.900,0,0.000,1.00,30.000,0.00,23.000,0.000,0.000,'2026-03-10 16:08:34','2026-03-10','UND',1),
 (430,217,14,10.470,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-03-10 16:08:34','2026-03-10','UND',1),
 (431,218,31,19.240,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-03-12 12:10:39','2026-03-12','UND',1),
 (432,219,44,28.500,0,0.000,1.00,45.000,0.00,45.000,0.000,0.000,'2026-03-14 09:47:26','2026-03-14','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (433,220,57,15.170,0,0.000,1.00,25.000,0.00,20.000,0.000,0.000,'2026-03-19 16:13:33','2026-03-19','UND',1),
 (434,221,109,2.930,0,0.000,1.00,17.590,0.00,12.000,0.000,0.000,'2026-03-19 16:36:39','2026-03-19','UND',1),
 (435,222,65,2.200,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2026-03-19 16:44:44','2026-03-19','UND',1),
 (436,222,42,23.010,0,0.000,1.00,30.000,0.00,30.000,0.000,0.000,'2026-03-19 16:44:44','2026-03-19','UND',1),
 (437,223,115,12.780,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-03-19 17:26:54','2026-03-19','UND',1),
 (438,224,109,2.930,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-03-22 11:21:25','2026-03-22','UND',1),
 (439,225,50,12.700,0,0.000,1.00,25.870,0.00,18.000,0.000,0.000,'2026-03-22 12:55:26','2026-03-22','UND',1),
 (440,226,89,13.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-03-25 12:31:42','2026-03-25','UND',1),
 (441,226,71,7.000,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-03-25 12:31:42','2026-03-25','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (442,227,51,20.660,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-03-26 09:35:26','2026-03-26','UND',1),
 (443,228,42,23.010,0,0.000,1.00,30.000,0.00,30.000,0.000,0.000,'2026-03-26 15:34:07','2026-03-26','UND',1),
 (444,229,12,1.500,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-03-26 15:43:50','2026-03-26','UND',1),
 (445,230,45,12.650,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-03-26 17:41:35','2026-03-26','UND',1),
 (446,230,41,14.280,0,0.000,1.00,25.000,0.00,20.000,0.000,0.000,'2026-03-26 17:41:35','2026-03-26','UND',1),
 (447,230,106,9.110,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-03-26 17:41:35','2026-03-26','UND',1),
 (448,231,101,12.200,0,0.000,1.00,17.000,0.00,17.000,0.000,0.000,'2026-03-27 13:55:17','2026-03-27','UND',1),
 (449,231,50,12.700,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-03-27 13:55:17','2026-03-27','UND',1),
 (450,232,36,5.900,0,0.000,1.00,16.910,0.00,12.000,0.000,0.000,'2026-03-27 16:47:53','2026-03-27','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (451,232,36,5.900,0,0.000,1.00,16.910,0.00,12.000,0.000,0.000,'2026-03-27 16:47:53','2026-03-27','UND',1),
 (452,233,6,15.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-03-29 12:19:38','2026-03-29','UND',1),
 (453,234,114,2.400,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-03-31 16:34:56','2026-03-31','UND',1),
 (454,235,109,2.930,0,0.000,1.00,16.490,0.00,12.000,0.000,0.000,'2026-04-01 11:41:52','2026-04-01','UND',1),
 (455,236,111,2.716,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-01 12:06:01','2026-04-01','UND',1),
 (456,237,32,6.700,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-04-01 17:54:31','2026-04-01','UND',1),
 (457,238,16,5.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-04-04 14:13:36','2026-04-04','UND',1),
 (458,238,5,4.590,0,0.000,1.00,8.000,0.00,8.000,0.000,0.000,'2026-04-04 14:13:36','2026-04-04','UND',1),
 (459,238,114,2.400,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-04-04 14:13:36','2026-04-04','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (460,239,34,9.200,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-09 14:30:52','2026-04-09','UND',1),
 (461,239,13,2.340,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-04-09 14:30:52','2026-04-09','UND',1),
 (462,239,12,1.500,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-04-09 14:30:52','2026-04-09','UND',1),
 (463,240,60,10.130,0,0.000,1.00,20.000,0.00,15.000,0.000,0.000,'2026-04-10 14:52:54','2026-04-10','UND',1),
 (464,240,60,10.130,0,0.000,1.00,20.000,0.00,15.000,0.000,0.000,'2026-04-10 14:52:54','2026-04-10','UND',1),
 (465,241,53,10.400,0,0.000,1.00,20.000,0.00,15.000,0.000,0.000,'2026-04-11 12:24:19','2026-04-11','UND',1),
 (466,242,113,3.320,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-14 09:42:47','2026-04-14','UND',1),
 (467,243,59,3.640,0,0.000,1.00,7.000,0.00,7.000,0.000,0.000,'2026-04-15 11:17:04','2026-04-15','UND',1),
 (468,243,89,13.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-04-15 11:17:04','2026-04-15','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (469,243,13,2.340,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-04-15 11:17:04','2026-04-15','UND',1),
 (470,243,72,10.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-15 11:17:04','2026-04-15','UND',1),
 (471,243,89,13.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-04-15 11:17:04','2026-04-15','UND',1),
 (472,244,87,6.000,0,0.000,1.00,13.100,0.00,10.000,0.000,0.000,'2026-04-15 14:16:12','2026-04-15','UND',1),
 (473,245,15,16.140,0,0.000,1.00,25.000,0.00,20.000,0.000,0.000,'2026-04-17 11:52:31','2026-04-17','UND',1),
 (474,246,21,8.000,0,0.000,1.00,25.820,0.00,15.000,0.000,0.000,'2026-04-17 11:55:55','2026-04-17','UND',1),
 (475,247,31,19.240,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-04-18 11:23:08','2026-04-18','UND',1),
 (476,248,26,7.000,0,0.000,1.00,20.000,0.00,18.000,0.000,0.000,'2026-04-22 16:17:18','2026-04-22','UND',1),
 (477,249,85,12.000,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-04-24 09:54:23','2026-04-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (478,250,82,1.000,0,0.000,1.00,5.190,0.00,4.000,0.000,0.000,'2026-04-24 11:39:27','2026-04-24','UND',1),
 (479,251,98,17.900,0,0.000,1.00,23.000,0.00,23.000,0.000,0.000,'2026-04-24 15:18:27','2026-04-24','UND',1),
 (480,252,60,10.130,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-24 17:41:25','2026-04-24','UND',1),
 (481,253,40,15.400,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-04-24 17:41:55','2026-04-24','UND',1),
 (482,253,94,5.400,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-04-24 17:41:55','2026-04-24','UND',1),
 (483,254,108,18.000,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-04-24 17:42:20','2026-04-24','UND',1),
 (484,255,46,7.700,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-04-24 17:42:38','2026-04-24','UND',1),
 (485,256,48,30.710,0,0.000,1.00,35.000,0.00,35.000,0.000,0.000,'2026-04-24 17:43:10','2026-04-24','UND',1),
 (486,256,96,17.000,0,0.000,1.00,23.000,0.00,23.000,0.000,0.000,'2026-04-24 17:43:10','2026-04-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (487,257,48,30.710,0,0.000,1.00,35.000,0.00,35.000,0.000,0.000,'2026-04-24 17:43:42','2026-04-24','UND',1),
 (488,258,42,23.010,0,0.000,1.00,30.000,0.00,30.000,0.000,0.000,'2026-04-24 17:44:20','2026-04-24','UND',1),
 (489,259,48,30.710,0,0.000,1.00,47.000,0.00,47.000,0.000,0.000,'2026-04-24 17:44:32','2026-04-24','UND',1),
 (490,259,97,13.000,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2026-04-24 17:44:32','2026-04-24','UND',1),
 (491,259,46,7.700,0,0.000,1.00,17.000,0.00,17.000,0.000,0.000,'2026-04-24 17:44:32','2026-04-24','UND',1),
 (492,259,48,30.710,0,0.000,1.00,47.000,0.00,47.000,0.000,0.000,'2026-04-24 17:44:32','2026-04-24','UND',1),
 (493,259,42,23.010,0,0.000,1.00,38.000,0.00,38.000,0.000,0.000,'2026-04-24 17:44:32','2026-04-24','UND',1),
 (494,260,95,10.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-04-24 17:44:45','2026-04-24','UND',1),
 (495,261,47,19.970,0,0.000,1.00,34.000,0.00,34.000,0.000,0.000,'2026-04-24 17:44:57','2026-04-24','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (496,262,107,7.500,0,0.000,1.00,17.500,0.00,17.500,0.000,0.000,'2026-04-24 17:45:12','2026-04-24','UND',1),
 (497,263,47,19.970,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-04-25 11:47:37','2026-04-25','UND',1),
 (498,263,61,13.340,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-04-25 11:47:37','2026-04-25','UND',1),
 (499,264,63,3.800,0,0.000,1.00,6.480,0.00,5.000,0.000,0.000,'2026-04-25 11:57:25','2026-04-25','UND',1),
 (500,265,75,6.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-25 15:57:24','2026-04-25','UND',1),
 (501,265,54,17.330,0,0.000,1.00,23.000,0.00,23.000,0.000,0.000,'2026-04-25 15:57:24','2026-04-25','UND',1),
 (502,266,110,2.460,0,0.000,1.00,15.560,0.00,12.000,0.000,0.000,'2026-04-25 16:12:13','2026-04-25','UND',1),
 (503,267,66,4.200,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-04-25 16:19:54','2026-04-25','UND',1),
 (504,267,53,10.400,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-25 16:19:54','2026-04-25','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (505,268,105,8.330,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-04-28 11:11:00','2026-04-28','UND',1),
 (506,268,95,10.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-28 11:11:00','2026-04-28','UND',1),
 (507,269,30,1.000,0,0.000,1.00,2.000,0.00,2.000,0.000,0.000,'2026-04-29 15:05:10','2026-04-29','UND',1),
 (508,270,113,3.320,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-04-29 17:17:35','2026-04-29','UND',1),
 (509,271,109,2.930,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-04-30 17:12:36','2026-04-30','UND',1),
 (510,272,63,3.800,0,0.000,1.00,6.480,0.00,5.000,0.000,0.000,'2026-05-02 17:46:55','2026-05-02','UND',1),
 (511,273,24,10.100,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-05-03 12:04:35','2026-05-03','UND',1),
 (512,273,13,2.340,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-05-03 12:04:35','2026-05-03','UND',1),
 (513,274,109,2.930,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-05-06 09:29:37','2026-05-06','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (514,275,57,15.170,0,0.000,1.00,17.000,0.00,17.000,0.000,0.000,'2026-05-06 16:23:18','2026-05-06','UND',1),
 (515,276,61,13.340,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-05-06 17:54:17','2026-05-06','UND',1),
 (516,277,5,4.590,0,0.000,1.00,8.000,0.00,8.000,0.000,0.000,'2026-05-10 11:24:53','2026-05-10','UND',1),
 (517,277,38,5.000,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-05-10 11:24:53','2026-05-10','UND',1),
 (518,277,31,19.240,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-05-10 11:24:53','2026-05-10','UND',1),
 (519,277,94,5.400,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-05-10 11:24:53','2026-05-10','UND',1),
 (520,278,107,7.500,0,0.000,2.00,10.000,0.00,10.000,0.000,0.000,'2026-05-12 08:51:02','2026-05-12','UND',1),
 (521,278,14,10.470,0,0.000,2.00,20.000,0.00,20.000,0.000,0.000,'2026-05-12 08:51:02','2026-05-12','UND',1),
 (522,279,38,5.000,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-05-12 10:39:58','2026-05-12','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (523,279,46,7.700,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-05-12 10:39:58','2026-05-12','UND',1),
 (524,280,1,0.970,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2026-05-13 11:14:57','2026-05-13','UND',1),
 (525,281,1,0.970,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2026-05-13 11:14:57','2026-05-13','UND',1),
 (526,282,1,0.970,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2026-05-13 11:14:58','2026-05-13','UND',1),
 (527,283,62,19.740,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-05-15 15:09:31','2026-05-15','UND',1),
 (528,284,32,6.700,0,0.000,1.00,15.850,0.00,12.000,0.000,0.000,'2026-05-15 16:21:41','2026-05-15','UND',1),
 (529,284,105,8.330,0,0.000,1.00,15.850,0.00,12.000,0.000,0.000,'2026-05-15 16:21:41','2026-05-15','UND',1),
 (530,284,14,10.470,0,0.000,1.00,26.420,0.00,20.000,0.000,0.000,'2026-05-15 16:21:41','2026-05-15','UND',1),
 (531,284,14,10.470,0,0.000,1.00,26.420,0.00,20.000,0.000,0.000,'2026-05-15 16:21:41','2026-05-15','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (532,284,39,4.000,0,0.000,1.00,10.570,0.00,8.000,0.000,0.000,'2026-05-15 16:21:41','2026-05-15','UND',1),
 (533,285,33,9.000,0,0.000,3.00,15.000,0.00,15.000,0.000,0.000,'2026-05-16 11:46:51','2026-05-16','UND',1),
 (534,286,98,17.900,0,0.000,1.00,30.940,0.00,23.000,0.000,0.000,'2026-05-19 15:20:31','2026-05-19','UND',1),
 (535,287,110,2.460,0,0.000,1.00,16.210,0.00,12.000,0.000,0.000,'2026-05-22 16:48:19','2026-05-22','UND',1),
 (536,288,107,7.500,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-05-23 10:07:29','2026-05-23','UND',1),
 (537,288,33,9.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-05-23 10:07:29','2026-05-23','UND',1),
 (538,288,47,19.970,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-05-23 10:07:29','2026-05-23','UND',1),
 (539,289,30,1.000,0,0.000,2.00,2.000,0.00,2.000,0.000,0.000,'2026-05-27 16:52:53','2026-05-27','UND',1),
 (540,290,25,5.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-05-27 17:22:51','2026-05-27','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (541,291,95,10.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-05-28 10:25:53','2026-05-28','UND',1),
 (542,292,31,19.240,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-05-29 11:38:22','2026-05-29','UND',1),
 (543,293,15,16.140,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-06-02 11:14:24','2026-06-02','UND',1),
 (544,294,1,0.970,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2026-06-03 17:39:05','2026-06-03','UND',1),
 (545,295,33,9.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-04 10:56:16','2026-06-04','UND',1),
 (546,295,53,10.400,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-04 10:56:16','2026-06-04','UND',1),
 (547,295,53,10.400,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-04 10:56:16','2026-06-04','UND',1),
 (548,295,32,6.700,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-06-04 10:56:16','2026-06-04','UND',1),
 (549,296,106,9.110,0,0.000,1.00,19.890,0.00,15.000,0.000,0.000,'2026-06-05 18:06:11','2026-06-05','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (550,297,97,13.000,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-05 18:29:51','2026-06-05','UND',1),
 (551,297,45,12.650,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-05 18:29:51','2026-06-05','UND',1),
 (552,298,104,9.550,0,0.000,1.00,20.270,0.00,15.000,0.000,0.000,'2026-06-06 13:17:01','2026-06-06','UND',1),
 (553,299,102,7.900,0,0.000,2.00,12.000,0.00,12.000,0.000,0.000,'2026-06-08 16:04:55','2026-06-08','UND',1),
 (554,300,94,5.400,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-10 14:31:46','2026-06-10','UND',1),
 (555,301,63,1.170,0,0.000,1.00,4.160,0.00,3.000,0.000,0.000,'2026-06-11 09:40:41','2026-06-11','UND',1),
 (556,301,18,3.000,0,0.000,1.00,9.710,0.00,7.000,0.000,0.000,'2026-06-11 09:40:41','2026-06-11','UND',1),
 (557,302,16,5.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-12 13:50:15','2026-06-12','UND',1),
 (558,303,58,2.200,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-06-13 09:01:55','2026-06-13','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (559,304,71,9.130,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-13 09:02:45','2026-06-13','UND',1),
 (560,305,109,2.930,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-06-13 09:03:32','2026-06-13','UND',1),
 (561,306,40,14.480,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-06-13 09:04:34','2026-06-13','UND',1),
 (562,306,42,10.540,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2026-06-13 09:04:34','2026-06-13','UND',1),
 (563,307,96,4.530,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-13 09:07:06','2026-06-13','UND',1),
 (564,308,96,4.530,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-13 13:20:38','2026-06-13','UND',1),
 (565,309,33,9.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-13 15:06:48','2026-06-13','UND',1),
 (566,310,121,9.100,0,0.000,1.00,20.500,0.00,15.000,0.000,0.000,'2026-06-13 15:50:44','2026-06-13','UND',1),
 (567,311,42,10.540,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2026-06-15 09:59:02','2026-06-15','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (568,311,23,8.000,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-06-15 09:59:02','2026-06-15','UND',1),
 (569,312,119,1.930,0,0.000,2.00,6.000,0.00,6.000,0.000,0.000,'2026-06-15 14:00:59','2026-06-15','UND',1),
 (570,312,107,7.500,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-15 14:00:59','2026-06-15','UND',1),
 (571,312,115,12.780,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-15 14:00:59','2026-06-15','UND',1),
 (572,312,122,5.010,0,0.000,1.00,12.000,0.00,10.000,0.000,0.000,'2026-06-15 14:00:59','2026-06-15','UND',1),
 (573,313,42,10.540,0,0.000,1.00,18.000,0.00,16.000,0.000,0.000,'2026-06-15 16:53:52','2026-06-15','UND',1),
 (574,313,6,15.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-06-15 16:53:52','2026-06-15','UND',1),
 (575,314,127,12.074,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-17 16:57:30','2026-06-17','UND',1),
 (576,315,127,12.074,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-18 09:15:40','2026-06-18','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (577,316,36,5.600,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-06-18 10:40:50','2026-06-18','UND',1),
 (578,317,127,12.074,0,0.000,1.00,23.670,0.00,18.000,0.000,0.000,'2026-06-18 15:36:18','2026-06-18','UND',1),
 (579,318,87,6.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-19 09:43:26','2026-06-19','UND',1),
 (580,318,58,2.200,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-06-19 09:43:26','2026-06-19','UND',1),
 (581,319,127,12.074,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-19 11:10:24','2026-06-19','UND',1),
 (582,320,127,12.074,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-19 11:11:06','2026-06-19','UND',1),
 (583,321,127,12.074,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-19 11:12:43','2026-06-19','UND',1),
 (584,322,41,14.280,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-06-19 14:33:19','2026-06-19','UND',1),
 (585,322,2,2.000,0,0.000,1.00,7.000,0.00,7.000,0.000,0.000,'2026-06-19 14:33:19','2026-06-19','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (586,322,96,4.530,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-19 14:33:19','2026-06-19','UND',1),
 (587,322,71,9.130,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-19 14:33:19','2026-06-19','UND',1),
 (588,323,26,15.510,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-06-19 15:44:25','2026-06-19','UND',1),
 (589,323,100,15.620,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-06-19 15:44:25','2026-06-19','UND',1),
 (590,323,123,11.080,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-19 15:44:25','2026-06-19','UND',1),
 (591,323,99,14.850,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-06-19 15:44:25','2026-06-19','UND',1),
 (592,323,107,7.500,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-19 15:44:25','2026-06-19','UND',1),
 (593,324,127,12.074,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-19 15:45:39','2026-06-19','UND',1),
 (594,325,47,19.970,0,0.000,1.00,33.180,0.00,25.000,0.000,0.000,'2026-06-20 11:07:30','2026-06-20','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (595,326,102,7.900,0,0.000,1.00,15.920,0.00,12.000,0.000,0.000,'2026-06-20 14:29:54','2026-06-20','UND',1),
 (596,326,76,1.000,0,0.000,1.00,2.650,0.00,2.000,0.000,0.000,'2026-06-20 14:29:54','2026-06-20','UND',1),
 (597,327,45,8.900,0,0.000,1.00,19.910,0.00,15.000,0.000,0.000,'2026-06-20 16:27:29','2026-06-20','UND',1),
 (598,328,127,12.074,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-20 16:47:12','2026-06-20','UND',1),
 (599,329,127,12.074,0,0.000,1.00,23.890,0.00,18.000,0.000,0.000,'2026-06-22 09:32:15','2026-06-22','UND',1),
 (600,330,41,14.280,0,0.000,1.00,25.000,0.00,20.000,0.000,0.000,'2026-06-23 11:25:07','2026-06-23','UND',1),
 (601,331,15,16.140,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-06-24 09:25:26','2026-06-24','UND',1),
 (602,332,95,10.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-24 17:12:24','2026-06-24','UND',1),
 (603,333,111,2.716,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-25 15:12:14','2026-06-25','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (604,333,12,1.500,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-06-25 15:12:14','2026-06-25','UND',1),
 (605,334,30,1.000,0,0.000,1.00,2.000,0.00,2.000,0.000,0.000,'2026-06-27 10:58:58','2026-06-27','UND',1),
 (606,334,24,10.100,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-27 10:58:58','2026-06-27','UND',1),
 (607,335,39,19.310,0,0.000,1.00,37.390,0.00,30.000,0.000,0.000,'2026-06-27 11:30:33','2026-06-27','UND',1),
 (608,335,94,5.400,0,0.000,1.00,12.460,0.00,10.000,0.000,0.000,'2026-06-27 11:30:33','2026-06-27','UND',1),
 (609,335,15,16.140,0,0.000,1.00,24.930,0.00,20.000,0.000,0.000,'2026-06-27 11:30:33','2026-06-27','UND',1),
 (610,336,30,1.000,0,0.000,1.00,2.000,0.00,2.000,0.000,0.000,'2026-06-27 11:50:18','2026-06-27','UND',1),
 (611,336,24,10.100,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-27 11:50:18','2026-06-27','UND',1),
 (612,337,24,10.100,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-06-29 10:49:04','2026-06-29','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (613,338,24,10.100,0,0.000,1.00,18.700,0.00,15.000,0.000,0.000,'2026-06-29 17:11:52','2026-06-29','UND',1),
 (614,339,54,17.330,0,0.000,1.00,23.000,0.00,23.000,0.000,0.000,'2026-06-30 11:11:56','2026-06-30','UND',1),
 (615,339,85,12.000,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-06-30 11:11:56','2026-06-30','UND',1),
 (616,339,25,5.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-06-30 11:11:56','2026-06-30','UND',1),
 (617,340,31,19.240,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-07-02 11:40:07','2026-07-02','UND',1),
 (618,340,119,1.930,0,0.000,1.00,6.000,0.00,6.000,0.000,0.000,'2026-07-02 11:40:07','2026-07-02','UND',1),
 (619,341,42,10.540,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2026-07-03 10:53:05','2026-07-03','UND',1),
 (620,341,119,1.930,0,0.000,1.00,6.000,0.00,6.000,0.000,0.000,'2026-07-03 10:53:05','2026-07-03','UND',1),
 (621,342,99,14.850,0,0.000,1.00,23.680,0.00,20.000,0.000,0.000,'2026-07-04 12:09:44','2026-07-04','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (622,342,128,11.500,0,0.000,1.00,23.680,0.00,20.000,0.000,0.000,'2026-07-04 12:09:45','2026-07-04','UND',1),
 (623,343,130,1.900,0,0.000,1.00,3.550,0.00,3.000,0.000,0.000,'2026-07-04 17:45:17','2026-07-04','UND',1),
 (624,343,130,1.900,0,0.000,1.00,3.550,0.00,3.000,0.000,0.000,'2026-07-04 17:45:17','2026-07-04','UND',1),
 (625,344,40,14.680,0,0.000,1.00,26.050,0.00,22.000,0.000,0.000,'2026-07-06 09:08:06','2026-07-06','UND',1),
 (626,345,48,30.710,0,0.000,1.00,35.000,0.00,35.000,0.000,0.000,'2026-07-07 15:20:01','2026-07-07','UND',1),
 (627,346,142,13.390,0,0.000,1.00,22.620,0.00,20.000,0.000,0.000,'2026-07-07 15:41:09','2026-07-07','UND',1),
 (628,346,145,16.180,0,0.000,1.00,28.270,0.00,25.000,0.000,0.000,'2026-07-07 15:41:09','2026-07-07','UND',1),
 (629,347,104,9.550,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-07-08 15:36:55','2026-07-08','UND',1),
 (630,347,134,18.350,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-07-08 15:36:55','2026-07-08','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (631,347,24,10.100,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-07-08 15:36:55','2026-07-08','UND',1),
 (632,347,63,1.170,0,0.000,1.00,3.000,0.00,3.000,0.000,0.000,'2026-07-08 15:36:55','2026-07-08','UND',1),
 (633,348,144,15.630,0,0.000,1.00,24.000,0.00,24.000,0.000,0.000,'2026-07-08 18:12:36','2026-07-08','UND',1),
 (634,348,5,12.070,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-08 18:12:36','2026-07-08','UND',1),
 (635,348,63,1.170,0,0.000,1.00,3.000,0.00,3.000,0.000,0.000,'2026-07-08 18:12:36','2026-07-08','UND',1),
 (636,348,24,10.100,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-07-08 18:12:36','2026-07-08','UND',1),
 (637,349,41,14.280,0,0.000,1.00,25.000,0.00,20.000,0.000,0.000,'2026-07-09 09:46:07','2026-07-09','UND',1),
 (638,350,13,2.340,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-07-10 14:48:29','2026-07-10','UND',1),
 (639,350,31,19.240,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-07-10 14:48:29','2026-07-10','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (640,351,140,4.020,0,0.000,1.00,8.120,0.00,7.000,0.000,0.000,'2026-07-10 15:54:44','2026-07-10','UND',1),
 (641,351,92,20.000,0,0.000,1.00,34.820,0.00,30.000,0.000,0.000,'2026-07-10 15:54:44','2026-07-10','UND',1),
 (642,352,94,5.400,0,0.000,1.00,11.610,0.00,10.000,0.000,0.000,'2026-07-10 18:12:18','2026-07-10','UND',1),
 (643,353,65,2.200,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2026-07-11 14:26:24','2026-07-11','UND',1),
 (644,353,22,11.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-11 14:26:24','2026-07-11','UND',1),
 (645,354,54,17.330,0,0.000,1.00,23.000,0.00,23.000,0.000,0.000,'2026-07-13 09:41:38','2026-07-13','UND',1),
 (646,355,36,5.600,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-07-13 09:44:09','2026-07-13','UND',1),
 (647,356,97,13.000,0,0.000,2.00,18.000,0.00,18.000,0.000,0.000,'2026-07-14 15:57:31','2026-07-14','UND',1),
 (648,357,6,15.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-15 17:15:17','2026-07-15','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (649,358,127,12.074,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-07-15 17:16:37','2026-07-15','UND',1),
 (650,359,47,19.970,0,0.000,1.00,27.440,0.00,25.000,0.000,0.000,'2026-07-17 11:17:28','2026-07-17','UND',1),
 (651,360,45,8.900,0,0.000,2.00,15.000,0.00,15.000,0.000,0.000,'2026-07-17 17:21:07','2026-07-17','UND',1),
 (652,360,128,11.500,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-17 17:21:07','2026-07-17','UND',1),
 (653,360,40,14.680,0,0.000,1.00,22.000,0.00,22.000,0.000,0.000,'2026-07-17 17:21:07','2026-07-17','UND',1),
 (654,361,133,9.250,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-07-18 10:02:47','2026-07-18','UND',1),
 (655,362,4,1.000,0,0.000,2.00,2.000,0.00,2.000,0.000,0.000,'2026-07-18 10:19:48','2026-07-18','UND',1),
 (656,363,61,13.340,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-18 10:54:32','2026-07-18','UND',1),
 (657,364,51,20.660,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-07-18 14:42:40','2026-07-18','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (658,365,17,3.000,0,0.000,1.00,7.000,0.00,5.000,0.000,0.000,'2026-07-18 14:49:40','2026-07-18','UND',1),
 (659,366,140,4.020,0,0.000,1.00,7.000,0.00,7.000,0.000,0.000,'2026-07-18 15:23:18','2026-07-18','UND',1),
 (660,366,94,5.400,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-07-18 15:23:18','2026-07-18','UND',1),
 (661,366,12,1.500,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-07-18 15:23:18','2026-07-18','UND',1),
 (662,366,17,3.000,0,0.000,1.00,7.000,0.00,5.000,0.000,0.000,'2026-07-18 15:23:18','2026-07-18','UND',1),
 (663,367,60,8.500,0,0.000,1.00,15.000,0.00,13.000,0.000,0.000,'2026-07-18 16:08:08','2026-07-18','UND',1),
 (664,367,71,9.130,0,0.000,1.00,15.000,0.00,18.000,0.000,0.000,'2026-07-18 16:08:08','2026-07-18','UND',1),
 (665,368,45,8.900,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-07-18 17:41:37','2026-07-18','UND',1),
 (666,368,97,13.000,0,0.000,1.00,15.000,0.00,18.000,0.000,0.000,'2026-07-18 17:41:37','2026-07-18','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (667,368,41,14.280,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-18 17:41:37','2026-07-18','UND',1),
 (668,368,46,7.700,0,0.000,2.00,10.000,0.00,12.000,0.000,0.000,'2026-07-18 17:41:37','2026-07-18','UND',1),
 (669,368,96,4.530,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-07-18 17:41:37','2026-07-18','UND',1),
 (670,368,126,13.050,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-18 17:41:37','2026-07-18','UND',1),
 (671,369,119,1.930,0,0.000,1.00,6.780,0.00,6.000,0.000,0.000,'2026-07-19 10:29:01','2026-07-19','UND',1),
 (672,370,94,5.400,0,0.000,1.00,11.300,0.00,10.000,0.000,0.000,'2026-07-19 10:33:44','2026-07-19','UND',1),
 (673,371,63,1.170,0,0.000,2.00,3.000,0.00,3.000,0.000,0.000,'2026-07-19 11:05:23','2026-07-19','UND',1),
 (674,371,50,12.700,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-07-19 11:05:23','2026-07-19','UND',1),
 (675,372,106,9.110,0,0.000,2.00,15.000,0.00,15.000,0.000,0.000,'2026-07-19 11:37:50','2026-07-19','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (676,372,14,10.470,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-19 11:37:50','2026-07-19','UND',1),
 (677,373,114,2.400,0,0.000,1.00,5.640,0.00,5.000,0.000,0.000,'2026-07-19 12:02:01','2026-07-19','UND',1),
 (678,374,93,8.200,0,0.000,2.00,14.000,0.00,13.000,0.000,0.000,'2026-07-19 12:26:49','2026-07-19','UND',1),
 (679,374,139,1.260,0,0.000,1.00,4.000,0.00,5.000,0.000,0.000,'2026-07-19 12:26:49','2026-07-19','UND',1),
 (680,375,120,7.920,0,0.000,1.00,12.000,0.00,13.000,0.000,0.000,'2026-07-19 12:27:30','2026-07-19','UND',1),
 (681,376,19,5.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-07-19 12:28:36','2026-07-19','UND',1),
 (682,376,133,9.250,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-07-19 12:28:36','2026-07-19','UND',1),
 (683,376,108,18.000,0,0.000,2.00,25.000,0.00,25.000,0.000,0.000,'2026-07-19 12:28:36','2026-07-19','UND',1),
 (684,377,139,1.260,0,0.000,1.00,3.000,0.00,5.000,0.000,0.000,'2026-07-20 14:56:19','2026-07-20','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (685,378,131,5.060,0,0.000,1.00,8.000,0.00,8.000,0.000,0.000,'2026-07-20 17:30:51','2026-07-20','UND',1),
 (686,378,121,9.100,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-07-20 17:30:51','2026-07-20','UND',1),
 (687,379,100,15.620,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-21 17:56:25','2026-07-21','UND',1),
 (688,380,63,1.170,0,0.000,1.00,3.000,0.00,3.000,0.000,0.000,'2026-07-23 11:44:53','2026-07-23','UND',1),
 (689,380,71,9.130,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-07-23 11:44:53','2026-07-23','UND',1),
 (690,381,51,20.660,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-07-24 14:42:16','2026-07-24','UND',1),
 (691,382,26,15.510,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-07-27 13:14:15','2026-07-27','UND',1),
 (692,382,129,13.900,0,0.000,1.00,21.000,0.00,21.000,0.000,0.000,'2026-07-27 13:14:15','2026-07-27','UND',1),
 (693,382,131,5.060,0,0.000,1.00,8.000,0.00,8.000,0.000,0.000,'2026-07-27 13:14:15','2026-07-27','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (694,383,47,19.970,0,0.000,1.00,22.610,0.00,25.000,0.000,0.000,'2026-07-28 09:08:01','2026-07-28','UND',1),
 (695,384,33,9.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-07-28 14:48:10','2026-07-28','UND',1),
 (696,384,122,5.010,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-07-28 14:48:10','2026-07-28','UND',1),
 (697,385,124,22.000,0,0.000,1.00,30.000,0.00,33.000,0.000,0.000,'2026-07-28 16:38:51','2026-07-28','UND',1),
 (698,386,122,5.010,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-07-28 17:01:38','2026-07-28','UND',1),
 (699,387,45,8.900,0,0.000,1.00,16.840,0.00,15.000,0.000,0.000,'2026-07-29 10:10:58','2026-07-29','UND',1),
 (700,387,121,9.100,0,0.000,1.00,16.840,0.00,15.000,0.000,0.000,'2026-07-29 10:10:58','2026-07-29','UND',1),
 (701,388,41,14.280,0,0.000,1.00,27.000,0.00,20.000,0.000,0.000,'2026-07-29 11:21:54','2026-07-29','UND',1),
 (702,389,5,12.070,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-07-30 09:38:46','2026-07-30','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (703,390,114,2.400,0,0.000,1.00,7.000,0.00,5.000,0.000,0.000,'2026-07-30 11:18:55','2026-07-30','UND',1),
 (704,391,109,2.930,0,0.000,1.00,15.000,0.00,12.000,0.000,0.000,'2026-07-30 14:40:59','2026-07-30','UND',1),
 (705,392,30,1.000,0,0.000,1.00,2.000,0.00,2.000,0.000,0.000,'2026-07-31 17:03:12','2026-07-31','UND',1),
 (706,392,139,1.260,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-07-31 17:03:12','2026-07-31','UND',1),
 (707,392,35,0.140,0,0.000,1.00,1.000,0.00,1.000,0.000,0.000,'2026-07-31 17:03:12','2026-07-31','UND',1),
 (708,392,50,12.700,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-07-31 17:03:12','2026-07-31','UND',1),
 (709,392,23,8.000,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-07-31 17:03:12','2026-07-31','UND',1),
 (710,393,43,14.840,0,0.000,1.00,22.360,0.00,20.000,0.000,0.000,'2026-08-01 10:09:27','2026-08-01','UND',1),
 (711,393,142,13.390,0,0.000,1.00,22.360,0.00,20.000,0.000,0.000,'2026-08-01 10:09:27','2026-08-01','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (712,394,110,2.460,0,0.000,1.00,17.000,0.00,12.000,0.000,0.000,'2026-08-01 11:58:01','2026-08-01','UND',1),
 (713,395,123,11.080,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-08-01 12:02:03','2026-08-01','UND',1),
 (714,395,131,5.060,0,0.000,1.00,10.000,0.00,8.000,0.000,0.000,'2026-08-01 12:02:03','2026-08-01','UND',1),
 (715,396,19,5.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-08-01 16:48:31','2026-08-01','UND',1),
 (716,397,94,5.400,0,0.000,1.00,11.210,0.00,10.000,0.000,0.000,'2026-08-01 16:52:03','2026-08-01','UND',1),
 (717,398,133,9.250,0,0.000,1.00,17.000,0.00,15.000,0.000,0.000,'2026-08-03 13:47:22','2026-08-03','UND',1),
 (718,399,101,12.200,0,0.000,1.00,17.000,0.00,17.000,0.000,0.000,'2026-08-03 16:44:56','2026-08-03','UND',1),
 (719,400,88,10.000,0,0.000,1.00,16.570,0.00,15.000,0.000,0.000,'2026-08-04 13:46:11','2026-08-04','UND',1),
 (720,400,111,10.010,0,0.000,1.00,16.570,0.00,15.000,0.000,0.000,'2026-08-04 13:46:11','2026-08-04','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (721,401,129,13.900,0,0.000,1.00,20.000,0.00,21.000,0.000,0.000,'2026-08-04 14:26:13','2026-08-04','UND',1),
 (722,402,31,19.240,0,0.000,1.00,27.620,0.00,25.000,0.000,0.000,'2026-08-04 16:42:09','2026-08-04','UND',1),
 (723,403,40,14.680,0,0.000,1.00,22.000,0.00,22.000,0.000,0.000,'2026-08-04 17:55:32','2026-08-04','UND',1),
 (724,404,139,1.260,0,0.000,2.00,6.500,0.00,5.000,0.000,0.000,'2026-08-06 14:56:44','2026-08-06','UND',1),
 (725,405,45,8.900,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-08-07 17:45:08','2026-08-07','UND',1),
 (726,406,131,5.060,0,0.000,1.00,10.000,0.00,8.000,0.000,0.000,'2026-08-08 10:30:59','2026-08-08','UND',1),
 (727,406,122,5.010,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-08-08 10:30:59','2026-08-08','UND',1),
 (728,407,94,5.400,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-08-12 15:06:05','2026-08-12','UND',1),
 (729,408,94,5.400,0,0.000,1.00,12.000,0.00,10.000,0.000,0.000,'2026-08-13 14:02:13','2026-08-13','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (730,408,16,5.000,0,0.000,1.00,12.000,0.00,10.000,0.000,0.000,'2026-08-13 14:02:13','2026-08-13','UND',1),
 (731,409,61,13.340,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-08-15 10:12:37','2026-08-15','UND',1),
 (732,409,141,23.460,0,0.000,1.00,30.000,0.00,30.000,0.000,0.000,'2026-08-15 10:12:37','2026-08-15','UND',1),
 (733,410,129,13.900,0,0.000,1.00,23.510,0.00,21.000,0.000,0.000,'2026-08-15 15:27:15','2026-08-15','UND',1),
 (734,411,62,19.740,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-08-15 18:03:18','2026-08-15','UND',1),
 (735,411,56,6.200,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-08-15 18:03:18','2026-08-15','UND',1),
 (736,411,2,2.000,0,0.000,1.00,7.000,0.00,7.000,0.000,0.000,'2026-08-15 18:03:18','2026-08-15','UND',1),
 (737,411,139,1.260,0,0.000,2.00,5.000,0.00,5.000,0.000,0.000,'2026-08-15 18:03:18','2026-08-15','UND',1),
 (738,411,76,1.000,0,0.000,2.00,2.000,0.00,2.000,0.000,0.000,'2026-08-15 18:03:18','2026-08-15','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (739,411,139,1.260,0,0.000,2.00,3.000,0.00,5.000,0.000,0.000,'2026-08-15 18:03:18','2026-08-15','UND',1),
 (740,412,14,10.470,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-08-18 10:28:13','2026-08-18','UND',1),
 (741,412,106,9.110,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-08-18 10:28:13','2026-08-18','UND',1),
 (742,412,104,9.550,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-08-18 10:28:13','2026-08-18','UND',1),
 (743,413,131,5.060,0,0.000,2.00,8.000,0.00,8.000,0.000,0.000,'2026-08-18 15:46:01','2026-08-18','UND',1),
 (744,414,61,13.340,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-08-20 13:45:45','2026-08-20','UND',1),
 (745,414,78,2.000,0,0.000,1.00,3.000,0.00,3.000,0.000,0.000,'2026-08-20 13:45:46','2026-08-20','UND',1),
 (746,414,6,15.000,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-08-20 13:45:46','2026-08-20','UND',1),
 (747,415,32,6.700,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-08-20 17:53:13','2026-08-20','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (748,416,100,15.620,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-08-21 10:25:01','2026-08-21','UND',1),
 (749,416,130,1.900,0,0.000,3.00,3.000,0.00,3.000,0.000,0.000,'2026-08-21 10:25:01','2026-08-21','UND',1),
 (750,416,8,5.000,0,0.000,1.00,10.000,0.00,10.000,0.000,0.000,'2026-08-21 10:25:01','2026-08-21','UND',1),
 (751,416,101,12.200,0,0.000,1.00,17.000,0.00,17.000,0.000,0.000,'2026-08-21 10:25:01','2026-08-21','UND',1),
 (752,416,116,2.250,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-08-21 10:25:01','2026-08-21','UND',1),
 (753,417,106,9.110,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-08-21 14:45:31','2026-08-21','UND',1),
 (754,418,40,14.680,0,0.000,1.00,22.000,0.00,22.000,0.000,0.000,'2026-08-21 14:46:52','2026-08-21','UND',1),
 (755,419,95,10.000,0,0.000,1.00,17.410,0.00,15.000,0.000,0.000,'2026-08-22 10:50:53','2026-08-22','UND',1),
 (756,420,14,10.470,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-08-22 16:49:13','2026-08-22','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (757,420,95,10.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-08-22 16:49:13','2026-08-22','UND',1),
 (758,421,14,10.470,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-08-27 11:46:50','2026-08-27','UND',1),
 (759,422,58,2.200,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-08-29 08:47:09','2026-08-29','UND',1),
 (760,423,52,19.600,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-08-29 12:24:08','2026-08-29','UND',1),
 (761,424,102,7.900,0,0.000,1.00,13.000,0.00,12.000,0.000,0.000,'2026-09-01 14:51:00','2026-09-01','UND',1),
 (762,424,54,17.330,0,0.000,1.00,26.000,0.00,23.000,0.000,0.000,'2026-09-01 14:51:00','2026-09-01','UND',1),
 (763,425,26,15.510,0,0.000,1.00,23.000,0.00,25.000,0.000,0.000,'2026-09-01 16:00:29','2026-09-01','UND',1),
 (764,425,118,17.330,0,0.000,1.00,25.000,0.00,28.000,0.000,0.000,'2026-09-01 16:00:29','2026-09-01','UND',1),
 (765,426,98,17.900,0,0.000,1.00,23.000,0.00,23.000,0.000,0.000,'2026-09-01 17:53:54','2026-09-01','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (766,427,131,5.060,0,0.000,1.00,8.000,0.00,8.000,0.000,0.000,'2026-09-03 15:00:32','2026-09-03','UND',1),
 (767,428,54,17.330,0,0.000,1.00,23.000,0.00,23.000,0.000,0.000,'2026-09-03 15:06:50','2026-09-03','UND',1),
 (768,429,104,9.550,0,0.000,1.00,13.000,0.00,15.000,0.000,0.000,'2026-09-04 16:53:56','2026-09-04','UND',1),
 (769,429,104,9.550,0,0.000,1.00,12.000,0.00,15.000,0.000,0.000,'2026-09-04 16:53:56','2026-09-04','UND',1),
 (770,430,54,17.330,0,0.000,1.00,21.000,0.00,23.000,0.000,0.000,'2026-09-05 11:41:58','2026-09-05','UND',1),
 (771,431,50,12.700,0,0.000,1.00,18.000,0.00,18.000,0.000,0.000,'2026-09-05 16:34:30','2026-09-05','UND',1),
 (772,432,160,8.710,0,0.000,2.00,15.000,0.00,15.000,0.000,0.000,'2026-09-08 16:25:26','2026-09-08','UND',1),
 (773,433,98,17.900,0,0.000,1.00,20.000,0.00,23.000,0.000,0.000,'2026-09-10 11:21:09','2026-09-10','UND',1),
 (774,434,129,13.900,0,0.000,1.00,21.000,0.00,21.000,0.000,0.000,'2026-09-10 14:00:44','2026-09-10','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (775,435,159,8.690,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-09-10 14:37:07','2026-09-10','UND',1),
 (776,436,63,2.800,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-09-12 16:12:22','2026-09-12','UND',1),
 (777,437,19,5.000,0,0.000,1.00,12.000,0.00,10.000,0.000,0.000,'2026-09-14 15:42:59','2026-09-14','UND',1),
 (778,438,43,4.880,0,0.000,1.00,11.000,0.00,8.000,0.000,0.000,'2026-09-14 15:46:05','2026-09-14','UND',1),
 (779,439,156,7.260,0,0.000,1.00,12.000,0.00,12.000,0.000,0.000,'2026-09-16 09:15:04','2026-09-16','UND',1),
 (780,440,13,2.340,0,0.000,1.00,5.000,0.00,5.000,0.000,0.000,'2026-09-16 15:13:45','2026-09-16','UND',1),
 (781,441,165,1.100,0,0.000,1.00,6.000,0.00,5.000,0.000,0.000,'2026-09-17 16:57:37','2026-09-17','UND',1),
 (782,442,149,14.900,0,0.000,1.00,24.340,0.00,22.000,0.000,0.000,'2026-09-17 17:59:44','2026-09-17','UND',1),
 (783,443,108,18.000,0,0.000,1.00,25.000,0.00,25.000,0.000,0.000,'2026-09-18 14:42:36','2026-09-18','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (784,444,60,8.500,0,0.000,1.00,14.210,0.00,13.000,0.000,0.000,'2026-09-19 09:38:32','2026-09-19','UND',1),
 (785,445,42,10.540,0,0.000,1.00,16.000,0.00,16.000,0.000,0.000,'2026-09-21 15:31:08','2026-09-21','UND',1),
 (786,446,15,16.140,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-09-22 13:21:58','2026-09-22','UND',1),
 (787,446,65,2.200,0,0.000,1.00,4.000,0.00,4.000,0.000,0.000,'2026-09-22 13:21:58','2026-09-22','UND',1),
 (788,446,96,12.670,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-09-22 13:21:58','2026-09-22','UND',1),
 (789,447,142,13.390,0,0.000,1.00,22.230,0.00,20.000,0.000,0.000,'2026-09-22 14:55:21','2026-09-22','UND',1),
 (790,447,139,1.260,0,0.000,1.00,5.560,0.00,5.000,0.000,0.000,'2026-09-22 14:55:21','2026-09-22','UND',1),
 (791,448,153,10.790,0,0.000,1.00,17.790,0.00,16.000,0.000,0.000,'2026-09-22 15:28:41','2026-09-22','UND',1),
 (792,448,59,3.640,0,0.000,1.00,7.780,0.00,7.000,0.000,0.000,'2026-09-22 15:28:41','2026-09-22','UND',1);
INSERT INTO `detalle_venta` (`iddetalle_venta`,`idventa`,`idarticulo`,`costoarticulo`,`iva`,`precioriginal`,`cantidad`,`precio_venta`,`descuento`,`precio`,`pcomiarti`,`mcomiarti`,`fecha`,`fecha_emi`,`unidad`,`cntgrp`) VALUES 
 (793,449,119,19.800,0,0.000,1.00,30.000,0.00,30.000,0.000,0.000,'2026-09-22 15:53:18','2026-09-22','UND',1),
 (794,449,33,9.000,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-09-22 15:53:18','2026-09-22','UND',1),
 (795,450,116,9.490,0,0.000,1.00,15.000,0.00,15.000,0.000,0.000,'2026-09-23 13:16:04','2026-09-23','UND',1),
 (796,451,90,8.000,0,0.000,1.00,15.000,0.00,16.000,0.000,0.000,'2026-09-24 16:54:37','2026-09-24','UND',1),
 (797,452,123,11.080,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-09-29 16:41:58','2026-09-29','UND',1),
 (798,453,96,12.670,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-10-01 15:19:57','2026-10-01','UND',1),
 (799,454,147,12.700,0,0.000,1.00,20.000,0.00,20.000,0.000,0.000,'2026-10-01 16:38:42','2026-10-01','UND',1);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`devolucion`
--

DROP TABLE IF EXISTS `devolucion`;
CREATE TABLE `devolucion` (
  `iddevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `comprobante` varchar(15) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(20) NOT NULL,
  PRIMARY KEY (`iddevolucion`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`devolucion`
--

/*!40000 ALTER TABLE `devolucion` DISABLE KEYS */;
INSERT INTO `devolucion` (`iddevolucion`,`idventa`,`comprobante`,`fecha_hora`,`user`) VALUES 
 (1,1,'1','2025-11-13 16:52:05','Administracion'),
 (2,2,'2','2025-11-13 17:02:07','Administracion'),
 (3,3,'3','2025-11-15 12:34:59','Administracion'),
 (4,4,'4','2025-11-25 11:52:49','Administracion'),
 (5,5,'5','2025-12-05 18:10:54','Administracion'),
 (6,7,'7','2025-12-09 08:24:05','Administracion'),
 (7,12,'12','2025-12-09 08:24:40','Administracion'),
 (8,13,'13','2025-12-09 08:24:53','Administracion'),
 (9,20,'20','2025-12-09 12:48:38','Administracion'),
 (10,10,'10','2025-12-10 14:26:31','Administracion'),
 (11,48,'48','2025-12-17 14:57:06','Administracion'),
 (12,46,'46','2025-12-17 17:26:30','Administracion'),
 (13,52,'52','2025-12-18 09:15:40','Administracion'),
 (14,62,'62','2025-12-20 14:56:09','Administracion'),
 (15,54,'54','2025-12-22 12:25:26','Administracion'),
 (16,104,'104','2025-12-24 16:49:44','Administracion'),
 (17,140,'140','2025-12-29 11:20:24','Administracion'),
 (18,147,'147','2025-12-30 10:19:24','Administracion'),
 (19,159,'159','2025-12-31 09:34:06','Administracion');
INSERT INTO `devolucion` (`iddevolucion`,`idventa`,`comprobante`,`fecha_hora`,`user`) VALUES 
 (20,166,'166','2025-12-31 09:59:38','Administracion'),
 (21,178,'178','2026-01-13 15:53:15','Administracion'),
 (22,244,'244','2026-04-15 13:16:42','Administracion'),
 (23,249,'249','2026-04-24 09:09:22','Administracion'),
 (24,282,'282','2026-05-13 10:24:42','Administracion'),
 (25,281,'280','2026-05-13 10:24:51','Administracion'),
 (26,302,'302','2026-06-12 12:50:49','Administracion'),
 (27,324,'324','2026-06-20 15:44:36','Administracion'),
 (28,334,'334','2026-06-27 10:49:23','Administracion'),
 (29,336,'336','2026-06-27 15:33:13','Administracion'),
 (30,401,'401','2026-08-08 09:29:03','Administracion');
/*!40000 ALTER TABLE `devolucion` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`devolucioncompras`
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
-- Dumping data for table `svwebkids`.`devolucioncompras`
--

/*!40000 ALTER TABLE `devolucioncompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucioncompras` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL,
  `uuid` varchar(50) DEFAULT NULL,
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
  `tasadif` float(9,3) DEFAULT '0.000',
  `tasa_banco` double(15,3) DEFAULT NULL,
  `usaserie` int(11) DEFAULT '0',
  `serie` text,
  `logo` varchar(50) DEFAULT 'logoempresa.png',
  `actcosto` int(11) DEFAULT '0',
  `fl` int(11) DEFAULT '0',
  `tespecial` int(11) DEFAULT '0',
  `tdif` int(11) DEFAULT '0',
  `calc_util` int(11) DEFAULT '1',
  `calc_comi` int(5) DEFAULT '0',
  `web` int(11) DEFAULT '0',
  `tikect` int(11) DEFAULT '0',
  `nlineas` int(11) DEFAULT '0',
  `orderart` int(2) DEFAULT '0',
  `caracteres` int(11) DEFAULT '34',
  `facfiscalcredito` int(11) DEFAULT '0',
  `relapedido` int(11) DEFAULT '0',
  `formatofac` varchar(20) DEFAULT NULL,
  `formatolp` varchar(20) DEFAULT 'listaprecio',
  `formatoeti` varchar(20) DEFAULT 'etiquetas',
  `precioeti` varchar(20) DEFAULT 'precio1',
  `bordefac` int(11) DEFAULT '0',
  `printpeso` int(5) DEFAULT '0',
  `lastact` date DEFAULT NULL,
  `relaprecios` int(5) DEFAULT '0',
  `difpre` float(9,3) DEFAULT '0.000',
  `claveauto` varchar(50) DEFAULT '00000',
  `utilpre1` int(11) DEFAULT '0',
  `codart` varchar(20) DEFAULT 'codigo',
  `mp2` int(5) DEFAULT '0',
  `mp3` int(5) DEFAULT '0',
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`empresa`
--

/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`idempresa`,`uuid`,`codigo`,`nombre`,`direccion`,`rif`,`telefono`,`fechasistema`,`inicio`,`corre_iva`,`corre_islr`,`tc`,`peso`,`tasaespecial`,`tasadif`,`tasa_banco`,`usaserie`,`serie`,`logo`,`actcosto`,`fl`,`tespecial`,`tdif`,`calc_util`,`calc_comi`,`web`,`tikect`,`nlineas`,`orderart`,`caracteres`,`facfiscalcredito`,`relapedido`,`formatofac`,`formatolp`,`formatoeti`,`precioeti`,`bordefac`,`printpeso`,`lastact`,`relaprecios`,`difpre`,`claveauto`,`utilpre1`,`codart`,`mp2`,`mp3`) VALUES 
 (1,NULL,1,'FRESITA SHOP KIDS','santa cruz de mora','V-25720023-6','04122192007','2025-11-10','2025-11-10',0,0,866.56,4000.00,NULL,30.000,240.000,0,'A','fresitakids.jpg',0,0,0,1,1,0,0,0,15,0,34,0,0,'tcarta','listaprecio','etiquetas','precio1',0,0,NULL,0,0.000,'00000',0,'codigo',0,0);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `connection` text CHARACTER SET utf8mb4 NOT NULL,
  `queue` text CHARACTER SET utf8mb4 NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svwebkids`.`failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`formalibre`
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
-- Dumping data for table `svwebkids`.`formalibre`
--

/*!40000 ALTER TABLE `formalibre` DISABLE KEYS */;
/*!40000 ALTER TABLE `formalibre` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`gastos`
--

DROP TABLE IF EXISTS `gastos`;
CREATE TABLE `gastos` (
  `idgasto` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `tipogasto` int(5) DEFAULT '1',
  `control` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `base` float(9,3) DEFAULT '0.000',
  `iva` float(9,3) DEFAULT '0.000',
  `exento` float(9,3) DEFAULT '0.000',
  `monto` float(9,3) DEFAULT NULL,
  `saldo` float(9,3) DEFAULT NULL,
  `retenido` float(9,3) DEFAULT '0.000',
  `emision` date DEFAULT NULL,
  `tasa` float(9,3) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `estatus` int(11) DEFAULT '0',
  PRIMARY KEY (`idgasto`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`gastos`
--

/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (1,7,'01',1,'0','MANO DE OBRA PINTURA FRESITA KIDS',40.000,0.000,0.000,40.000,0.000,0.000,'2025-12-17',276.580,'2025-12-17','Administracion',0),
 (2,7,'01',1,'0','TOMA CORRIENTE DE CAMARAS',2.000,0.000,0.000,2.000,0.000,0.000,'2025-12-17',276.580,'2025-12-17','Administracion',0),
 (3,7,'01',1,'0','PENDRIVE',5.000,0.000,0.000,5.000,0.000,0.000,'2025-12-21',285.400,'2025-12-21','Administracion',0),
 (4,7,'01',1,'0','CORREA NIÑO JOAQUIN',4.000,0.000,0.000,4.000,0.000,0.000,'2025-12-22',285.400,'2025-12-22','Administracion',0),
 (5,7,'01',1,'0','VIEJO NEGOCIO AIXA',22.000,0.000,0.000,22.000,0.000,0.000,'2025-12-28',294.960,'2025-12-28','Administracion',0),
 (6,7,'01',1,'0','NEGOCIO GENESIS Y MIRNA',8.000,0.000,0.000,8.000,0.000,0.000,'2025-12-28',294.960,'2025-12-28','Administracion',0),
 (7,7,'01',1,'0','NEGOCIO AIXA NUEVO',8.000,0.000,0.000,8.000,0.000,0.000,'2025-12-28',294.960,'2025-12-28','Administracion',0),
 (8,7,'01',1,'0','PENDRIVE',5.000,0.000,0.000,5.000,0.000,0.000,'2025-12-30',301.370,'2025-12-30','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (9,7,'01',1,'01','NOMINA ENERO',1.000,0.000,72.000,73.000,0.000,0.000,'2026-01-31',370.250,'2026-01-31','Administracion',0),
 (10,7,'01',1,'01','PILAS PARA EL TELEVISOR',1.000,0.000,0.000,1.000,0.000,0.000,'2026-02-11',388.740,'2026-02-11','Administracion',0),
 (11,7,'01',1,'0','BOLSA DE BASURA',1.000,0.000,0.000,1.000,0.000,0.000,'2026-02-18',396.370,'2026-02-18','Administracion',0),
 (12,9,'01',1,'0','NOMINA ANDREA MARQUEZ',130.000,0.000,0.000,130.000,0.000,0.000,'2026-02-18',396.370,'2026-02-18','Administracion',0),
 (13,7,'01',1,'0','ALQUILER FRESITA KIDS',75.000,0.000,0.000,75.000,0.000,0.000,'2026-02-18',396.370,'2026-02-18','Administracion',0),
 (14,7,'57657',1,'0','ALQUILER MES ENERO',75.000,0.000,0.000,75.000,0.000,0.000,'2026-02-18',396.370,'2026-02-18','Administracion',0),
 (15,7,'01',1,'01','MANTENIMIENTO DE AIRE',20.000,0.000,0.000,20.000,0.000,0.000,'2026-02-24',407.380,'2026-02-24','Administracion',0),
 (16,7,'01',1,'01','WIFI DEL MES DE FEBRERO',20.000,0.000,0.000,20.000,0.000,0.000,'2026-02-25',411.080,'2026-02-25','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (17,7,'01',1,'01','ENVIO',25.000,0.000,0.000,25.000,0.000,0.000,'2026-02-26',414.050,'2026-02-26','Administracion',0),
 (18,7,'01',1,'0','gasto de modelo fresita kids',15.000,0.000,0.000,15.000,0.000,0.000,'2026-02-27',417.360,'2026-02-27','Administracion',0),
 (19,9,'01',1,'01','PAGO DE LA QUINCENA DE FEBRERO',62.000,0.000,0.000,62.000,0.000,0.000,'2026-03-05',427.930,'2026-03-05','Administracion',0),
 (20,7,'01',1,'01','PAGO A LUISA DE REDES',59.000,0.000,0.000,59.000,0.000,0.000,'2026-03-07',433.170,'2026-03-07','Administracion',0),
 (21,7,'01',1,'01','PUBLICIDAD MES DE ENERO LUISA',50.000,0.000,0.000,50.000,0.000,0.000,'2026-03-07',433.170,'2026-03-07','Administracion',0),
 (22,9,'01',1,'01','PAGO DE LA QUINCENA DE MARZO',130.000,0.000,0.000,130.000,0.000,0.000,'2026-03-19',455.250,'2026-03-19','Administracion',0),
 (23,7,'01',1,'01','PAGO DE ALQUILER MES DE MARZO',75.000,0.000,0.000,75.000,0.000,0.000,'2026-03-19',455.250,'2026-03-19','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (24,7,'01',1,'01','BOLSA TOBITA',1.000,0.000,0.000,1.000,0.000,0.000,'2026-04-04',370.000,'2026-04-04','Administracion',0),
 (25,7,'01',1,'01','2QUINCENA DEL MES DE MARZO PUBLICIDAD REDES LUISA',50.000,0.000,0.000,50.000,0.000,0.000,'2026-04-04',474.060,'2026-04-04','Administracion',0),
 (26,7,'01',1,'01','PAGO A LA SEÑORA MIRNA DE BOLSAS PARA LA TIENDA DE FRESITA SHOP',9.000,0.000,0.000,9.000,0.000,0.000,'2026-04-08',475.010,'2026-04-08','Administracion',0),
 (27,7,'01',1,'01','JABON PARA LA TIENDA FRESITA SHOP KIDS',1.600,0.000,0.000,1.600,0.000,0.000,'2026-04-08',475.010,'2026-04-08','Administracion',0),
 (28,7,'01',1,'01','SORTEO POR IG PREMIOS 3',25.000,0.000,0.000,25.000,0.000,0.000,'2026-04-09',475.960,'2026-04-09','Administracion',0),
 (29,7,'01',1,'01','MISTOLIN AJAX',3.000,0.000,0.000,3.000,0.000,0.000,'2026-04-10',476.430,'2026-04-10','Administracion',0),
 (30,7,'01',1,'01','PAGO DE ALQUILER DEL MES DE ABRIL',60.000,0.000,0.000,60.000,0.000,0.000,'2026-04-17',480.260,'2026-04-17','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (31,9,'01',1,'01','PAGO DE QUINCENA MES DE ABRIL',104.000,0.000,0.000,104.000,0.000,0.000,'2026-04-17',480.260,'2026-04-17','Administracion',0),
 (32,7,'01',1,'01','PUBLICIDAD MES DE ABRIL LISETH',50.000,0.000,0.000,50.000,0.000,0.000,'2026-04-17',480.260,'2026-04-17','Administracion',0),
 (33,7,'01',1,'01','PAGO DE INTERNET MES DE ABRIL',20.000,0.000,0.000,20.000,0.000,0.000,'2026-04-23',483.340,'2026-04-23','Administracion',0),
 (34,7,'01',1,NULL,'TIRRO Y  BOLSA TOVITO',3.610,0.000,0.000,3.610,0.000,0.000,'2026-04-25',484.740,'2026-04-25','Administracion',0),
 (35,9,'01',1,'01','PAGO DE NOMINA MES DE ABRIL',60.000,0.000,0.000,60.000,0.000,0.000,'2026-05-02',489.550,'2026-05-02','Administracion',0),
 (36,7,'01',1,'01','PAGO DE REDES LISETH MES DE MAYO',50.000,0.000,0.000,50.000,0.000,0.000,'2026-05-09',499.860,'2026-05-09','Administracion',0),
 (37,7,'01',1,'01','MANTENIMIENTO DE AIRE',20.000,0.000,0.000,20.000,0.000,0.000,'2026-05-12',504.910,'2026-05-12','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (38,7,'01',1,'01','mistolin ajax',3.000,0.000,0.000,3.000,0.000,0.000,'2026-05-14',510.790,'2026-05-14','Administracion',0),
 (39,9,'01',1,'01','PAGO DE LA QUINCENA DE MAYO GENESIS',25.000,0.000,0.000,25.000,0.000,0.000,'2026-05-16',517.960,'2026-05-16','Administracion',0),
 (40,7,'01',1,'01','JESUS VIDEOS',2.000,0.000,0.000,2.000,0.000,0.000,'2026-06-02',557.970,'2026-06-02','Administracion',0),
 (41,9,'01',1,'01','PAGO 15 DE MAYO GENESIS',100.000,0.000,0.000,100.000,0.000,0.000,'2026-06-02',557.970,'2026-06-02','Administracion',0),
 (42,9,'01',1,'01','NOMINA GENESIS 30 DE MAYO',150.000,0.000,0.000,150.000,0.000,0.000,'2026-06-02',557.970,'2026-06-02','Administracion',0),
 (43,7,'01',1,'01','PUBLICIDAD MES DE JUNIO',50.000,0.000,0.000,50.000,0.000,0.000,'2026-06-02',557.970,'2026-06-02','Administracion',0),
 (44,7,'01',1,'01','Desinfectante',1.000,0.000,0.000,1.000,0.000,0.000,'2026-06-05',563.290,'2026-06-05','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (45,7,'01',1,'01','GASTO ENVIO TOVAR',5.000,0.000,0.000,5.000,0.000,0.000,'2026-06-10',572.680,'2026-06-10','Administracion',0),
 (46,7,'01',1,'01','1 COMPUTADORA Y 1 DE LLEVARLE A LISETH ENVIO DE TRAJE DE BAÑO',2.000,0.000,0.000,2.000,0.000,0.000,'2026-06-15',587.410,'2026-06-15','Administracion',0),
 (47,9,'01',1,'01','nomina genesis 15 de junio',130.000,0.000,0.000,130.000,0.000,0.000,'2026-06-17',592.520,'2026-06-17','Administracion',0),
 (48,9,'01',1,'01','NOMINA GENESIS 30 DE JUNIO',20.000,0.000,0.000,20.000,0.000,0.000,'2026-07-01',623.020,'2026-07-01','Administracion',0),
 (49,9,'01',1,'01','NOMINA GENESIS 30 DE JUNIO',118.000,0.000,0.000,118.000,0.000,0.000,'2026-07-01',623.020,'2026-07-01','Administracion',0),
 (50,7,'01',1,'01','ETIQUETAS FRESITA KIDS',35.000,0.000,0.000,35.000,0.000,0.000,'2026-07-01',633.360,'2026-07-01','Administracion',0),
 (51,7,'01',1,'01','PUBLICIDAD MES DE JULIO FRESITA SHOP KIDS',50.000,0.000,0.000,50.000,0.000,0.000,'2026-07-04',667.050,'2026-07-04','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (52,9,'01',1,'01','PAGO DE LA QUINCENA DE JULIO',130.000,0.000,0.000,130.000,0.000,0.000,'2026-07-17',732.480,'2026-07-17','Administracion',0),
 (53,1,'01',1,'01','CINTILLOS MINNIE PARA LAS NIÑAS PUBLICIDAD',4.000,0.000,0.000,4.000,0.000,0.000,'2026-07-18',736.930,'2026-07-18','Administracion',0),
 (54,7,'01',1,'01','PAGO DE INTERNET MES DE JULIO',35.000,0.000,0.000,35.000,0.000,0.000,'2026-07-31',744.000,'2026-07-31','Administracion',0),
 (55,7,'01',1,'01','REDES FRESITA KIDS',50.000,0.000,0.000,50.000,0.000,0.000,'2026-08-01',748.790,'2026-08-01','Administracion',0),
 (56,9,'01',1,'01','QUINCENA MES DE JULIO',140.000,0.000,0.000,140.000,0.000,0.000,'2026-08-01',861.190,'2026-08-01','Administracion',0),
 (57,7,'01',1,'01','DETALLES VIDEOS DIA DEL NIÑO',9.970,0.000,0.000,9.970,0.000,0.000,'2026-08-01',855.000,'2026-08-01','Administracion',0),
 (58,7,'01',1,'01','AJAX PARA LIMPIAR',2.000,0.000,0.000,2.000,0.000,0.000,'2026-08-01',855.000,'2026-08-01','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (59,7,'01',1,'01','ALFOMBRA PARA FOTOS',34.000,0.000,0.000,34.000,0.000,0.000,'2026-08-03',748.790,'2026-08-03','Administracion',0),
 (60,9,'01',1,'01','PAGO DE LA QUINCENA DE AGOSTO',130.000,0.000,0.000,130.000,0.000,0.000,'2026-08-15',772.540,'2026-08-15','Administracion',0),
 (61,7,'01',1,'01','ALQUILER FRESITA KIDS MES DE AGOSTO',75.000,0.000,0.000,75.000,0.000,0.000,'2026-08-22',894.490,'2026-08-22','Administracion',0),
 (62,7,'01',1,'01','ARREGLO DE CORTINAS',3.000,0.000,0.000,3.000,0.000,0.000,'2026-08-24',784.660,'2026-08-24','Administracion',0),
 (63,7,'01',1,'01','REDES FRESITA KIDS MES DE SEPTIEMBRE',50.000,0.000,0.000,50.000,0.000,0.000,'2026-09-01',798.330,'2026-09-01','Administracion',0),
 (64,7,'01',1,'01','NOMINA GENESIS 31 AGOSTO',120.000,0.000,0.000,120.000,0.000,0.000,'2026-09-01',798.330,'2026-09-01','Administracion',0),
 (65,7,'01',1,'01','DOS TIJERAS DE FRESITA SHOP DE 3.8 CADA UNA Y UN AJAX DE KIDS',10.600,0.000,0.000,10.600,0.000,0.000,'2026-09-04',807.390,'2026-09-04','Administracion',0);
INSERT INTO `gastos` (`idgasto`,`idpersona`,`documento`,`tipogasto`,`control`,`descripcion`,`base`,`iva`,`exento`,`monto`,`saldo`,`retenido`,`emision`,`tasa`,`fecha`,`usuario`,`estatus`) VALUES 
 (66,7,'01',1,'01','internet septiembre',47.500,0.000,0.000,47.500,0.000,0.000,'2026-09-16',980.000,'2026-09-16','Administracion',0),
 (67,7,'01',1,'01','ALQUILER FRESITA KIDS',74.780,0.000,0.000,74.780,0.000,0.000,'2026-09-16',980.000,'2026-09-16','Administracion',0),
 (68,7,'01',1,'01','GASTO AIXA',10.670,0.000,0.000,10.670,0.000,0.000,'2026-09-16',846.510,'2026-09-16','Administracion',0),
 (69,9,'01',1,'01','QUINCENA MES DE SEPTIEMBRE',130.000,0.000,0.000,130.000,0.000,0.000,'2026-09-17',846.510,'2026-09-17','Administracion',0),
 (70,7,'01',1,'01','GASTO DE CONSUMO MODELOS',5.000,0.000,0.000,5.000,0.000,0.000,'2026-09-22',852.420,'2026-09-22','Administracion',0),
 (71,7,'01',1,'01','REDES FRESITA KIDS',50.000,0.000,0.000,50.000,10.000,0.000,'2026-10-03',866.560,'2026-10-03','Administracion',0);
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`kardex`
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
) ENGINE=InnoDB AUTO_INCREMENT=1066 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`kardex`
--

/*!40000 ALTER TABLE `kardex` DISABLE KEYS */;
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (1,'2025-11-13 14:37:29','COMP-1-01',1,20.000,0.830,'Administracion',1),
 (2,'2025-11-13 14:37:29','COMP-1-01',2,4.000,2.000,'Administracion',1),
 (3,'2025-11-13 14:37:29','COMP-1-01',3,3.000,0.890,'Administracion',1),
 (4,'2025-11-13 14:37:29','COMP-1-01',4,3.000,1.000,'Administracion',1),
 (5,'2025-11-13 14:37:29','COMP-1-01',5,2.000,2.210,'Administracion',1),
 (6,'2025-11-13 14:37:29','COMP-1-01',6,8.000,2.600,'Administracion',1),
 (7,'2025-11-13 14:37:29','COMP-1-01',7,1.000,2.800,'Administracion',1),
 (8,'2025-11-13 14:37:29','COMP-1-01',8,3.000,5.000,'Administracion',1),
 (9,'2025-11-13 14:37:29','COMP-1-01',9,1.000,1.000,'Administracion',1),
 (10,'2025-11-13 14:37:29','COMP-1-01',10,7.000,1.000,'Administracion',1),
 (11,'2025-11-13 14:37:29','COMP-1-01',11,1.000,8.000,'Administracion',1),
 (12,'2025-11-13 14:37:29','COMP-1-01',12,9.000,1.500,'Administracion',1),
 (13,'2025-11-13 14:37:29','COMP-1-01',13,4.000,1.000,'Administracion',1),
 (14,'2025-11-13 14:37:29','COMP-1-01',14,20.000,11.600,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (15,'2025-11-13 14:37:29','COMP-1-01',15,26.000,10.000,'Administracion',1),
 (16,'2025-11-13 14:37:29','COMP-1-01',16,5.000,5.000,'Administracion',1),
 (17,'2025-11-13 14:37:29','COMP-1-01',17,15.000,3.000,'Administracion',1),
 (18,'2025-11-13 14:37:29','COMP-1-01',18,10.000,3.000,'Administracion',1),
 (19,'2025-11-13 14:37:29','COMP-1-01',19,12.000,5.000,'Administracion',1),
 (20,'2025-11-13 14:37:29','COMP-1-01',20,1.000,7.600,'Administracion',1),
 (21,'2025-11-13 14:37:29','COMP-1-01',21,6.000,8.000,'Administracion',1),
 (22,'2025-11-13 14:37:29','COMP-1-01',22,2.000,11.000,'Administracion',1),
 (23,'2025-11-13 14:37:29','COMP-1-01',23,3.000,8.000,'Administracion',1),
 (24,'2025-11-13 14:37:29','COMP-1-01',24,1.000,5.000,'Administracion',1),
 (25,'2025-11-13 14:37:29','COMP-1-01',25,5.000,5.000,'Administracion',1),
 (26,'2025-11-13 14:37:29','COMP-1-01',26,4.000,7.000,'Administracion',1),
 (27,'2025-11-13 14:37:29','COMP-1-01',27,4.000,11.600,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (28,'2025-11-13 14:37:29','COMP-1-01',28,2.000,7.620,'Administracion',1),
 (29,'2025-11-13 14:37:29','COMP-1-01',29,1.000,7.790,'Administracion',1),
 (30,'2025-11-13 14:37:29','COMP-1-01',30,1.000,9.000,'Administracion',1),
 (31,'2025-11-13 14:37:29','COMP-1-01',31,18.000,5.400,'Administracion',1),
 (32,'2025-11-13 14:37:29','COMP-1-01',32,21.000,6.700,'Administracion',1),
 (33,'2025-11-13 14:37:29','COMP-1-01',33,51.000,8.600,'Administracion',1),
 (34,'2025-11-13 14:37:29','COMP-1-01',34,40.000,9.200,'Administracion',1),
 (35,'2025-11-13 14:37:29','COMP-1-01',35,9.000,0.140,'Administracion',1),
 (36,'2025-11-13 14:37:29','COMP-1-01',36,2.000,5.900,'Administracion',1),
 (37,'2025-11-13 14:37:29','COMP-1-01',37,9.000,3.000,'Administracion',1),
 (38,'2025-11-13 14:37:29','COMP-1-01',38,3.000,5.000,'Administracion',1),
 (39,'2025-11-13 14:37:29','COMP-1-01',39,3.000,4.000,'Administracion',1),
 (40,'2025-11-13 17:50:25','VENT-1',3,1.000,0.890,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (41,'2025-11-13 16:52:05','DEV:V-1',3,1.000,2.000,'Administracion',1),
 (42,'2025-11-13 18:01:38','VENT-2',5,1.000,2.210,'Administracion',2),
 (43,'2025-11-13 17:02:07','DEV:V-2',5,1.000,4.000,'Administracion',1),
 (44,'2025-11-15 13:34:17','VENT-3',4,1.000,1.000,'Administracion',2),
 (45,'2025-11-15 12:34:59','DEV:V-3',4,1.000,2.000,'Administracion',1),
 (46,'2025-11-24 14:10:12','COMP-2-01',40,20.000,15.400,'Administracion',1),
 (47,'2025-11-25 12:24:41','COMP-3-01',41,20.000,14.280,'Administracion',1),
 (48,'2025-11-25 12:24:41','COMP-3-01',42,5.000,23.010,'Administracion',1),
 (49,'2025-11-25 12:24:41','COMP-3-01',43,10.000,14.840,'Administracion',1),
 (50,'2025-11-25 12:24:41','COMP-3-01',44,3.000,28.500,'Administracion',1),
 (51,'2025-11-25 12:24:41','COMP-3-01',45,3.000,12.650,'Administracion',1),
 (52,'2025-11-25 12:24:41','COMP-3-01',46,7.000,7.700,'Administracion',1),
 (53,'2025-11-25 12:24:41','COMP-3-01',47,26.000,19.970,'Administracion',1),
 (54,'2025-11-25 12:24:41','COMP-3-01',48,8.000,30.710,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (55,'2025-11-25 12:24:41','COMP-3-01',49,9.000,23.740,'Administracion',1),
 (56,'2025-11-25 12:24:41','COMP-3-01',50,18.000,12.700,'Administracion',1),
 (57,'2025-11-25 12:24:41','COMP-3-01',51,13.000,20.660,'Administracion',1),
 (58,'2025-11-25 12:24:41','COMP-3-01',52,6.000,19.600,'Administracion',1),
 (59,'2025-11-25 12:24:41','COMP-3-01',53,8.000,10.400,'Administracion',1),
 (60,'2025-11-25 12:24:41','COMP-3-01',54,17.000,17.330,'Administracion',1),
 (61,'2025-11-25 12:52:11','VENT-4',46,1.000,7.700,'Administracion',2),
 (62,'2025-11-25 11:52:49','DEV:V-4',46,1.000,12.750,'Administracion',1),
 (63,'2025-11-27 16:41:58','COMP-4-01',55,10.000,0.540,'Administracion',1),
 (64,'2025-11-27 16:41:58','COMP-4-01',56,5.000,6.200,'Administracion',1),
 (65,'2025-11-27 16:41:58','COMP-4-01',57,5.000,15.170,'Administracion',1),
 (66,'2025-11-27 16:41:58','COMP-4-01',58,11.000,2.200,'Administracion',1),
 (67,'2025-11-27 16:41:58','COMP-4-01',59,16.000,3.640,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (68,'2025-11-27 16:41:58','COMP-4-01',60,6.000,10.130,'Administracion',1),
 (69,'2025-11-27 16:41:58','COMP-4-01',61,21.000,13.340,'Administracion',1),
 (70,'2025-11-27 16:41:58','COMP-4-01',62,2.000,19.740,'Administracion',1),
 (71,'2025-11-27 16:41:58','COMP-4-01',63,6.000,3.800,'Administracion',1),
 (72,'2025-11-27 16:41:58','COMP-4-01',64,1.000,9.550,'Administracion',1),
 (73,'2025-11-27 16:41:58','COMP-4-01',65,5.000,2.200,'Administracion',1),
 (74,'2025-11-27 16:41:58','COMP-4-01',66,5.000,4.200,'Administracion',1),
 (75,'2025-12-01 19:52:55','COMP-5-01',67,17.000,6.000,'Administracion',1),
 (76,'2025-12-01 19:52:55','COMP-5-01',68,4.000,8.000,'Administracion',1),
 (77,'2025-12-01 19:52:55','COMP-5-01',69,5.000,4.000,'Administracion',1),
 (78,'2025-12-01 19:52:55','COMP-5-01',70,4.000,12.000,'Administracion',1),
 (79,'2025-12-01 19:52:55','COMP-5-01',71,3.000,7.000,'Administracion',1),
 (80,'2025-12-01 19:52:55','COMP-5-01',72,4.000,10.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (81,'2025-12-01 19:52:55','COMP-5-01',73,4.000,3.000,'Administracion',1),
 (82,'2025-12-01 19:52:55','COMP-5-01',74,16.000,2.000,'Administracion',1),
 (83,'2025-12-01 19:52:55','COMP-5-01',75,5.000,6.000,'Administracion',1),
 (84,'2025-12-01 19:52:55','COMP-5-01',76,15.000,1.000,'Administracion',1),
 (85,'2025-12-01 19:52:55','COMP-5-01',77,2.000,3.000,'Administracion',1),
 (86,'2025-12-01 19:52:55','COMP-5-01',78,6.000,2.000,'Administracion',1),
 (87,'2025-12-01 19:52:55','COMP-5-01',79,10.000,0.500,'Administracion',1),
 (88,'2025-12-01 19:52:55','COMP-5-01',80,1.000,20.000,'Administracion',1),
 (89,'2025-12-01 19:52:55','COMP-5-01',81,2.000,1.000,'Administracion',1),
 (90,'2025-12-01 19:52:55','COMP-5-01',82,4.000,1.000,'Administracion',1),
 (91,'2025-12-01 19:52:55','COMP-5-01',83,1.000,2.000,'Administracion',1),
 (92,'2025-12-01 19:52:55','COMP-5-01',84,1.000,3.000,'Administracion',1),
 (93,'2025-12-01 19:52:55','COMP-5-01',85,2.000,12.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (94,'2025-12-01 19:52:55','COMP-5-01',86,3.000,10.000,'Administracion',1),
 (95,'2025-12-01 19:52:55','COMP-5-01',87,19.000,6.000,'Administracion',1),
 (96,'2025-12-01 19:52:55','COMP-5-01',88,7.000,10.000,'Administracion',1),
 (97,'2025-12-01 19:52:55','COMP-5-01',89,7.000,13.000,'Administracion',1),
 (98,'2025-12-01 19:52:55','COMP-5-01',90,1.000,8.000,'Administracion',1),
 (99,'2025-12-01 19:52:55','COMP-5-01',91,2.000,10.000,'Administracion',1),
 (100,'2025-12-01 19:52:55','COMP-5-01',92,6.000,20.000,'Administracion',1),
 (101,'2025-12-01 19:52:55','COMP-5-01',103,1.000,40.000,'Administracion',1),
 (102,'2025-12-01 19:57:13','COMP-6-01',93,22.000,8.200,'Administracion',1),
 (103,'2025-12-01 19:57:13','COMP-6-01',94,28.000,5.400,'Administracion',1),
 (104,'2025-12-01 19:57:13','COMP-6-01',95,10.000,10.000,'Administracion',1),
 (105,'2025-12-01 19:57:13','COMP-6-01',96,11.000,17.000,'Administracion',1),
 (106,'2025-12-01 19:57:13','COMP-6-01',97,18.000,13.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (107,'2025-12-01 19:57:13','COMP-6-01',98,9.000,17.900,'Administracion',1),
 (108,'2025-12-01 19:57:13','COMP-6-01',99,7.000,14.850,'Administracion',1),
 (109,'2025-12-01 19:57:13','COMP-6-01',100,9.000,15.620,'Administracion',1),
 (110,'2025-12-01 19:57:13','COMP-6-01',101,16.000,12.200,'Administracion',1),
 (111,'2025-12-01 19:57:13','COMP-6-01',102,8.000,7.900,'Administracion',1),
 (112,'2025-12-03 10:00:27','COMP-7-01',104,23.000,8.830,'Administracion',1),
 (113,'2025-12-03 10:00:27','COMP-7-01',105,6.000,8.330,'Administracion',1),
 (114,'2025-12-03 10:00:27','COMP-7-01',106,18.000,9.110,'Administracion',1),
 (115,'2025-12-03 10:00:27','COMP-7-01',107,6.000,7.500,'Administracion',1),
 (116,'2025-12-05 19:04:41','VENT-5',80,1.000,20.000,'Administracion',2),
 (117,'2025-12-05 19:04:41','VENT-5',18,1.000,3.000,'Administracion',2),
 (118,'2025-12-05 18:10:54','DEV:V-5',80,1.000,40.000,'Administracion',1),
 (119,'2025-12-05 18:10:54','DEV:V-5',18,1.000,7.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (120,'2025-12-06 16:59:57','VENT-6',41,1.000,14.280,'Administracion',2),
 (121,'2025-12-06 17:34:12','VENT-7',47,1.000,19.970,'Administracion',2),
 (122,'2025-12-06 17:38:57','VENT-8',41,1.000,14.280,'Administracion',2),
 (123,'2025-12-06 17:38:57','VENT-8',93,1.000,8.200,'Administracion',2),
 (124,'2025-12-06 17:38:57','VENT-8',40,1.000,15.400,'Administracion',2),
 (125,'2025-12-06 17:38:57','VENT-8',106,1.000,9.110,'Administracion',2),
 (126,'2025-12-06 17:38:57','VENT-8',14,1.000,11.600,'Administracion',2),
 (127,'2025-12-06 17:38:57','VENT-8',50,1.000,12.700,'Administracion',2),
 (128,'2025-12-06 17:38:57','VENT-8',43,1.000,14.840,'Administracion',2),
 (129,'2025-12-06 17:38:57','VENT-8',14,1.000,11.600,'Administracion',2),
 (130,'2025-12-06 17:46:01','VENT-9',54,1.000,17.330,'Administracion',2),
 (131,'2025-12-06 17:49:37','VENT-10',94,1.000,5.400,'Administracion',2),
 (132,'2025-12-06 17:49:37','VENT-10',47,1.000,19.970,'Administracion',2),
 (133,'2025-12-06 17:49:37','VENT-10',15,1.000,10.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (134,'2025-12-06 17:49:37','VENT-10',19,1.000,5.000,'Administracion',2),
 (135,'2025-12-06 17:49:37','VENT-10',43,1.000,14.840,'Administracion',2),
 (136,'2025-12-06 17:49:37','VENT-10',63,1.000,3.800,'Administracion',2),
 (137,'2025-12-06 17:49:37','VENT-10',61,1.000,13.340,'Administracion',2),
 (138,'2025-12-06 17:49:37','VENT-10',61,1.000,13.340,'Administracion',2),
 (139,'2025-12-06 17:49:37','VENT-10',26,1.000,7.000,'Administracion',2),
 (140,'2025-12-06 17:50:56','VENT-11',19,1.000,5.000,'Administracion',2),
 (141,'2025-12-06 17:54:23','VENT-12',95,1.000,10.000,'Administracion',2),
 (142,'2025-12-06 17:59:09','VENT-13',14,1.000,11.600,'Administracion',2),
 (143,'2025-12-06 17:59:09','VENT-13',51,1.000,20.660,'Administracion',2),
 (144,'2025-12-06 17:59:09','VENT-13',50,1.000,12.700,'Administracion',2),
 (145,'2025-12-06 18:03:23','VENT-14',43,1.000,14.840,'Administracion',2),
 (146,'2025-12-06 18:03:23','VENT-14',2,1.000,2.000,'Administracion',2),
 (147,'2025-12-06 18:05:39','VENT-15',79,1.000,0.500,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (148,'2025-12-06 18:05:39','VENT-15',12,1.000,1.500,'Administracion',2),
 (149,'2025-12-06 18:26:43','VENT-16',6,1.000,2.600,'Administracion',2),
 (150,'2025-12-06 18:43:52','VENT-17',49,1.000,23.740,'Administracion',2),
 (151,'2025-12-06 18:43:52','VENT-17',43,1.000,14.840,'Administracion',2),
 (152,'2025-12-06 18:43:52','VENT-17',12,1.000,1.500,'Administracion',2),
 (153,'2025-12-06 18:43:52','VENT-17',61,1.000,13.340,'Administracion',2),
 (154,'2025-12-06 18:43:52','VENT-17',55,4.000,0.540,'Administracion',2),
 (155,'2025-12-08 10:23:05','VENT-18',31,1.000,5.400,'Administracion',2),
 (156,'2025-12-08 10:23:05','VENT-18',5,1.000,2.210,'Administracion',2),
 (157,'2025-12-08 10:23:05','VENT-18',6,1.000,2.600,'Administracion',2),
 (158,'2025-12-08 16:10:52','VENT-19',40,1.000,15.400,'Administracion',2),
 (159,'2025-12-08 16:10:52','VENT-19',49,1.000,23.740,'Administracion',2),
 (160,'2025-12-09 08:24:05','DEV:V-7',47,1.000,34.000,'Administracion',1),
 (161,'2025-12-09 08:24:40','DEV:V-12',95,1.000,20.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (162,'2025-12-09 08:24:53','DEV:V-13',14,1.000,20.000,'Administracion',1),
 (163,'2025-12-09 08:24:53','DEV:V-13',51,1.000,35.000,'Administracion',1),
 (164,'2025-12-09 08:24:53','DEV:V-13',50,1.000,25.000,'Administracion',1),
 (165,'2025-12-09 13:38:21','VENT-20',1,1.000,0.830,'Administracion',2),
 (166,'2025-12-09 13:38:21','VENT-20',43,1.000,14.840,'Administracion',2),
 (167,'2025-12-09 12:48:38','DEV:V-20',1,1.000,4.000,'Administracion',1),
 (168,'2025-12-09 12:48:38','DEV:V-20',43,1.000,27.000,'Administracion',1),
 (169,'2025-12-09 13:50:26','VENT-21',1,1.000,0.830,'Administracion',2),
 (170,'2025-12-09 13:50:26','VENT-21',43,1.000,14.840,'Administracion',2),
 (171,'2025-12-09 14:05:28','VENT-22',101,1.000,12.200,'Administracion',2),
 (172,'2025-12-09 14:05:28','VENT-22',51,1.000,20.660,'Administracion',2),
 (173,'2025-12-09 15:54:41','VENT-23',68,1.000,8.000,'Administracion',2),
 (174,'2025-12-09 15:54:41','VENT-23',24,1.000,5.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (175,'2025-12-09 15:54:41','VENT-23',89,1.000,13.000,'Administracion',2),
 (176,'2025-12-09 15:54:41','VENT-23',71,1.000,7.000,'Administracion',2),
 (177,'2025-12-09 15:54:41','VENT-23',107,1.000,7.500,'Administracion',2),
 (178,'2025-12-09 15:54:41','VENT-23',106,1.000,9.110,'Administracion',2),
 (179,'2025-12-09 16:40:18','VENT-24',94,1.000,5.400,'Administracion',2),
 (180,'2025-12-09 16:40:18','VENT-24',41,1.000,14.280,'Administracion',2),
 (181,'2025-12-09 16:40:18','VENT-24',40,1.000,15.400,'Administracion',2),
 (182,'2025-12-09 16:40:18','VENT-24',97,1.000,13.000,'Administracion',2),
 (183,'2025-12-09 16:40:18','VENT-24',96,1.000,17.000,'Administracion',2),
 (184,'2025-12-10 14:00:01','VENT-25',33,1.000,8.600,'Administracion',2),
 (185,'2025-12-10 14:00:01','VENT-25',101,1.000,12.200,'Administracion',2),
 (186,'2025-12-10 14:00:01','VENT-25',98,1.000,17.900,'Administracion',2),
 (187,'2025-12-10 14:00:01','VENT-25',98,1.000,17.900,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (188,'2025-12-10 14:00:01','VENT-25',52,1.000,19.600,'Administracion',2),
 (189,'2025-12-10 14:00:01','VENT-25',105,1.000,8.330,'Administracion',2),
 (190,'2025-12-10 14:00:01','VENT-25',58,1.000,2.200,'Administracion',2),
 (191,'2025-12-10 14:00:01','VENT-25',106,1.000,9.110,'Administracion',2),
 (192,'2025-12-10 14:00:01','VENT-25',51,1.000,20.660,'Administracion',2),
 (193,'2025-12-10 14:14:57','VENT-26',14,1.000,11.600,'Administracion',2),
 (194,'2025-12-10 14:14:57','VENT-26',51,1.000,20.660,'Administracion',2),
 (195,'2025-12-10 14:14:57','VENT-26',50,1.000,12.700,'Administracion',2),
 (196,'2025-12-10 14:14:57','VENT-26',54,1.000,17.330,'Administracion',2),
 (197,'2025-12-10 14:14:57','VENT-26',31,2.000,5.400,'Administracion',2),
 (198,'2025-12-10 14:14:57','VENT-26',33,1.000,8.600,'Administracion',2),
 (199,'2025-12-10 14:26:31','DEV:V-10',94,1.000,13.500,'Administracion',1),
 (200,'2025-12-10 14:26:31','DEV:V-10',47,1.000,34.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (201,'2025-12-10 14:26:31','DEV:V-10',15,1.000,20.000,'Administracion',1),
 (202,'2025-12-10 14:26:31','DEV:V-10',19,1.000,13.500,'Administracion',1),
 (203,'2025-12-10 14:26:31','DEV:V-10',43,1.000,27.000,'Administracion',1),
 (204,'2025-12-10 14:26:31','DEV:V-10',63,1.000,7.000,'Administracion',1),
 (205,'2025-12-10 14:26:31','DEV:V-10',61,1.000,27.000,'Administracion',1),
 (206,'2025-12-10 14:26:31','DEV:V-10',61,1.000,27.000,'Administracion',1),
 (207,'2025-12-10 14:26:31','DEV:V-10',26,1.000,16.000,'Administracion',1),
 (208,'2025-12-10 15:27:51','VENT-27',94,1.000,5.400,'Administracion',2),
 (209,'2025-12-10 15:27:51','VENT-27',47,1.000,19.970,'Administracion',2),
 (210,'2025-12-10 15:27:51','VENT-27',15,1.000,10.000,'Administracion',2),
 (211,'2025-12-10 15:27:51','VENT-27',19,1.000,5.000,'Administracion',2),
 (212,'2025-12-10 15:27:51','VENT-27',43,1.000,14.840,'Administracion',2),
 (213,'2025-12-10 15:27:51','VENT-27',63,1.000,3.800,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (214,'2025-12-10 15:27:51','VENT-27',61,2.000,13.340,'Administracion',2),
 (215,'2025-12-10 15:27:51','VENT-27',26,1.000,7.000,'Administracion',2),
 (216,'2025-12-10 18:43:02','VENT-28',51,1.000,20.660,'Administracion',2),
 (217,'2025-12-11 09:28:16','VENT-29',30,1.000,9.000,'Administracion',2),
 (218,'2025-12-11 09:29:50','VENT-30',104,1.000,9.550,'Administracion',2),
 (219,'2025-12-11 14:11:00','VENT-31',57,1.000,15.170,'Administracion',2),
 (220,'2025-12-12 09:21:43','VENT-32',93,1.000,8.200,'Administracion',2),
 (221,'2025-12-12 10:09:16','VENT-33',50,1.000,12.700,'Administracion',2),
 (222,'2025-12-12 10:35:12','VENT-34',57,1.000,15.170,'Administracion',2),
 (223,'2025-12-12 11:19:35','VENT-35',97,1.000,13.000,'Administracion',2),
 (224,'2025-12-12 11:19:35','VENT-35',45,1.000,12.650,'Administracion',2),
 (225,'2025-12-12 12:07:51','VENT-36',96,1.000,17.000,'Administracion',2),
 (226,'2025-12-12 12:07:51','VENT-36',96,1.000,17.000,'Administracion',2),
 (227,'2025-12-13 16:46:05','VENT-37',63,1.000,3.800,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (228,'2025-12-14 10:36:04','VENT-38',82,1.000,1.000,'Administracion',2),
 (229,'2025-12-14 11:07:15','VENT-39',19,1.000,5.000,'Administracion',2),
 (230,'2025-12-14 12:20:50','VENT-40',14,1.000,11.600,'Administracion',2),
 (231,'2025-12-14 12:20:50','VENT-40',104,1.000,9.550,'Administracion',2),
 (232,'2025-12-15 13:26:12','VENT-41',99,1.000,14.850,'Administracion',2),
 (233,'2025-12-15 13:26:12','VENT-41',63,1.000,3.800,'Administracion',2),
 (234,'2025-12-15 14:42:37','VENT-42',14,1.000,11.600,'Administracion',2),
 (235,'2025-12-15 14:42:37','VENT-42',33,1.000,9.000,'Administracion',2),
 (236,'2025-12-15 16:38:53','VENT-43',40,1.000,15.400,'Administracion',2),
 (237,'2025-12-15 16:38:53','VENT-43',94,1.000,5.400,'Administracion',2),
 (238,'2025-12-16 17:45:59','VENT-44',32,1.000,6.700,'Administracion',2),
 (239,'2025-12-16 17:45:59','VENT-44',101,1.000,12.200,'Administracion',2),
 (240,'2025-12-16 18:03:12','VENT-45',98,1.000,17.900,'Administracion',2),
 (241,'2025-12-16 18:08:09','VENT-46',101,1.000,12.200,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (242,'2025-12-16 18:14:55','VENT-47',93,1.000,8.200,'Administracion',2),
 (243,'2025-12-16 18:14:55','VENT-47',40,1.000,15.400,'Administracion',2),
 (244,'2025-12-17 11:37:35','COMP-8-00000002',108,12.000,18.000,'Administracion',1),
 (245,'2025-12-17 15:33:22','VENT-48',46,1.000,7.700,'Administracion',2),
 (246,'2025-12-17 14:57:06','DEV:V-48',46,1.000,20.000,'Administracion',1),
 (247,'2025-12-17 16:26:41','VENT-49',14,1.000,11.600,'Administracion',2),
 (248,'2025-12-17 17:41:46','VENT-50',49,1.000,23.740,'Administracion',2),
 (249,'2025-12-17 17:26:30','DEV:V-46',101,1.000,27.000,'Administracion',1),
 (250,'2025-12-17 18:27:15','VENT-51',106,1.000,9.110,'Administracion',2),
 (251,'2025-12-17 18:27:15','VENT-51',79,2.000,0.500,'Administracion',2),
 (252,'2025-12-17 18:34:10','VENT-52',47,1.000,19.970,'Administracion',2),
 (253,'2025-12-17 18:34:10','VENT-52',96,1.000,17.000,'Administracion',2),
 (254,'2025-12-17 18:34:10','VENT-52',94,1.000,5.400,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (255,'2025-12-17 18:34:10','VENT-52',15,1.000,10.000,'Administracion',2),
 (256,'2025-12-17 18:34:10','VENT-52',6,1.000,2.600,'Administracion',2),
 (257,'2025-12-17 18:34:10','VENT-52',13,1.000,1.000,'Administracion',2),
 (258,'2025-12-18 09:15:40','DEV:V-52',47,1.000,25.000,'Administracion',1),
 (259,'2025-12-18 09:15:40','DEV:V-52',96,1.000,23.000,'Administracion',1),
 (260,'2025-12-18 09:15:40','DEV:V-52',94,1.000,10.000,'Administracion',1),
 (261,'2025-12-18 09:15:40','DEV:V-52',15,1.000,15.000,'Administracion',1),
 (262,'2025-12-18 09:15:40','DEV:V-52',6,1.000,4.000,'Administracion',1),
 (263,'2025-12-18 09:15:40','DEV:V-52',13,1.000,2.000,'Administracion',1),
 (264,'2025-12-18 10:17:33','VENT-53',47,1.000,19.970,'Administracion',2),
 (265,'2025-12-18 10:17:33','VENT-53',96,1.000,17.000,'Administracion',2),
 (266,'2025-12-18 10:17:33','VENT-53',94,1.000,5.400,'Administracion',2),
 (267,'2025-12-18 10:17:33','VENT-53',15,1.000,10.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (268,'2025-12-18 10:17:33','VENT-53',6,1.000,2.600,'Administracion',2),
 (269,'2025-12-18 10:17:33','VENT-53',13,1.000,1.000,'Administracion',2),
 (270,'2025-12-18 11:59:57','VENT-54',40,1.000,15.400,'Administracion',2),
 (271,'2025-12-18 11:59:57','VENT-54',93,1.000,8.200,'Administracion',2),
 (272,'2025-12-18 12:51:39','VENT-55',14,1.000,11.600,'Administracion',2),
 (273,'2025-12-18 12:51:39','VENT-55',106,1.000,9.110,'Administracion',2),
 (274,'2025-12-18 14:33:57','VENT-56',41,1.000,14.280,'Administracion',2),
 (275,'2025-12-18 16:03:07','VENT-57',6,1.000,2.600,'Administracion',2),
 (276,'2025-12-18 16:03:07','VENT-57',1,1.000,0.970,'Administracion',2),
 (277,'2025-12-18 16:03:07','VENT-57',1,1.000,0.970,'Administracion',2),
 (278,'2025-12-18 16:03:07','VENT-57',1,1.000,0.970,'Administracion',2),
 (279,'2025-12-18 16:45:06','VENT-58',99,1.000,14.850,'Administracion',2),
 (280,'2025-12-18 16:45:06','VENT-58',101,1.000,12.200,'Administracion',2),
 (281,'2025-12-18 16:45:06','VENT-58',53,1.000,10.400,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (282,'2025-12-18 16:45:06','VENT-58',33,1.000,9.000,'Administracion',2),
 (283,'2025-12-19 15:20:21','VENT-59',14,1.000,11.600,'Administracion',2),
 (284,'2025-12-19 15:30:08','VENT-60',14,1.000,11.600,'Administracion',2),
 (285,'2025-12-19 15:30:08','VENT-60',106,1.000,9.110,'Administracion',2),
 (286,'2025-12-19 17:46:56','VENT-61',101,1.000,12.200,'Administracion',2),
 (287,'2025-12-19 17:46:56','VENT-61',107,1.000,7.500,'Administracion',2),
 (288,'2025-12-19 17:46:56','VENT-61',14,1.000,11.600,'Administracion',2),
 (289,'2025-12-20 15:43:16','VENT-62',59,1.000,3.640,'Administracion',2),
 (290,'2025-12-20 15:50:53','VENT-63',63,1.000,3.800,'Administracion',2),
 (291,'2025-12-20 15:53:16','VENT-64',61,1.000,13.340,'Administracion',2),
 (292,'2025-12-20 15:53:16','VENT-64',1,1.000,0.970,'Administracion',2),
 (293,'2025-12-20 14:56:09','DEV:V-62',59,1.000,7.000,'Administracion',1),
 (294,'2025-12-20 16:35:43','VENT-65',39,1.000,4.000,'Administracion',2),
 (295,'2025-12-20 16:35:43','VENT-65',6,1.000,2.600,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (296,'2025-12-20 16:51:41','VENT-66',26,1.000,7.000,'Administracion',2),
 (297,'2025-12-20 17:21:59','VENT-67',49,1.000,23.740,'Administracion',2),
 (298,'2025-12-20 17:42:22','VENT-68',51,1.000,20.660,'Administracion',2),
 (299,'2025-12-20 18:18:28','VENT-69',1,1.000,0.970,'Administracion',2),
 (300,'2025-12-20 18:24:50','VENT-70',61,1.000,13.340,'Administracion',2),
 (301,'2025-12-20 18:32:02','VENT-71',108,1.000,18.000,'Administracion',2),
 (302,'2025-12-20 18:32:02','VENT-71',96,1.000,17.000,'Administracion',2),
 (303,'2025-12-20 18:32:02','VENT-71',61,1.000,13.340,'Administracion',2),
 (304,'2025-12-20 18:32:02','VENT-71',48,1.000,30.710,'Administracion',2),
 (305,'2025-12-20 18:42:16','VENT-72',13,2.000,1.000,'Administracion',2),
 (306,'2025-12-21 10:37:41','VENT-73',47,1.000,19.970,'Administracion',2),
 (307,'2025-12-21 10:43:50','VENT-74',14,1.000,11.600,'Administracion',2),
 (308,'2025-12-21 10:57:57','VENT-75',93,1.000,8.200,'Administracion',2),
 (309,'2025-12-21 11:11:31','VENT-76',19,1.000,5.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (310,'2025-12-21 11:26:29','VENT-77',41,1.000,14.280,'Administracion',2),
 (311,'2025-12-21 11:29:09','VENT-78',60,1.000,10.130,'Administracion',2),
 (312,'2025-12-21 12:27:58','VENT-79',33,1.000,9.000,'Administracion',2),
 (313,'2025-12-22 12:01:41','COMP-9-01',14,42.000,10.470,'Administracion',1),
 (314,'2025-12-22 12:01:41','COMP-9-01',107,12.000,7.500,'Administracion',1),
 (315,'2025-12-22 12:01:41','COMP-9-01',15,24.000,16.140,'Administracion',1),
 (316,'2025-12-22 12:28:06','VENT-80',32,1.000,6.700,'Administracion',2),
 (317,'2025-12-22 12:28:06','VENT-80',96,1.000,17.000,'Administracion',2),
 (318,'2025-12-22 12:28:06','VENT-80',48,1.000,30.710,'Administracion',2),
 (319,'2025-12-22 12:28:06','VENT-80',107,1.000,7.500,'Administracion',2),
 (320,'2025-12-22 12:28:06','VENT-80',14,1.000,10.470,'Administracion',2),
 (321,'2025-12-22 12:25:26','DEV:V-54',40,1.000,25.000,'Administracion',1),
 (322,'2025-12-22 12:25:26','DEV:V-54',93,1.000,20.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (323,'2025-12-22 13:28:05','VENT-81',40,1.000,15.400,'Administracion',2),
 (324,'2025-12-22 13:28:05','VENT-81',19,1.000,5.000,'Administracion',2),
 (325,'2025-12-22 13:28:05','VENT-81',79,1.000,0.500,'Administracion',2),
 (326,'2025-12-22 13:28:05','VENT-81',55,1.000,0.540,'Administracion',2),
 (327,'2025-12-22 13:28:05','VENT-81',13,1.000,1.000,'Administracion',2),
 (328,'2025-12-22 14:58:19','VENT-82',59,1.000,3.640,'Administracion',2),
 (329,'2025-12-22 14:58:19','VENT-82',42,1.000,23.010,'Administracion',2),
 (330,'2025-12-22 15:34:36','VENT-83',40,1.000,15.400,'Administracion',2),
 (331,'2025-12-22 15:34:36','VENT-83',96,1.000,17.000,'Administracion',2),
 (332,'2025-12-22 15:34:36','VENT-83',101,1.000,12.200,'Administracion',2),
 (333,'2025-12-22 15:34:36','VENT-83',93,1.000,8.200,'Administracion',2),
 (334,'2025-12-22 16:01:41','VENT-84',93,1.000,8.200,'Administracion',2),
 (335,'2025-12-22 16:33:01','VENT-85',54,1.000,17.330,'Administracion',2),
 (336,'2025-12-22 16:44:13','VENT-86',34,1.000,9.200,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (337,'2025-12-22 16:44:13','VENT-86',106,1.000,9.110,'Administracion',2),
 (338,'2025-12-22 16:44:13','VENT-86',15,1.000,16.140,'Administracion',2),
 (339,'2025-12-22 16:44:13','VENT-86',93,1.000,8.200,'Administracion',2),
 (340,'2025-12-22 16:44:13','VENT-86',34,1.000,9.200,'Administracion',2),
 (341,'2025-12-22 16:44:13','VENT-86',32,1.000,6.700,'Administracion',2),
 (342,'2025-12-22 16:46:55','VENT-87',14,4.000,10.470,'Administracion',2),
 (343,'2025-12-22 16:46:55','VENT-87',104,1.000,9.550,'Administracion',2),
 (344,'2025-12-22 16:46:55','VENT-87',106,1.000,9.110,'Administracion',2),
 (345,'2025-12-22 16:46:55','VENT-87',31,1.000,6.870,'Administracion',2),
 (346,'2025-12-22 16:46:55','VENT-87',33,1.000,9.000,'Administracion',2),
 (347,'2025-12-22 16:51:08','VENT-88',32,1.000,6.700,'Administracion',2),
 (348,'2025-12-22 16:51:08','VENT-88',14,2.000,10.470,'Administracion',2),
 (349,'2025-12-22 16:51:08','VENT-88',102,1.000,7.900,'Administracion',2),
 (350,'2025-12-22 16:51:50','VENT-89',6,1.000,2.600,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (351,'2025-12-22 17:15:39','VENT-90',40,1.000,15.400,'Administracion',2),
 (352,'2025-12-22 17:15:39','VENT-90',40,1.000,15.400,'Administracion',2),
 (353,'2025-12-22 17:15:39','VENT-90',96,1.000,17.000,'Administracion',2),
 (354,'2025-12-22 17:15:39','VENT-90',49,1.000,23.740,'Administracion',2),
 (355,'2025-12-23 11:06:53','VENT-91',40,1.000,15.400,'Administracion',2),
 (356,'2025-12-23 11:06:53','VENT-91',95,1.000,10.000,'Administracion',2),
 (357,'2025-12-23 11:06:53','VENT-91',19,1.000,5.000,'Administracion',2),
 (358,'2025-12-23 11:06:53','VENT-91',96,1.000,17.000,'Administracion',2),
 (359,'2025-12-23 11:06:53','VENT-91',15,1.000,16.140,'Administracion',2),
 (360,'2025-12-23 11:48:27','VENT-92',54,1.000,17.330,'Administracion',2),
 (361,'2025-12-23 13:00:01','VENT-93',26,1.000,7.000,'Administracion',2),
 (362,'2025-12-23 13:00:01','VENT-93',61,1.000,13.340,'Administracion',2),
 (363,'2025-12-23 13:15:56','VENT-94',61,1.000,13.340,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (364,'2025-12-23 15:30:52','VENT-95',97,1.000,13.000,'Administracion',2),
 (365,'2025-12-23 15:54:09','VENT-96',59,1.000,3.640,'Administracion',2),
 (366,'2025-12-23 15:55:20','VENT-97',79,1.000,0.500,'Administracion',2),
 (367,'2025-12-23 16:16:54','VENT-98',1,1.000,0.970,'Administracion',2),
 (368,'2025-12-23 17:03:58','VENT-99',14,1.000,10.470,'Administracion',2),
 (369,'2025-12-23 17:03:58','VENT-99',14,1.000,10.470,'Administracion',2),
 (370,'2025-12-23 17:03:58','VENT-99',47,1.000,19.970,'Administracion',2),
 (371,'2025-12-23 17:03:58','VENT-99',47,1.000,19.970,'Administracion',2),
 (372,'2025-12-23 17:03:58','VENT-99',41,1.000,14.280,'Administracion',2),
 (373,'2025-12-23 17:03:58','VENT-99',100,1.000,15.620,'Administracion',2),
 (374,'2025-12-23 17:03:58','VENT-99',50,1.000,12.700,'Administracion',2),
 (375,'2025-12-23 18:08:41','VENT-100',39,1.000,4.000,'Administracion',2),
 (376,'2025-12-23 18:38:10','VENT-101',54,1.000,17.330,'Administracion',2),
 (377,'2025-12-23 19:11:39','VENT-102',14,1.000,10.470,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (378,'2025-12-24 10:10:12','VENT-103',1,1.000,0.970,'Administracion',2),
 (379,'2025-12-24 10:25:07','VENT-104',61,1.000,13.340,'Administracion',2),
 (380,'2025-12-24 10:25:07','VENT-104',14,1.000,10.470,'Administracion',2),
 (381,'2025-12-24 10:25:07','VENT-104',51,1.000,20.660,'Administracion',2),
 (382,'2025-12-24 10:25:07','VENT-104',94,2.000,5.400,'Administracion',2),
 (383,'2025-12-24 10:25:07','VENT-104',33,1.000,9.000,'Administracion',2),
 (384,'2025-12-24 10:25:07','VENT-104',14,1.000,10.470,'Administracion',2),
 (385,'2025-12-24 10:25:07','VENT-104',93,1.000,8.200,'Administracion',2),
 (386,'2025-12-24 10:27:01','VENT-105',101,1.000,12.200,'Administracion',2),
 (387,'2025-12-24 10:39:59','VENT-106',54,1.000,17.330,'Administracion',2),
 (388,'2025-12-24 10:39:59','VENT-106',31,1.000,6.870,'Administracion',2),
 (389,'2025-12-24 10:39:59','VENT-106',101,1.000,12.200,'Administracion',2),
 (390,'2025-12-24 10:42:28','VENT-107',31,1.000,6.870,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (391,'2025-12-24 10:42:28','VENT-107',31,1.000,6.870,'Administracion',2),
 (392,'2025-12-24 10:53:48','VENT-108',14,1.000,10.470,'Administracion',2),
 (393,'2025-12-24 10:53:48','VENT-108',14,1.000,10.470,'Administracion',2),
 (394,'2025-12-24 10:53:48','VENT-108',14,1.000,10.470,'Administracion',2),
 (395,'2025-12-24 10:53:48','VENT-108',14,1.000,10.470,'Administracion',2),
 (396,'2025-12-24 10:53:48','VENT-108',34,1.000,9.200,'Administracion',2),
 (397,'2025-12-24 10:53:48','VENT-108',34,1.000,9.200,'Administracion',2),
 (398,'2025-12-24 10:53:48','VENT-108',31,1.000,6.870,'Administracion',2),
 (399,'2025-12-24 10:53:48','VENT-108',14,1.000,10.470,'Administracion',2),
 (400,'2025-12-24 10:53:48','VENT-108',33,1.000,9.000,'Administracion',2),
 (401,'2025-12-24 10:53:48','VENT-108',31,1.000,6.870,'Administracion',2),
 (402,'2025-12-24 10:53:48','VENT-108',14,1.000,10.470,'Administracion',2),
 (403,'2025-12-24 11:12:20','VENT-109',47,1.000,19.970,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (404,'2025-12-24 11:12:20','VENT-109',47,1.000,19.970,'Administracion',2),
 (405,'2025-12-24 11:20:21','VENT-110',31,1.000,6.870,'Administracion',2),
 (406,'2025-12-24 11:21:37','VENT-111',31,1.000,6.870,'Administracion',2),
 (407,'2025-12-24 11:35:08','VENT-112',93,1.000,8.200,'Administracion',2),
 (408,'2025-12-24 13:00:57','VENT-113',14,2.000,10.470,'Administracion',2),
 (409,'2025-12-24 13:03:52','VENT-114',31,2.000,6.870,'Administracion',2),
 (410,'2025-12-24 13:18:21','VENT-115',41,1.000,14.280,'Administracion',2),
 (411,'2025-12-24 13:29:43','VENT-116',93,1.000,8.200,'Administracion',2),
 (412,'2025-12-24 13:32:24','VENT-117',52,1.000,19.600,'Administracion',2),
 (413,'2025-12-24 13:39:59','VENT-118',91,1.000,10.000,'Administracion',2),
 (414,'2025-12-24 13:52:08','VENT-119',79,1.000,0.500,'Administracion',2),
 (415,'2025-12-24 14:20:35','VENT-120',104,1.000,9.550,'Administracion',2),
 (416,'2025-12-24 14:20:35','VENT-120',43,1.000,14.840,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (417,'2025-12-24 14:43:33','VENT-121',47,1.000,19.970,'Administracion',2),
 (418,'2025-12-24 14:56:20','VENT-122',49,1.000,23.740,'Administracion',2),
 (419,'2025-12-24 15:13:10','VENT-123',51,1.000,20.660,'Administracion',2),
 (420,'2025-12-24 16:22:31','VENT-124',32,1.000,6.700,'Administracion',2),
 (421,'2025-12-24 16:22:31','VENT-124',27,1.000,11.600,'Administracion',2),
 (422,'2025-12-24 16:22:31','VENT-124',61,1.000,13.340,'Administracion',2),
 (423,'2025-12-24 16:25:35','VENT-125',79,2.000,0.500,'Administracion',2),
 (424,'2025-12-24 16:25:35','VENT-125',56,1.000,6.200,'Administracion',2),
 (425,'2025-12-24 17:45:49','VENT-126',73,1.000,3.000,'Administracion',2),
 (426,'2025-12-24 16:49:44','DEV:V-104',61,1.000,15.000,'Administracion',1),
 (427,'2025-12-24 16:49:44','DEV:V-104',14,1.000,18.000,'Administracion',1),
 (428,'2025-12-24 16:49:44','DEV:V-104',51,1.000,23.000,'Administracion',1),
 (429,'2025-12-24 16:49:44','DEV:V-104',94,2.000,10.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (430,'2025-12-24 16:49:44','DEV:V-104',33,1.000,15.000,'Administracion',1),
 (431,'2025-12-24 16:49:44','DEV:V-104',14,1.000,20.000,'Administracion',1),
 (432,'2025-12-24 16:49:44','DEV:V-104',93,1.000,13.000,'Administracion',1),
 (433,'2025-12-24 17:52:01','VENT-127',94,1.000,5.400,'Administracion',2),
 (434,'2025-12-24 17:52:01','VENT-127',61,1.000,13.340,'Administracion',2),
 (435,'2025-12-24 17:52:01','VENT-127',27,1.000,11.600,'Administracion',2),
 (436,'2025-12-24 17:52:01','VENT-127',51,1.000,20.660,'Administracion',2),
 (437,'2025-12-24 17:52:01','VENT-127',33,1.000,9.000,'Administracion',2),
 (438,'2025-12-24 17:52:01','VENT-127',93,1.000,8.200,'Administracion',2),
 (439,'2025-12-24 17:52:01','VENT-127',94,1.000,5.400,'Administracion',2),
 (440,'2025-12-24 17:52:01','VENT-127',15,1.000,16.140,'Administracion',2),
 (441,'2025-12-24 18:32:32','VENT-128',101,1.000,12.200,'Administracion',2),
 (442,'2025-12-24 18:32:32','VENT-128',40,1.000,15.400,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (443,'2025-12-24 18:32:32','VENT-128',97,1.000,13.000,'Administracion',2),
 (444,'2025-12-24 19:20:39','VENT-129',97,1.000,13.000,'Administracion',2),
 (445,'2025-12-24 19:20:39','VENT-129',40,1.000,15.400,'Administracion',2),
 (446,'2025-12-26 10:13:25','VENT-130',6,1.000,2.600,'Administracion',2),
 (447,'2025-12-26 12:16:43','VENT-131',1,1.000,0.970,'Administracion',2),
 (448,'2025-12-26 14:05:02','VENT-132',40,1.000,15.400,'Administracion',2),
 (449,'2025-12-26 14:05:02','VENT-132',94,1.000,5.400,'Administracion',2),
 (450,'2025-12-26 16:31:36','VENT-133',31,1.000,6.870,'Administracion',2),
 (451,'2025-12-26 16:31:36','VENT-133',33,1.000,9.000,'Administracion',2),
 (452,'2025-12-26 16:31:36','VENT-133',79,1.000,0.500,'Administracion',2),
 (453,'2025-12-26 16:31:36','VENT-133',35,1.000,0.140,'Administracion',2),
 (454,'2025-12-26 16:31:36','VENT-133',35,1.000,0.140,'Administracion',2),
 (455,'2025-12-26 16:38:50','VENT-134',105,1.000,8.330,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (456,'2025-12-27 12:32:48','VENT-135',59,1.000,3.640,'Administracion',2),
 (457,'2025-12-27 15:56:38','VENT-136',33,1.000,9.000,'Administracion',2),
 (458,'2025-12-27 15:56:38','VENT-136',100,1.000,15.620,'Administracion',2),
 (459,'2025-12-27 18:21:22','VENT-137',31,1.000,6.870,'Administracion',2),
 (460,'2025-12-27 18:21:22','VENT-137',31,1.000,6.870,'Administracion',2),
 (461,'2025-12-28 09:40:59','VENT-138',41,1.000,14.280,'Administracion',2),
 (462,'2025-12-28 14:17:24','VENT-139',93,1.000,8.200,'Administracion',2),
 (463,'2025-12-29 11:54:09','VENT-140',45,1.000,12.650,'Administracion',2),
 (464,'2025-12-29 11:20:24','DEV:V-140',45,1.000,18.000,'Administracion',1),
 (465,'2025-12-29 13:54:45','VENT-141',47,1.000,19.970,'Administracion',2),
 (466,'2025-12-29 13:54:45','VENT-141',104,1.000,9.550,'Administracion',2),
 (467,'2025-12-29 14:20:31','VENT-142',14,1.000,10.470,'Administracion',2),
 (468,'2025-12-29 14:23:44','VENT-143',94,1.000,5.400,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (469,'2025-12-29 15:20:13','VENT-144',47,1.000,19.970,'Administracion',2),
 (470,'2025-12-29 15:29:04','VENT-145',40,1.000,15.400,'Administracion',2),
 (471,'2025-12-29 15:29:04','VENT-145',40,1.000,15.400,'Administracion',2),
 (472,'2025-12-29 17:10:31','VENT-146',106,1.000,9.110,'Administracion',2),
 (473,'2025-12-29 17:10:31','VENT-146',31,1.000,6.870,'Administracion',2),
 (474,'2025-12-30 09:42:49','VENT-147',31,1.000,6.870,'Administracion',2),
 (475,'2025-12-30 09:42:49','VENT-147',34,1.000,9.200,'Administracion',2),
 (476,'2025-12-30 10:36:06','VENT-148',32,1.000,6.700,'Administracion',2),
 (477,'2025-12-30 10:36:06','VENT-148',14,1.000,10.470,'Administracion',2),
 (478,'2025-12-30 10:36:06','VENT-148',58,1.000,2.200,'Administracion',2),
 (479,'2025-12-30 10:19:24','DEV:V-147',31,1.000,10.000,'Administracion',1),
 (480,'2025-12-30 10:19:24','DEV:V-147',34,1.000,20.000,'Administracion',1),
 (481,'2025-12-30 11:20:54','VENT-149',31,1.000,6.870,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (482,'2025-12-30 11:20:54','VENT-149',34,1.000,9.200,'Administracion',2),
 (483,'2025-12-30 12:10:26','VENT-150',78,1.000,2.000,'Administracion',2),
 (484,'2025-12-30 12:10:26','VENT-150',89,1.000,13.000,'Administracion',2),
 (485,'2025-12-30 12:47:35','VENT-151',51,1.000,20.660,'Administracion',2),
 (486,'2025-12-30 13:48:12','VENT-152',40,1.000,15.400,'Administracion',2),
 (487,'2025-12-30 15:29:52','VENT-153',94,1.000,5.400,'Administracion',2),
 (488,'2025-12-30 16:08:38','VENT-154',107,1.000,7.500,'Administracion',2),
 (489,'2025-12-30 16:08:38','VENT-154',14,1.000,10.470,'Administracion',2),
 (490,'2025-12-30 16:08:38','VENT-154',46,1.000,7.700,'Administracion',2),
 (491,'2025-12-30 16:08:38','VENT-154',40,1.000,15.400,'Administracion',2),
 (492,'2025-12-30 16:25:20','VENT-155',104,1.000,9.550,'Administracion',2),
 (493,'2025-12-30 17:44:28','VENT-156',40,1.000,15.400,'Administracion',2),
 (494,'2025-12-30 17:44:28','VENT-156',40,1.000,15.400,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (495,'2025-12-30 17:44:28','VENT-156',41,1.000,14.280,'Administracion',2),
 (496,'2025-12-30 17:44:28','VENT-156',43,1.000,14.840,'Administracion',2),
 (497,'2025-12-30 17:44:28','VENT-156',93,1.000,8.200,'Administracion',2),
 (498,'2025-12-30 18:00:14','VENT-157',98,1.000,17.900,'Administracion',2),
 (499,'2025-12-30 19:36:41','VENT-158',51,1.000,20.660,'Administracion',2),
 (500,'2025-12-30 19:47:29','VENT-159',108,1.000,18.000,'Administracion',2),
 (501,'2025-12-30 19:47:29','VENT-159',41,1.000,14.280,'Administracion',2),
 (502,'2025-12-30 19:47:29','VENT-159',93,1.000,8.200,'Administracion',2),
 (503,'2025-12-31 09:26:33','VENT-160',47,1.000,19.970,'Administracion',2),
 (504,'2025-12-31 09:30:43','VENT-161',37,1.000,3.000,'Administracion',2),
 (505,'2025-12-31 09:55:14','VENT-162',1,1.000,0.970,'Administracion',2),
 (506,'2025-12-31 09:55:14','VENT-162',43,1.000,14.840,'Administracion',2),
 (507,'2025-12-31 10:21:21','VENT-163',41,1.000,14.280,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (508,'2025-12-31 10:21:21','VENT-163',47,1.000,19.970,'Administracion',2),
 (509,'2025-12-31 10:22:40','VENT-164',75,1.000,6.000,'Administracion',2),
 (510,'2025-12-31 10:27:38','VENT-165',15,1.000,16.140,'Administracion',2),
 (511,'2025-12-31 10:29:55','VENT-166',93,1.000,8.200,'Administracion',2),
 (512,'2025-12-31 09:34:06','DEV:V-159',108,1.000,25.000,'Administracion',1),
 (513,'2025-12-31 09:34:06','DEV:V-159',41,1.000,25.000,'Administracion',1),
 (514,'2025-12-31 09:34:06','DEV:V-159',93,1.000,15.000,'Administracion',1),
 (515,'2025-12-31 10:38:24','VENT-167',108,1.000,18.000,'Administracion',2),
 (516,'2025-12-31 10:38:24','VENT-167',49,1.000,23.740,'Administracion',2),
 (517,'2025-12-31 10:38:24','VENT-167',93,1.000,8.200,'Administracion',2),
 (518,'2025-12-31 10:59:18','VENT-168',19,1.000,5.000,'Administracion',2),
 (519,'2025-12-31 09:59:38','DEV:V-166',93,1.000,15.000,'Administracion',1),
 (520,'2025-12-31 11:03:44','VENT-169',47,1.000,19.970,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (521,'2025-12-31 11:10:15','VENT-170',2,1.000,2.000,'Administracion',2),
 (522,'2025-12-31 11:31:35','VENT-171',104,1.000,9.550,'Administracion',2),
 (523,'2025-12-31 11:43:31','VENT-172',50,1.000,12.700,'Administracion',2),
 (524,'2025-12-31 11:44:49','VENT-173',47,1.000,19.970,'Administracion',2),
 (525,'2025-12-31 11:46:27','VENT-174',93,1.000,8.200,'Administracion',2),
 (526,'2025-12-31 11:46:27','VENT-174',93,1.000,8.200,'Administracion',2),
 (527,'2025-12-31 11:49:40','VENT-175',51,1.000,20.660,'Administracion',2),
 (528,'2025-12-31 11:53:20','VENT-176',6,1.000,2.600,'Administracion',2),
 (529,'2025-12-31 11:55:14','VENT-177',59,1.000,3.640,'Administracion',2),
 (530,'2025-12-31 12:47:55','VENT-178',61,1.000,13.340,'Administracion',2),
 (531,'2025-12-31 12:54:24','VENT-179',94,1.000,5.400,'Administracion',2),
 (532,'2025-12-31 12:54:24','VENT-179',15,1.000,16.140,'Administracion',2),
 (533,'2026-01-13 15:53:15','DEV:V-178',61,1.000,20.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (534,'2026-01-13 16:53:58','VENT-180',100,1.000,15.620,'Administracion',2),
 (535,'2026-01-13 17:01:59','VENT-181',66,1.000,4.200,'Administracion',2),
 (536,'2026-01-17 14:57:51','VENT-182',47,1.000,19.970,'Administracion',2),
 (537,'2026-01-18 11:24:38','VENT-183',25,1.000,5.000,'Administracion',2),
 (538,'2026-01-21 17:09:35','VENT-184',71,1.000,7.000,'Administracion',2),
 (539,'2026-01-21 17:09:35','VENT-184',5,1.000,2.210,'Administracion',2),
 (540,'2026-01-21 17:14:17','VENT-185',92,1.000,20.000,'Administracion',2),
 (541,'2026-01-21 17:14:17','VENT-185',102,1.000,7.900,'Administracion',2),
 (542,'2026-01-22 11:48:58','VENT-186',47,1.000,19.970,'Administracion',2),
 (543,'2026-01-22 14:49:26','VENT-187',50,1.000,12.700,'Administracion',2),
 (544,'2026-01-24 09:42:18','VENT-188',97,1.000,13.000,'Administracion',2),
 (545,'2026-01-24 14:43:14','VENT-189',1,1.000,0.970,'Administracion',2),
 (546,'2026-01-24 15:16:14','VENT-190',107,1.000,7.500,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (547,'2026-01-27 10:32:27','VENT-191',34,1.000,9.200,'Administracion',2),
 (548,'2026-01-31 12:52:21','COMP-10-01',109,9.000,2.930,'Administracion',1),
 (549,'2026-01-31 12:52:21','COMP-10-01',110,4.000,2.460,'Administracion',1),
 (550,'2026-01-31 12:52:21','COMP-10-01',111,5.000,2.716,'Administracion',1),
 (551,'2026-01-31 12:52:21','COMP-10-01',113,4.000,3.320,'Administracion',1),
 (552,'2026-02-03 09:34:07','VENT-192',16,1.000,5.000,'Administracion',2),
 (553,'2026-02-03 18:03:39','VENT-193',77,1.000,3.000,'Administracion',2),
 (554,'2026-02-03 18:03:39','VENT-193',88,1.000,10.000,'Administracion',2),
 (555,'2026-02-05 11:18:41','VENT-194',67,1.000,6.000,'Administracion',2),
 (556,'2026-02-05 11:18:41','VENT-194',67,1.000,6.000,'Administracion',2),
 (557,'2026-02-05 11:18:41','VENT-194',74,1.000,2.000,'Administracion',2),
 (558,'2026-02-05 11:18:41','VENT-194',74,1.000,2.000,'Administracion',2),
 (559,'2026-02-05 11:18:41','VENT-194',60,1.000,10.130,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (560,'2026-02-05 17:33:57','VENT-195',111,1.000,2.716,'Administracion',2),
 (561,'2026-02-10 11:28:11','VENT-196',47,1.000,19.970,'Administracion',2),
 (562,'2026-02-12 14:44:57','VENT-197',107,1.000,7.500,'Administracion',2),
 (563,'2026-02-12 16:42:18','VENT-198',111,1.000,2.716,'Administracion',2),
 (564,'2026-02-12 17:53:50','VENT-199',108,1.000,18.000,'Administracion',2),
 (565,'2026-02-13 18:14:07','VENT-200',58,1.000,2.200,'Administracion',2),
 (566,'2026-02-13 18:14:07','VENT-200',8,1.000,5.000,'Administracion',2),
 (567,'2026-02-13 18:14:07','VENT-200',109,1.000,2.930,'Administracion',2),
 (568,'2026-02-13 18:14:07','VENT-200',109,1.000,2.930,'Administracion',2),
 (569,'2026-02-14 13:04:13','VENT-201',50,1.000,12.700,'Administracion',2),
 (570,'2026-02-18 11:46:07','COMP-11-01',24,11.000,10.100,'Administracion',1),
 (571,'2026-02-18 11:46:07','COMP-11-01',6,7.000,15.000,'Administracion',1),
 (572,'2026-02-18 11:46:07','COMP-11-01',31,14.000,19.240,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (573,'2026-02-18 11:46:07','COMP-11-01',13,15.000,2.340,'Administracion',1),
 (574,'2026-02-18 11:46:07','COMP-11-01',5,2.000,4.590,'Administracion',1),
 (575,'2026-02-18 11:46:07','COMP-11-01',30,8.000,1.000,'Administracion',1),
 (576,'2026-02-18 11:46:07','COMP-11-01',114,4.000,2.400,'Administracion',1),
 (577,'2026-02-18 11:46:07','COMP-11-01',115,10.000,12.780,'Administracion',1),
 (578,'2026-02-18 11:46:07','COMP-11-01',116,3.000,2.250,'Administracion',1),
 (579,'2026-02-18 11:46:07','COMP-11-01',117,2.000,5.050,'Administracion',1),
 (580,'2026-02-18 12:25:39','VENT-202',115,1.000,12.780,'Administracion',2),
 (581,'2026-02-20 15:01:39','VENT-203',56,1.000,6.200,'Administracion',2),
 (582,'2026-02-20 18:32:31','VENT-204',111,1.000,2.716,'Administracion',2),
 (583,'2026-02-20 18:32:31','VENT-204',110,1.000,2.460,'Administracion',2),
 (584,'2026-02-21 11:40:38','VENT-205',14,1.000,10.470,'Administracion',2),
 (585,'2026-02-21 11:40:38','VENT-205',116,1.000,2.250,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (586,'2026-02-21 17:04:42','VENT-206',108,1.000,18.000,'Administracion',2),
 (587,'2026-02-26 15:20:36','VENT-207',54,1.000,17.330,'Administracion',2),
 (588,'2026-02-27 15:02:43','VENT-208',12,1.000,1.500,'Administracion',2),
 (589,'2026-02-27 15:02:43','VENT-208',24,1.000,10.100,'Administracion',2),
 (590,'2026-03-03 10:35:09','VENT-209',116,1.000,2.250,'Administracion',2),
 (591,'2026-03-04 14:30:41','VENT-210',30,1.000,1.000,'Administracion',2),
 (592,'2026-03-07 10:31:04','VENT-211',6,1.000,15.000,'Administracion',2),
 (593,'2026-03-07 10:31:04','VENT-211',31,1.000,19.240,'Administracion',2),
 (594,'2026-03-07 13:58:43','VENT-212',61,1.000,13.340,'Administracion',2),
 (595,'2026-03-07 13:58:43','VENT-212',31,1.000,19.240,'Administracion',2),
 (596,'2026-03-07 14:18:27','VENT-213',70,1.000,12.000,'Administracion',2),
 (597,'2026-03-07 14:18:27','VENT-213',60,1.000,10.130,'Administracion',2),
 (598,'2026-03-07 18:34:11','VENT-214',47,1.000,19.970,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (599,'2026-03-08 11:19:00','VENT-215',96,1.000,17.000,'Administracion',2),
 (600,'2026-03-10 16:01:34','VENT-216',43,1.000,14.840,'Administracion',2),
 (601,'2026-03-10 16:08:34','VENT-217',107,1.000,7.500,'Administracion',2),
 (602,'2026-03-10 16:08:34','VENT-217',98,1.000,17.900,'Administracion',2),
 (603,'2026-03-10 16:08:34','VENT-217',14,1.000,10.470,'Administracion',2),
 (604,'2026-03-12 12:10:39','VENT-218',31,1.000,19.240,'Administracion',2),
 (605,'2026-03-14 09:47:26','VENT-219',44,1.000,28.500,'Administracion',2),
 (606,'2026-03-19 16:13:33','VENT-220',57,1.000,15.170,'Administracion',2),
 (607,'2026-03-19 16:36:39','VENT-221',109,1.000,2.930,'Administracion',2),
 (608,'2026-03-19 16:44:44','VENT-222',65,1.000,2.200,'Administracion',2),
 (609,'2026-03-19 16:44:44','VENT-222',42,1.000,23.010,'Administracion',2),
 (610,'2026-03-19 17:26:54','VENT-223',115,1.000,12.780,'Administracion',2),
 (611,'2026-03-22 11:21:24','VENT-224',109,1.000,2.930,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (612,'2026-03-22 12:55:26','VENT-225',50,1.000,12.700,'Administracion',2),
 (613,'2026-03-25 12:31:42','VENT-226',89,1.000,13.000,'Administracion',2),
 (614,'2026-03-25 12:31:42','VENT-226',71,1.000,7.000,'Administracion',2),
 (615,'2026-03-26 09:35:25','VENT-227',51,1.000,20.660,'Administracion',2),
 (616,'2026-03-26 15:34:07','VENT-228',42,1.000,23.010,'Administracion',2),
 (617,'2026-03-26 15:43:50','VENT-229',12,1.000,1.500,'Administracion',2),
 (618,'2026-03-26 17:41:35','VENT-230',45,1.000,12.650,'Administracion',2),
 (619,'2026-03-26 17:41:35','VENT-230',41,1.000,14.280,'Administracion',2),
 (620,'2026-03-26 17:41:35','VENT-230',106,1.000,9.110,'Administracion',2),
 (621,'2026-03-27 13:55:17','VENT-231',101,1.000,12.200,'Administracion',2),
 (622,'2026-03-27 13:55:17','VENT-231',50,1.000,12.700,'Administracion',2),
 (623,'2026-03-27 16:47:53','VENT-232',36,1.000,5.900,'Administracion',2),
 (624,'2026-03-27 16:47:53','VENT-232',36,1.000,5.900,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (625,'2026-03-29 12:19:38','VENT-233',6,1.000,15.000,'Administracion',2),
 (626,'2026-03-31 16:34:56','VENT-234',114,1.000,2.400,'Administracion',2),
 (627,'2026-04-01 11:41:51','VENT-235',109,1.000,2.930,'Administracion',2),
 (628,'2026-04-01 12:06:01','VENT-236',111,1.000,2.716,'Administracion',2),
 (629,'2026-04-01 17:54:31','VENT-237',32,1.000,6.700,'Administracion',2),
 (630,'2026-04-04 14:13:36','VENT-238',16,1.000,5.000,'Administracion',2),
 (631,'2026-04-04 14:13:36','VENT-238',5,1.000,4.590,'Administracion',2),
 (632,'2026-04-04 14:13:36','VENT-238',114,1.000,2.400,'Administracion',2),
 (633,'2026-04-09 14:30:52','VENT-239',34,1.000,9.200,'Administracion',2),
 (634,'2026-04-09 14:30:52','VENT-239',13,1.000,2.340,'Administracion',2),
 (635,'2026-04-09 14:30:52','VENT-239',12,1.000,1.500,'Administracion',2),
 (636,'2026-04-10 14:52:54','VENT-240',60,1.000,10.130,'Administracion',2),
 (637,'2026-04-10 14:52:54','VENT-240',60,1.000,10.130,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (638,'2026-04-11 12:24:19','VENT-241',53,1.000,10.400,'Administracion',2),
 (639,'2026-04-14 09:42:47','VENT-242',113,1.000,3.320,'Administracion',2),
 (640,'2026-04-15 11:17:04','VENT-243',59,1.000,3.640,'Administracion',2),
 (641,'2026-04-15 11:17:04','VENT-243',89,1.000,13.000,'Administracion',2),
 (642,'2026-04-15 11:17:04','VENT-243',13,1.000,2.340,'Administracion',2),
 (643,'2026-04-15 11:17:04','VENT-243',72,1.000,10.000,'Administracion',2),
 (644,'2026-04-15 11:17:04','VENT-243',89,1.000,13.000,'Administracion',2),
 (645,'2026-04-15 14:16:12','VENT-244',87,1.000,6.000,'Administracion',2),
 (646,'2026-04-15 13:16:42','DEV:V-244',87,1.000,13.100,'Administracion',1),
 (647,'2026-04-17 11:52:31','VENT-245',15,1.000,16.140,'Administracion',2),
 (648,'2026-04-17 11:55:55','VENT-246',21,1.000,8.000,'Administracion',2),
 (649,'2026-04-18 11:23:07','VENT-247',31,1.000,19.240,'Administracion',2),
 (650,'2026-04-22 16:17:18','VENT-248',26,1.000,7.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (651,'2026-04-24 09:54:23','VENT-249',85,1.000,12.000,'Administracion',2),
 (652,'2026-04-24 09:09:22','DEV:V-249',85,1.000,18.000,'Administracion',1),
 (653,'2026-04-24 11:39:27','VENT-250',82,1.000,1.000,'Administracion',2),
 (654,'2026-04-24 15:18:27','VENT-251',98,1.000,17.900,'Administracion',2),
 (655,'2026-04-24 17:41:25','VENT-252',60,1.000,10.130,'Administracion',2),
 (656,'2026-04-24 17:41:55','VENT-253',40,1.000,15.400,'Administracion',2),
 (657,'2026-04-24 17:41:55','VENT-253',94,1.000,5.400,'Administracion',2),
 (658,'2026-04-24 17:42:20','VENT-254',108,1.000,18.000,'Administracion',2),
 (659,'2026-04-24 17:42:38','VENT-255',46,1.000,7.700,'Administracion',2),
 (660,'2026-04-24 17:43:10','VENT-256',48,1.000,30.710,'Administracion',2),
 (661,'2026-04-24 17:43:10','VENT-256',96,1.000,17.000,'Administracion',2),
 (662,'2026-04-24 17:43:42','VENT-257',48,1.000,30.710,'Administracion',2),
 (663,'2026-04-24 17:44:20','VENT-258',42,1.000,23.010,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (664,'2026-04-24 17:44:32','VENT-259',48,1.000,30.710,'Administracion',2),
 (665,'2026-04-24 17:44:32','VENT-259',97,1.000,13.000,'Administracion',2),
 (666,'2026-04-24 17:44:32','VENT-259',46,1.000,7.700,'Administracion',2),
 (667,'2026-04-24 17:44:32','VENT-259',48,1.000,30.710,'Administracion',2),
 (668,'2026-04-24 17:44:32','VENT-259',42,1.000,23.010,'Administracion',2),
 (669,'2026-04-24 17:44:45','VENT-260',95,1.000,10.000,'Administracion',2),
 (670,'2026-04-24 17:44:57','VENT-261',47,1.000,19.970,'Administracion',2),
 (671,'2026-04-24 17:45:12','VENT-262',107,1.000,7.500,'Administracion',2),
 (672,'2026-04-25 11:47:37','VENT-263',47,1.000,19.970,'Administracion',2),
 (673,'2026-04-25 11:47:37','VENT-263',61,1.000,13.340,'Administracion',2),
 (674,'2026-04-25 11:57:25','VENT-264',63,1.000,3.800,'Administracion',2),
 (675,'2026-04-25 15:57:24','VENT-265',75,1.000,6.000,'Administracion',2),
 (676,'2026-04-25 15:57:24','VENT-265',54,1.000,17.330,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (677,'2026-04-25 16:12:13','VENT-266',110,1.000,2.460,'Administracion',2),
 (678,'2026-04-25 16:19:54','VENT-267',66,1.000,4.200,'Administracion',2),
 (679,'2026-04-25 16:19:54','VENT-267',53,1.000,10.400,'Administracion',2),
 (680,'2026-04-25 16:47:06','AJUS-1',61,1.000,15.000,'Administracion',1),
 (681,'2026-04-28 11:11:00','VENT-268',105,1.000,8.330,'Administracion',2),
 (682,'2026-04-28 11:11:00','VENT-268',95,1.000,10.000,'Administracion',2),
 (683,'2026-04-29 15:05:10','VENT-269',30,1.000,1.000,'Administracion',2),
 (684,'2026-04-29 17:17:35','VENT-270',113,1.000,3.320,'Administracion',2),
 (685,'2026-04-30 17:12:36','VENT-271',109,1.000,2.930,'Administracion',2),
 (686,'2026-05-02 17:46:55','VENT-272',63,1.000,3.800,'Administracion',2),
 (687,'2026-05-03 12:04:35','VENT-273',24,1.000,10.100,'Administracion',2),
 (688,'2026-05-03 12:04:35','VENT-273',13,1.000,2.340,'Administracion',2),
 (689,'2026-05-06 09:29:37','VENT-274',109,1.000,2.930,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (690,'2026-05-06 16:23:18','VENT-275',57,1.000,15.170,'Administracion',2),
 (691,'2026-05-06 17:54:17','VENT-276',61,1.000,13.340,'Administracion',2),
 (692,'2026-05-10 11:24:53','VENT-277',5,1.000,4.590,'Administracion',2),
 (693,'2026-05-10 11:24:53','VENT-277',38,1.000,5.000,'Administracion',2),
 (694,'2026-05-10 11:24:53','VENT-277',31,1.000,19.240,'Administracion',2),
 (695,'2026-05-10 11:24:53','VENT-277',94,1.000,5.400,'Administracion',2),
 (696,'2026-05-12 08:51:02','VENT-278',107,2.000,7.500,'Administracion',2),
 (697,'2026-05-12 08:51:02','VENT-278',14,2.000,10.470,'Administracion',2),
 (698,'2026-05-12 10:39:58','VENT-279',38,1.000,5.000,'Administracion',2),
 (699,'2026-05-12 10:39:58','VENT-279',46,1.000,7.700,'Administracion',2),
 (700,'2026-05-13 11:14:57','VENT-280',1,1.000,0.970,'Administracion',2),
 (701,'2026-05-13 11:14:57','VENT-281',1,1.000,0.970,'Administracion',2),
 (702,'2026-05-13 11:14:58','VENT-282',1,1.000,0.970,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (703,'2026-05-13 10:24:42','DEV:V-282',1,1.000,4.000,'Administracion',1),
 (704,'2026-05-13 10:24:51','DEV:V-280',1,1.000,4.000,'Administracion',1),
 (705,'2026-05-15 15:09:31','VENT-283',62,1.000,19.740,'Administracion',2),
 (706,'2026-05-15 16:21:41','VENT-284',32,1.000,6.700,'Administracion',2),
 (707,'2026-05-15 16:21:41','VENT-284',105,1.000,8.330,'Administracion',2),
 (708,'2026-05-15 16:21:41','VENT-284',14,1.000,10.470,'Administracion',2),
 (709,'2026-05-15 16:21:41','VENT-284',14,1.000,10.470,'Administracion',2),
 (710,'2026-05-15 16:21:41','VENT-284',39,1.000,4.000,'Administracion',2),
 (711,'2026-05-16 11:46:51','VENT-285',33,3.000,9.000,'Administracion',2),
 (712,'2026-05-19 15:20:31','VENT-286',98,1.000,17.900,'Administracion',2),
 (713,'2026-05-22 16:48:19','VENT-287',110,1.000,2.460,'Administracion',2),
 (714,'2026-05-23 10:07:29','VENT-288',107,1.000,7.500,'Administracion',2),
 (715,'2026-05-23 10:07:29','VENT-288',33,1.000,9.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (716,'2026-05-23 10:07:29','VENT-288',47,1.000,19.970,'Administracion',2),
 (717,'2026-05-27 16:52:53','VENT-289',30,2.000,1.000,'Administracion',2),
 (718,'2026-05-27 17:22:51','VENT-290',25,1.000,5.000,'Administracion',2),
 (719,'2026-05-28 10:25:53','VENT-291',95,1.000,10.000,'Administracion',2),
 (720,'2026-05-29 11:38:22','VENT-292',31,1.000,19.240,'Administracion',2),
 (721,'2026-06-02 11:14:24','VENT-293',15,1.000,16.140,'Administracion',2),
 (722,'2026-06-03 17:39:05','VENT-294',1,1.000,0.970,'Administracion',2),
 (723,'2026-06-04 10:56:16','VENT-295',33,1.000,9.000,'Administracion',2),
 (724,'2026-06-04 10:56:16','VENT-295',53,1.000,10.400,'Administracion',2),
 (725,'2026-06-04 10:56:16','VENT-295',53,1.000,10.400,'Administracion',2),
 (726,'2026-06-04 10:56:16','VENT-295',32,1.000,6.700,'Administracion',2),
 (727,'2026-06-05 18:06:11','VENT-296',106,1.000,9.110,'Administracion',2),
 (728,'2026-06-05 18:29:51','VENT-297',97,1.000,13.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (729,'2026-06-05 18:29:51','VENT-297',45,1.000,12.650,'Administracion',2),
 (730,'2026-06-06 13:17:01','VENT-298',104,1.000,9.550,'Administracion',2),
 (731,'2026-06-08 15:28:54','COMP-12-01',42,6.000,10.540,'Administracion',1),
 (732,'2026-06-08 15:28:54','COMP-12-01',63,6.000,1.170,'Administracion',1),
 (733,'2026-06-08 15:28:54','COMP-12-01',45,6.000,8.900,'Administracion',1),
 (734,'2026-06-08 15:28:54','COMP-12-01',26,4.000,15.510,'Administracion',1),
 (735,'2026-06-08 15:28:54','COMP-12-01',39,3.000,19.310,'Administracion',1),
 (736,'2026-06-08 15:28:54','COMP-12-01',40,1.000,14.480,'Administracion',1),
 (737,'2026-06-08 15:28:54','COMP-12-01',5,2.000,12.070,'Administracion',1),
 (738,'2026-06-08 15:28:54','COMP-12-01',36,3.000,5.600,'Administracion',1),
 (739,'2026-06-08 15:28:54','COMP-12-01',96,4.000,4.530,'Administracion',1),
 (740,'2026-06-08 15:28:54','COMP-12-01',60,3.000,8.500,'Administracion',1),
 (741,'2026-06-08 15:28:54','COMP-12-01',71,6.000,9.130,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (742,'2026-06-08 15:28:54','COMP-12-01',126,2.000,13.050,'Administracion',1),
 (743,'2026-06-08 15:28:54','COMP-12-01',124,1.000,22.000,'Administracion',1),
 (744,'2026-06-08 15:28:54','COMP-12-01',123,6.000,11.080,'Administracion',1),
 (745,'2026-06-08 15:28:54','COMP-12-01',122,8.000,5.010,'Administracion',1),
 (746,'2026-06-08 15:28:54','COMP-12-01',121,6.000,9.100,'Administracion',1),
 (747,'2026-06-08 15:28:54','COMP-12-01',120,4.000,7.920,'Administracion',1),
 (748,'2026-06-08 15:28:54','COMP-12-01',119,5.000,1.930,'Administracion',1),
 (749,'2026-06-08 15:28:54','COMP-12-01',118,1.000,17.330,'Administracion',1),
 (750,'2026-06-08 15:28:54','COMP-12-01',125,1.000,20.720,'Administracion',1),
 (751,'2026-06-08 16:04:55','VENT-299',102,2.000,7.900,'Administracion',2),
 (752,'2026-06-10 14:31:46','VENT-300',94,1.000,5.400,'Administracion',2),
 (753,'2026-06-11 09:40:41','VENT-301',63,1.000,1.170,'Administracion',2),
 (754,'2026-06-11 09:40:41','VENT-301',18,1.000,3.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (755,'2026-06-12 13:50:15','VENT-302',16,1.000,5.000,'Administracion',2),
 (756,'2026-06-12 12:50:49','DEV:V-302',16,1.000,10.000,'Administracion',1),
 (757,'2026-06-13 09:01:55','VENT-303',58,1.000,2.200,'Administracion',2),
 (758,'2026-06-13 09:02:45','VENT-304',71,1.000,9.130,'Administracion',2),
 (759,'2026-06-13 09:03:32','VENT-305',109,1.000,2.930,'Administracion',2),
 (760,'2026-06-13 09:04:34','VENT-306',40,1.000,14.480,'Administracion',2),
 (761,'2026-06-13 09:04:34','VENT-306',42,1.000,10.540,'Administracion',2),
 (762,'2026-06-13 09:07:06','VENT-307',96,1.000,4.530,'Administracion',2),
 (763,'2026-06-13 13:20:38','VENT-308',96,1.000,4.530,'Administracion',2),
 (764,'2026-06-13 15:06:48','VENT-309',33,1.000,9.000,'Administracion',2),
 (765,'2026-06-13 15:50:44','VENT-310',121,1.000,9.100,'Administracion',2),
 (766,'2026-06-15 09:59:02','VENT-311',42,1.000,10.540,'Administracion',2),
 (767,'2026-06-15 09:59:02','VENT-311',23,1.000,8.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (768,'2026-06-15 14:00:59','VENT-312',119,2.000,1.930,'Administracion',2),
 (769,'2026-06-15 14:00:59','VENT-312',107,1.000,7.500,'Administracion',2),
 (770,'2026-06-15 14:00:59','VENT-312',115,1.000,12.780,'Administracion',2),
 (771,'2026-06-15 14:00:59','VENT-312',122,1.000,5.010,'Administracion',2),
 (772,'2026-06-15 16:53:52','VENT-313',42,1.000,10.540,'Administracion',2),
 (773,'2026-06-15 16:53:52','VENT-313',6,1.000,15.000,'Administracion',2),
 (774,'2026-06-17 16:51:33','COMP-13-01',127,27.000,12.074,'Administracion',1),
 (775,'2026-06-17 16:57:30','VENT-314',127,1.000,12.074,'Administracion',2),
 (776,'2026-06-18 09:15:40','VENT-315',127,1.000,12.074,'Administracion',2),
 (777,'2026-06-18 10:40:50','VENT-316',36,1.000,5.600,'Administracion',2),
 (778,'2026-06-18 15:36:18','VENT-317',127,1.000,12.074,'Administracion',2),
 (779,'2026-06-19 09:43:26','VENT-318',87,1.000,6.000,'Administracion',2),
 (780,'2026-06-19 09:43:26','VENT-318',58,1.000,2.200,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (781,'2026-06-19 11:10:24','VENT-319',127,1.000,12.074,'Administracion',2),
 (782,'2026-06-19 11:11:06','VENT-320',127,1.000,12.074,'Administracion',2),
 (783,'2026-06-19 11:12:43','VENT-321',127,1.000,12.074,'Administracion',2),
 (784,'2026-06-19 14:33:19','VENT-322',41,1.000,14.280,'Administracion',2),
 (785,'2026-06-19 14:33:19','VENT-322',2,1.000,2.000,'Administracion',2),
 (786,'2026-06-19 14:33:19','VENT-322',96,1.000,4.530,'Administracion',2),
 (787,'2026-06-19 14:33:19','VENT-322',71,1.000,9.130,'Administracion',2),
 (788,'2026-06-19 15:44:25','VENT-323',26,1.000,15.510,'Administracion',2),
 (789,'2026-06-19 15:44:25','VENT-323',100,1.000,15.620,'Administracion',2),
 (790,'2026-06-19 15:44:25','VENT-323',123,1.000,11.080,'Administracion',2),
 (791,'2026-06-19 15:44:25','VENT-323',99,1.000,14.850,'Administracion',2),
 (792,'2026-06-19 15:44:25','VENT-323',107,1.000,7.500,'Administracion',2),
 (793,'2026-06-19 15:45:39','VENT-324',127,1.000,12.074,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (794,'2026-06-20 11:07:29','VENT-325',47,1.000,19.970,'Administracion',2),
 (795,'2026-06-20 14:29:54','VENT-326',102,1.000,7.900,'Administracion',2),
 (796,'2026-06-20 14:29:54','VENT-326',76,1.000,1.000,'Administracion',2),
 (797,'2026-06-20 16:27:29','VENT-327',45,1.000,8.900,'Administracion',2),
 (798,'2026-06-20 15:44:36','DEV:V-324',127,1.000,18.000,'Administracion',1),
 (799,'2026-06-20 16:47:12','VENT-328',127,1.000,12.074,'Administracion',2),
 (800,'2026-06-22 09:32:15','VENT-329',127,1.000,12.074,'Administracion',2),
 (801,'2026-06-23 11:25:07','VENT-330',41,1.000,14.280,'Administracion',2),
 (802,'2026-06-24 09:25:26','VENT-331',15,1.000,16.140,'Administracion',2),
 (803,'2026-06-24 17:12:24','VENT-332',95,1.000,10.000,'Administracion',2),
 (804,'2026-06-25 15:12:13','VENT-333',111,1.000,2.716,'Administracion',2),
 (805,'2026-06-25 15:12:13','VENT-333',12,1.000,1.500,'Administracion',2),
 (806,'2026-06-27 10:58:58','VENT-334',30,1.000,1.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (807,'2026-06-27 10:58:58','VENT-334',24,1.000,10.100,'Administracion',2),
 (808,'2026-06-27 11:30:33','VENT-335',39,1.000,19.310,'Administracion',2),
 (809,'2026-06-27 11:30:33','VENT-335',94,1.000,5.400,'Administracion',2),
 (810,'2026-06-27 11:30:33','VENT-335',15,1.000,16.140,'Administracion',2),
 (811,'2026-06-27 10:49:23','DEV:V-334',30,1.000,2.000,'Administracion',1),
 (812,'2026-06-27 10:49:23','DEV:V-334',24,1.000,15.000,'Administracion',1),
 (813,'2026-06-27 11:50:18','VENT-336',30,1.000,1.000,'Administracion',2),
 (814,'2026-06-27 11:50:18','VENT-336',24,1.000,10.100,'Administracion',2),
 (815,'2026-06-27 15:33:13','DEV:V-336',30,1.000,2.000,'Administracion',1),
 (816,'2026-06-27 15:33:13','DEV:V-336',24,1.000,15.000,'Administracion',1),
 (817,'2026-06-29 10:49:04','VENT-337',24,1.000,10.100,'Administracion',2),
 (818,'2026-06-29 17:11:52','VENT-338',24,1.000,10.100,'Administracion',2),
 (819,'2026-06-30 11:11:56','VENT-339',54,1.000,17.330,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (820,'2026-06-30 11:11:56','VENT-339',85,1.000,12.000,'Administracion',2),
 (821,'2026-06-30 11:11:56','VENT-339',25,1.000,5.000,'Administracion',2),
 (822,'2026-07-01 18:31:17','COMP-14-01',145,2.000,16.180,'Administracion',1),
 (823,'2026-07-01 18:31:17','COMP-14-01',144,2.000,15.630,'Administracion',1),
 (824,'2026-07-01 18:31:17','COMP-14-01',143,2.000,17.620,'Administracion',1),
 (825,'2026-07-01 18:31:17','COMP-14-01',142,4.000,13.390,'Administracion',1),
 (826,'2026-07-01 18:31:17','COMP-14-01',141,1.000,23.460,'Administracion',1),
 (827,'2026-07-01 18:31:17','COMP-14-01',140,6.000,4.020,'Administracion',1),
 (828,'2026-07-01 18:31:17','COMP-14-01',139,8.000,1.260,'Administracion',1),
 (829,'2026-07-01 18:31:17','COMP-14-01',138,2.000,7.770,'Administracion',1),
 (830,'2026-07-01 18:31:17','COMP-14-01',137,2.000,7.170,'Administracion',1),
 (831,'2026-07-01 18:31:17','COMP-14-01',136,2.000,4.840,'Administracion',1),
 (832,'2026-07-01 18:31:17','COMP-14-01',135,4.000,2.740,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (833,'2026-07-01 18:31:17','COMP-14-01',134,1.000,18.350,'Administracion',1),
 (834,'2026-07-01 18:31:17','COMP-14-01',133,6.000,9.250,'Administracion',1),
 (835,'2026-07-01 18:31:17','COMP-14-01',132,3.000,10.300,'Administracion',1),
 (836,'2026-07-01 18:31:17','COMP-14-01',131,15.000,5.060,'Administracion',1),
 (837,'2026-07-01 18:31:17','COMP-14-01',130,16.000,1.900,'Administracion',1),
 (838,'2026-07-01 18:31:17','COMP-14-01',129,5.000,13.900,'Administracion',1),
 (839,'2026-07-01 18:31:17','COMP-14-01',128,4.000,11.500,'Administracion',1),
 (840,'2026-07-01 18:31:17','COMP-14-01',40,5.000,14.680,'Administracion',1),
 (841,'2026-07-01 18:31:17','COMP-14-01',111,2.000,10.010,'Administracion',1),
 (842,'2026-07-02 11:40:07','VENT-340',31,1.000,19.240,'Administracion',2),
 (843,'2026-07-02 11:40:07','VENT-340',119,1.000,1.930,'Administracion',2),
 (844,'2026-07-03 10:53:05','VENT-341',42,1.000,10.540,'Administracion',2),
 (845,'2026-07-03 10:53:05','VENT-341',119,1.000,1.930,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (846,'2026-07-04 12:09:44','VENT-342',99,1.000,14.850,'Administracion',2),
 (847,'2026-07-04 12:09:44','VENT-342',128,1.000,11.500,'Administracion',2),
 (848,'2026-07-04 17:45:17','VENT-343',130,1.000,1.900,'Administracion',2),
 (849,'2026-07-04 17:45:17','VENT-343',130,1.000,1.900,'Administracion',2),
 (850,'2026-07-06 09:08:06','VENT-344',40,1.000,14.680,'Administracion',2),
 (851,'2026-07-07 15:20:01','VENT-345',48,1.000,30.710,'Administracion',2),
 (852,'2026-07-07 15:41:09','VENT-346',142,1.000,13.390,'Administracion',2),
 (853,'2026-07-07 15:41:09','VENT-346',145,1.000,16.180,'Administracion',2),
 (854,'2026-07-08 15:36:55','VENT-347',104,1.000,9.550,'Administracion',2),
 (855,'2026-07-08 15:36:55','VENT-347',134,1.000,18.350,'Administracion',2),
 (856,'2026-07-08 15:36:55','VENT-347',24,1.000,10.100,'Administracion',2),
 (857,'2026-07-08 15:36:55','VENT-347',63,1.000,1.170,'Administracion',2),
 (858,'2026-07-08 18:12:36','VENT-348',144,1.000,15.630,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (859,'2026-07-08 18:12:36','VENT-348',5,1.000,12.070,'Administracion',2),
 (860,'2026-07-08 18:12:36','VENT-348',63,1.000,1.170,'Administracion',2),
 (861,'2026-07-08 18:12:36','VENT-348',24,1.000,10.100,'Administracion',2),
 (862,'2026-07-09 09:46:07','VENT-349',41,1.000,14.280,'Administracion',2),
 (863,'2026-07-10 14:48:29','VENT-350',13,1.000,2.340,'Administracion',2),
 (864,'2026-07-10 14:48:29','VENT-350',31,1.000,19.240,'Administracion',2),
 (865,'2026-07-10 15:54:44','VENT-351',140,1.000,4.020,'Administracion',2),
 (866,'2026-07-10 15:54:44','VENT-351',92,1.000,20.000,'Administracion',2),
 (867,'2026-07-10 18:12:18','VENT-352',94,1.000,5.400,'Administracion',2),
 (868,'2026-07-11 14:26:24','VENT-353',65,1.000,2.200,'Administracion',2),
 (869,'2026-07-11 14:26:24','VENT-353',22,1.000,11.000,'Administracion',2),
 (870,'2026-07-13 09:41:38','VENT-354',54,1.000,17.330,'Administracion',2),
 (871,'2026-07-13 09:44:09','VENT-355',36,1.000,5.600,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (872,'2026-07-14 15:57:31','VENT-356',97,2.000,13.000,'Administracion',2),
 (873,'2026-07-15 17:15:17','VENT-357',6,1.000,15.000,'Administracion',2),
 (874,'2026-07-15 17:16:37','VENT-358',127,1.000,12.074,'Administracion',2),
 (875,'2026-07-17 11:17:28','VENT-359',47,1.000,19.970,'Administracion',2),
 (876,'2026-07-17 17:21:07','VENT-360',45,2.000,8.900,'Administracion',2),
 (877,'2026-07-17 17:21:07','VENT-360',128,1.000,11.500,'Administracion',2),
 (878,'2026-07-17 17:21:07','VENT-360',40,1.000,14.680,'Administracion',2),
 (879,'2026-07-18 10:02:47','VENT-361',133,1.000,9.250,'Administracion',2),
 (880,'2026-07-18 10:19:48','VENT-362',4,2.000,1.000,'Administracion',2),
 (881,'2026-07-18 10:54:32','VENT-363',61,1.000,13.340,'Administracion',2),
 (882,'2026-07-18 14:42:40','VENT-364',51,1.000,20.660,'Administracion',2),
 (883,'2026-07-18 14:49:40','VENT-365',17,1.000,3.000,'Administracion',2),
 (884,'2026-07-18 15:23:18','VENT-366',140,1.000,4.020,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (885,'2026-07-18 15:23:18','VENT-366',94,1.000,5.400,'Administracion',2),
 (886,'2026-07-18 15:23:18','VENT-366',12,1.000,1.500,'Administracion',2),
 (887,'2026-07-18 15:23:18','VENT-366',17,1.000,3.000,'Administracion',2),
 (888,'2026-07-18 16:08:08','VENT-367',60,1.000,8.500,'Administracion',2),
 (889,'2026-07-18 16:08:08','VENT-367',71,1.000,9.130,'Administracion',2),
 (890,'2026-07-18 17:41:37','VENT-368',45,1.000,8.900,'Administracion',2),
 (891,'2026-07-18 17:41:37','VENT-368',97,1.000,13.000,'Administracion',2),
 (892,'2026-07-18 17:41:37','VENT-368',41,1.000,14.280,'Administracion',2),
 (893,'2026-07-18 17:41:37','VENT-368',46,2.000,7.700,'Administracion',2),
 (894,'2026-07-18 17:41:37','VENT-368',96,1.000,4.530,'Administracion',2),
 (895,'2026-07-18 17:41:37','VENT-368',126,1.000,13.050,'Administracion',2),
 (896,'2026-07-19 10:29:01','VENT-369',119,1.000,1.930,'Administracion',2),
 (897,'2026-07-19 10:33:44','VENT-370',94,1.000,5.400,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (898,'2026-07-19 11:05:23','VENT-371',63,2.000,1.170,'Administracion',2),
 (899,'2026-07-19 11:05:23','VENT-371',50,1.000,12.700,'Administracion',2),
 (900,'2026-07-19 11:37:50','VENT-372',106,2.000,9.110,'Administracion',2),
 (901,'2026-07-19 11:37:50','VENT-372',14,1.000,10.470,'Administracion',2),
 (902,'2026-07-19 12:02:01','VENT-373',114,1.000,2.400,'Administracion',2),
 (903,'2026-07-19 12:26:49','VENT-374',93,2.000,8.200,'Administracion',2),
 (904,'2026-07-19 12:26:49','VENT-374',139,1.000,1.260,'Administracion',2),
 (905,'2026-07-19 12:27:30','VENT-375',120,1.000,7.920,'Administracion',2),
 (906,'2026-07-19 12:28:36','VENT-376',19,1.000,5.000,'Administracion',2),
 (907,'2026-07-19 12:28:36','VENT-376',133,1.000,9.250,'Administracion',2),
 (908,'2026-07-19 12:28:36','VENT-376',108,2.000,18.000,'Administracion',2),
 (909,'2026-07-20 14:56:19','VENT-377',139,1.000,1.260,'Administracion',2),
 (910,'2026-07-20 17:30:51','VENT-378',131,1.000,5.060,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (911,'2026-07-20 17:30:51','VENT-378',121,1.000,9.100,'Administracion',2),
 (912,'2026-07-21 17:56:25','VENT-379',100,1.000,15.620,'Administracion',2),
 (913,'2026-07-23 11:44:53','VENT-380',63,1.000,1.170,'Administracion',2),
 (914,'2026-07-23 11:44:53','VENT-380',71,1.000,9.130,'Administracion',2),
 (915,'2026-07-24 14:42:16','VENT-381',51,1.000,20.660,'Administracion',2),
 (916,'2026-07-27 13:14:15','VENT-382',26,1.000,15.510,'Administracion',2),
 (917,'2026-07-27 13:14:15','VENT-382',129,1.000,13.900,'Administracion',2),
 (918,'2026-07-27 13:14:15','VENT-382',131,1.000,5.060,'Administracion',2),
 (919,'2026-07-28 09:08:01','VENT-383',47,1.000,19.970,'Administracion',2),
 (920,'2026-07-28 14:48:10','VENT-384',33,1.000,9.000,'Administracion',2),
 (921,'2026-07-28 14:48:10','VENT-384',122,1.000,5.010,'Administracion',2),
 (922,'2026-07-28 16:38:51','VENT-385',124,1.000,22.000,'Administracion',2),
 (923,'2026-07-28 17:01:38','VENT-386',122,1.000,5.010,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (924,'2026-07-29 10:10:58','VENT-387',45,1.000,8.900,'Administracion',2),
 (925,'2026-07-29 10:10:58','VENT-387',121,1.000,9.100,'Administracion',2),
 (926,'2026-07-29 11:21:54','VENT-388',41,1.000,14.280,'Administracion',2),
 (927,'2026-07-30 09:38:46','VENT-389',5,1.000,12.070,'Administracion',2),
 (928,'2026-07-30 11:18:55','VENT-390',114,1.000,2.400,'Administracion',2),
 (929,'2026-07-30 14:40:59','VENT-391',109,1.000,2.930,'Administracion',2),
 (930,'2026-07-31 17:03:12','VENT-392',30,1.000,1.000,'Administracion',2),
 (931,'2026-07-31 17:03:12','VENT-392',139,1.000,1.260,'Administracion',2),
 (932,'2026-07-31 17:03:12','VENT-392',35,1.000,0.140,'Administracion',2),
 (933,'2026-07-31 17:03:12','VENT-392',50,1.000,12.700,'Administracion',2),
 (934,'2026-07-31 17:03:12','VENT-392',23,1.000,8.000,'Administracion',2),
 (935,'2026-08-01 10:09:27','VENT-393',43,1.000,14.840,'Administracion',2),
 (936,'2026-08-01 10:09:27','VENT-393',142,1.000,13.390,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (937,'2026-08-01 11:58:01','VENT-394',110,1.000,2.460,'Administracion',2),
 (938,'2026-08-01 12:02:03','VENT-395',123,1.000,11.080,'Administracion',2),
 (939,'2026-08-01 12:02:03','VENT-395',131,1.000,5.060,'Administracion',2),
 (940,'2026-08-01 16:48:31','VENT-396',19,1.000,5.000,'Administracion',2),
 (941,'2026-08-01 16:52:03','VENT-397',94,1.000,5.400,'Administracion',2),
 (942,'2026-08-03 13:47:22','VENT-398',133,1.000,9.250,'Administracion',2),
 (943,'2026-08-03 16:44:56','VENT-399',101,1.000,12.200,'Administracion',2),
 (944,'2026-08-04 13:46:11','VENT-400',88,1.000,10.000,'Administracion',2),
 (945,'2026-08-04 13:46:11','VENT-400',111,1.000,10.010,'Administracion',2),
 (946,'2026-08-04 14:26:13','VENT-401',129,1.000,13.900,'Administracion',2),
 (947,'2026-08-04 16:42:09','VENT-402',31,1.000,19.240,'Administracion',2),
 (948,'2026-08-04 17:55:32','VENT-403',40,1.000,14.680,'Administracion',2),
 (949,'2026-08-06 14:56:43','VENT-404',139,2.000,1.260,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (950,'2026-08-07 17:45:08','VENT-405',45,1.000,8.900,'Administracion',2),
 (951,'2026-08-08 09:29:03','DEV:V-401',129,1.000,20.000,'Administracion',1),
 (952,'2026-08-08 10:30:59','VENT-406',131,1.000,5.060,'Administracion',2),
 (953,'2026-08-08 10:30:59','VENT-406',122,1.000,5.010,'Administracion',2),
 (954,'2026-08-12 15:06:05','VENT-407',94,1.000,5.400,'Administracion',2),
 (955,'2026-08-13 14:02:13','VENT-408',94,1.000,5.400,'Administracion',2),
 (956,'2026-08-13 14:02:13','VENT-408',16,1.000,5.000,'Administracion',2),
 (957,'2026-08-15 10:12:37','VENT-409',61,1.000,13.340,'Administracion',2),
 (958,'2026-08-15 10:12:37','VENT-409',141,1.000,23.460,'Administracion',2),
 (959,'2026-08-15 15:27:15','VENT-410',129,1.000,13.900,'Administracion',2),
 (960,'2026-08-15 18:03:18','VENT-411',62,1.000,19.740,'Administracion',2),
 (961,'2026-08-15 18:03:18','VENT-411',56,1.000,6.200,'Administracion',2),
 (962,'2026-08-15 18:03:18','VENT-411',2,1.000,2.000,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (963,'2026-08-15 18:03:18','VENT-411',139,2.000,1.260,'Administracion',2),
 (964,'2026-08-15 18:03:18','VENT-411',76,2.000,1.000,'Administracion',2),
 (965,'2026-08-15 18:03:18','VENT-411',139,2.000,1.260,'Administracion',2),
 (966,'2026-08-18 10:28:13','VENT-412',14,1.000,10.470,'Administracion',2),
 (967,'2026-08-18 10:28:13','VENT-412',106,1.000,9.110,'Administracion',2),
 (968,'2026-08-18 10:28:13','VENT-412',104,1.000,9.550,'Administracion',2),
 (969,'2026-08-18 15:46:01','VENT-413',131,2.000,5.060,'Administracion',2),
 (970,'2026-08-20 13:45:45','VENT-414',61,1.000,13.340,'Administracion',2),
 (971,'2026-08-20 13:45:45','VENT-414',78,1.000,2.000,'Administracion',2),
 (972,'2026-08-20 13:45:45','VENT-414',6,1.000,15.000,'Administracion',2),
 (973,'2026-08-20 17:53:13','VENT-415',32,1.000,6.700,'Administracion',2),
 (974,'2026-08-21 10:25:01','VENT-416',100,1.000,15.620,'Administracion',2),
 (975,'2026-08-21 10:25:01','VENT-416',130,3.000,1.900,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (976,'2026-08-21 10:25:01','VENT-416',8,1.000,5.000,'Administracion',2),
 (977,'2026-08-21 10:25:01','VENT-416',101,1.000,12.200,'Administracion',2),
 (978,'2026-08-21 10:25:01','VENT-416',116,1.000,2.250,'Administracion',2),
 (979,'2026-08-21 14:45:31','VENT-417',106,1.000,9.110,'Administracion',2),
 (980,'2026-08-21 14:46:52','VENT-418',40,1.000,14.680,'Administracion',2),
 (981,'2026-08-22 10:50:53','VENT-419',95,1.000,10.000,'Administracion',2),
 (982,'2026-08-22 16:49:13','VENT-420',14,1.000,10.470,'Administracion',2),
 (983,'2026-08-22 16:49:13','VENT-420',95,1.000,10.000,'Administracion',2),
 (984,'2026-08-25 10:36:58','AJUS-2',139,4.000,1.260,'Administracion',1),
 (985,'2026-08-25 11:45:47','COMP-15-01',5,2.000,25.300,'Administracion',1),
 (986,'2026-08-25 11:45:47','COMP-15-01',109,2.000,11.210,'Administracion',1),
 (987,'2026-08-25 11:45:47','COMP-15-01',110,2.000,12.740,'Administracion',1),
 (988,'2026-08-25 11:45:47','COMP-15-01',45,2.000,13.200,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (989,'2026-08-25 11:45:47','COMP-15-01',116,2.000,9.490,'Administracion',1),
 (990,'2026-08-25 11:45:47','COMP-15-01',62,2.000,12.970,'Administracion',1),
 (991,'2026-08-25 11:45:47','COMP-15-01',2,2.000,7.260,'Administracion',1),
 (992,'2026-08-25 11:45:47','COMP-15-01',63,2.000,2.800,'Administracion',1),
 (993,'2026-08-25 11:45:47','COMP-15-01',114,2.000,6.560,'Administracion',1),
 (994,'2026-08-25 11:45:47','COMP-15-01',43,2.000,4.880,'Administracion',1),
 (995,'2026-08-25 11:45:47','COMP-15-01',51,2.000,8.900,'Administracion',1),
 (996,'2026-08-25 11:45:47','COMP-15-01',141,11.000,0.920,'Administracion',1),
 (997,'2026-08-25 11:45:47','COMP-15-01',134,15.000,6.380,'Administracion',1),
 (998,'2026-08-25 11:45:47','COMP-15-01',124,14.000,0.700,'Administracion',1),
 (999,'2026-08-25 11:45:47','COMP-15-01',96,4.000,12.670,'Administracion',1),
 (1000,'2026-08-25 11:45:47','COMP-15-01',119,4.000,19.800,'Administracion',1),
 (1001,'2026-08-25 11:45:47','COMP-15-01',146,5.000,1.000,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (1002,'2026-08-25 11:45:47','COMP-15-01',147,5.000,12.700,'Administracion',1),
 (1003,'2026-08-25 11:45:47','COMP-15-01',148,7.000,18.040,'Administracion',1),
 (1004,'2026-08-25 11:45:47','COMP-15-01',149,6.000,14.900,'Administracion',1),
 (1005,'2026-08-25 11:45:47','COMP-15-01',150,1.000,4.000,'Administracion',1),
 (1006,'2026-08-25 11:45:47','COMP-15-01',151,1.000,16.720,'Administracion',1),
 (1007,'2026-08-25 11:45:47','COMP-15-01',152,1.000,4.870,'Administracion',1),
 (1008,'2026-08-25 11:45:47','COMP-15-01',153,1.000,10.790,'Administracion',1),
 (1009,'2026-08-25 11:45:47','COMP-15-01',154,1.000,25.800,'Administracion',1),
 (1010,'2026-08-25 11:45:47','COMP-15-01',155,1.000,11.920,'Administracion',1),
 (1011,'2026-08-25 11:45:47','COMP-15-01',156,4.000,7.260,'Administracion',1),
 (1012,'2026-08-25 11:45:47','COMP-15-01',157,4.000,2.510,'Administracion',1),
 (1013,'2026-08-25 11:45:47','COMP-15-01',158,3.000,9.330,'Administracion',1),
 (1014,'2026-08-25 11:45:47','COMP-15-01',159,3.000,8.690,'Administracion',1);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (1015,'2026-08-25 11:45:47','COMP-15-01',160,4.000,8.710,'Administracion',1),
 (1016,'2026-08-25 11:45:47','COMP-15-01',161,4.000,10.780,'Administracion',1),
 (1017,'2026-08-25 11:45:47','COMP-15-01',162,3.000,9.710,'Administracion',1),
 (1018,'2026-08-25 11:45:47','COMP-15-01',163,3.000,19.900,'Administracion',1),
 (1019,'2026-08-25 11:45:47','COMP-15-01',164,3.000,22.070,'Administracion',1),
 (1020,'2026-08-25 11:45:47','COMP-15-01',165,21.000,1.100,'Administracion',1),
 (1021,'2026-08-25 11:45:47','COMP-15-01',166,1.000,7.800,'Administracion',1),
 (1022,'2026-08-25 11:45:47','COMP-15-01',167,2.000,5.930,'Administracion',1),
 (1023,'2026-08-27 11:46:50','VENT-421',14,1.000,10.470,'Administracion',2),
 (1024,'2026-08-29 08:47:09','VENT-422',58,1.000,2.200,'Administracion',2),
 (1025,'2026-08-29 12:24:08','VENT-423',52,1.000,19.600,'Administracion',2),
 (1026,'2026-09-01 14:51:00','VENT-424',102,1.000,7.900,'Administracion',2),
 (1027,'2026-09-01 14:51:00','VENT-424',54,1.000,17.330,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (1028,'2026-09-01 16:00:29','VENT-425',26,1.000,15.510,'Administracion',2),
 (1029,'2026-09-01 16:00:29','VENT-425',118,1.000,17.330,'Administracion',2),
 (1030,'2026-09-01 17:53:54','VENT-426',98,1.000,17.900,'Administracion',2),
 (1031,'2026-09-03 15:00:32','VENT-427',131,1.000,5.060,'Administracion',2),
 (1032,'2026-09-03 15:06:50','VENT-428',54,1.000,17.330,'Administracion',2),
 (1033,'2026-09-04 16:53:56','VENT-429',104,1.000,9.550,'Administracion',2),
 (1034,'2026-09-04 16:53:56','VENT-429',104,1.000,9.550,'Administracion',2),
 (1035,'2026-09-05 11:41:58','VENT-430',54,1.000,17.330,'Administracion',2),
 (1036,'2026-09-05 16:34:30','VENT-431',50,1.000,12.700,'Administracion',2),
 (1037,'2026-09-08 16:25:26','VENT-432',160,2.000,8.710,'Administracion',2),
 (1038,'2026-09-10 10:08:03','COMP-16-01',118,24.000,11.833,'Administracion',1),
 (1039,'2026-09-10 11:21:09','VENT-433',98,1.000,17.900,'Administracion',2),
 (1040,'2026-09-10 14:00:44','VENT-434',129,1.000,13.900,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (1041,'2026-09-10 14:37:07','VENT-435',159,1.000,8.690,'Administracion',2),
 (1042,'2026-09-12 16:12:22','VENT-436',63,1.000,2.800,'Administracion',2),
 (1043,'2026-09-14 15:42:59','VENT-437',19,1.000,5.000,'Administracion',2),
 (1044,'2026-09-14 15:46:05','VENT-438',43,1.000,4.880,'Administracion',2),
 (1045,'2026-09-16 09:15:04','VENT-439',156,1.000,7.260,'Administracion',2),
 (1046,'2026-09-16 15:13:45','VENT-440',13,1.000,2.340,'Administracion',2),
 (1047,'2026-09-17 16:57:37','VENT-441',165,1.000,1.100,'Administracion',2),
 (1048,'2026-09-17 17:59:44','VENT-442',149,1.000,14.900,'Administracion',2),
 (1049,'2026-09-18 14:42:36','VENT-443',108,1.000,18.000,'Administracion',2),
 (1050,'2026-09-19 09:38:32','VENT-444',60,1.000,8.500,'Administracion',2),
 (1051,'2026-09-21 15:31:08','VENT-445',42,1.000,10.540,'Administracion',2),
 (1052,'2026-09-22 13:21:58','VENT-446',15,1.000,16.140,'Administracion',2),
 (1053,'2026-09-22 13:21:58','VENT-446',65,1.000,2.200,'Administracion',2);
INSERT INTO `kardex` (`id`,`fecha`,`documento`,`idarticulo`,`cantidad`,`costo`,`user`,`tipo`) VALUES 
 (1054,'2026-09-22 13:21:58','VENT-446',96,1.000,12.670,'Administracion',2),
 (1055,'2026-09-22 14:55:21','VENT-447',142,1.000,13.390,'Administracion',2),
 (1056,'2026-09-22 14:55:21','VENT-447',139,1.000,1.260,'Administracion',2),
 (1057,'2026-09-22 15:28:41','VENT-448',153,1.000,10.790,'Administracion',2),
 (1058,'2026-09-22 15:28:41','VENT-448',59,1.000,3.640,'Administracion',2),
 (1059,'2026-09-22 15:53:18','VENT-449',119,1.000,19.800,'Administracion',2),
 (1060,'2026-09-22 15:53:18','VENT-449',33,1.000,9.000,'Administracion',2),
 (1061,'2026-09-23 13:16:04','VENT-450',116,1.000,9.490,'Administracion',2),
 (1062,'2026-09-24 16:54:36','VENT-451',90,1.000,8.000,'Administracion',2),
 (1063,'2026-09-29 16:41:58','VENT-452',123,1.000,11.080,'Administracion',2),
 (1064,'2026-10-01 15:19:57','VENT-453',96,1.000,12.670,'Administracion',2),
 (1065,'2026-10-01 16:38:42','VENT-454',147,1.000,12.700,'Administracion',2);
/*!40000 ALTER TABLE `kardex` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svwebkids`.`migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`monedas`
--

DROP TABLE IF EXISTS `monedas`;
CREATE TABLE `monedas` (
  `idmoneda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `simbolo` char(3) DEFAULT 'sm',
  `valor` float(9,3) DEFAULT '0.000',
  `idbanco` int(11) DEFAULT '0',
  `tipom` varchar(2) DEFAULT 'N',
  PRIMARY KEY (`idmoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`monedas`
--

/*!40000 ALTER TABLE `monedas` DISABLE KEYS */;
INSERT INTO `monedas` (`idmoneda`,`nombre`,`tipo`,`simbolo`,`valor`,`idbanco`,`tipom`) VALUES 
 (1,'Dolares',0,'$',1.000,1,'E'),
 (2,'Dolares Transf.',0,'$',1.000,3,'E'),
 (3,'Pesos',1,'Ps',4000.000,0,'E'),
 (4,'Bolivares Efect.',1,'Bs',866.560,8,'N'),
 (13,'transferencia bnc',1,'bs',866.560,2,'N'),
 (15,'PTO VENTA BNC',1,'BS',866.560,2,'N'),
 (16,'DESC. FACT.',0,'$',1.000,0,'E');
/*!40000 ALTER TABLE `monedas` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`mov_ban`
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
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`mov_ban`
--

/*!40000 ALTER TABLE `mov_ban` DISABLE KEYS */;
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (1,2,1,'FAC',3,1,'N/C','FAC-3 Rec-1','Ventas','C',3,'','',472.920,203.740,'2025-11-15 13:34:17',0,'Administracion'),
 (2,1,2,'N/D',2,2,'N/C','N/D-2Rec-2','Anul.N/DRec2M:1','C',38,'','',0.000,236.460,'2025-11-17 00:00:00',1,'Administracion'),
 (3,1,1,'FAC',4,3,'N/C','FAC-4 Rec-3','Ventas','C',244,'','',12.750,236.840,'2025-11-25 12:52:11',0,'Administracion'),
 (4,1,13,'0',0,0,'N/D','BCO001 00000004','Anul.0Rec0M:12.75','P',1,'INVENTARIO DE FRESITA SHOP KIDS','123',0.000,240.000,'2025-12-05 00:00:00',1,'Administracion'),
 (5,1,1,'FAC',5,4,'N/C','FAC-5 Rec-4','Anul.5Rec4M:20','C',236,'','',0.000,236.840,'2025-12-05 19:04:41',1,'Administracion'),
 (6,2,1,'FAC',5,5,'N/C','FAC-5 Rec-5','Anul.5Rec5M:14.5','C',236,'','',0.000,236.840,'2025-12-05 19:04:41',1,'Administracion'),
 (7,2,1,'FAC',5,6,'N/C','FAC-5 Rec-6','Anul.5Rec6M:12.5','C',236,'','',0.000,236.840,'2025-12-05 19:04:41',1,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (8,1,1,'FAC',6,7,'N/C','FAC-6 Rec-7','Ventas','C',112,'','',25.000,0.000,'2025-12-06 16:59:57',0,'Administracion'),
 (9,1,1,'FAC',7,8,'N/C','FAC-7 Rec-8','Ventas','C',251,'','',10.000,0.000,'2025-12-06 17:34:12',0,'Administracion'),
 (10,2,1,'FAC',9,9,'N/C','FAC-9 Rec-9','Ventas','C',4,'','',7995.830,0.000,'2025-12-06 17:46:01',0,'Administracion'),
 (11,1,1,'FAC',10,10,'N/C','FAC-10 Rec-10','Anul.10Rec10M:185','C',4,'','',0.000,0.000,'2025-12-06 17:49:37',1,'Administracion'),
 (12,2,1,'FAC',11,11,'N/C','FAC-11 Rec-11','Ventas','C',4,'','',3482.060,0.000,'2025-12-06 17:50:56',0,'Administracion'),
 (13,2,1,'FAC',12,12,'N/C','FAC-12 Rec-12','Ventas','C',87,'','',2580.000,0.000,'2025-12-06 17:54:23',0,'Administracion'),
 (14,1,1,'FAC',13,13,'N/C','FAC-13 Rec-13','Ventas','C',252,'','',10.000,0.000,'2025-12-06 17:59:09',0,'Administracion'),
 (15,1,1,'FAC',15,14,'N/C','FAC-15 Rec-14','Ventas','C',253,'','',8.500,0.000,'2025-12-06 18:05:39',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (16,2,1,'FAC',16,15,'N/C','FAC-16 Rec-15','Ventas','C',161,'','',1031.720,0.000,'2025-12-06 18:26:43',0,'Administracion'),
 (17,1,1,'FAC',17,16,'N/C','FAC-17 Rec-16','Ventas','C',241,'','',80.980,0.000,'2025-12-06 18:43:52',0,'Administracion'),
 (18,1,13,'0',0,0,'N/D','BCO001 00000018','ajuste','V',3,'LISETH CONTRERAS','30685899',9.000,240.000,'2025-12-08 21:37:17',0,'Administracion'),
 (19,1,13,'0',0,0,'N/D','BCO001 00000019','ajuste','V',3,'LISETH CONTRERAS','30685899',12.750,240.000,'2025-12-08 21:37:22',0,'Administracion'),
 (20,1,1,'FAC',18,17,'N/C','FAC-18 Rec-17','Ventas','C',4,'','',23.000,0.000,'2025-12-08 10:23:05',0,'Administracion'),
 (21,1,12,'APA',3,18,'N/C','APA-0 Rec-18','Apartados','C',251,'','',10.000,257.930,'2025-12-09 09:25:24',0,'Administracion'),
 (22,2,12,'APA',4,19,'N/C','APA-0 Rec-19','Apartados','C',87,'','',2579.300,257.930,'2025-12-09 09:26:32',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (23,1,12,'APA',5,20,'N/C','APA-0 Rec-20','Doc. Anul.5Rec20M:30','C',252,'','',30.000,257.930,'2025-12-09 09:27:59',0,'Administracion'),
 (24,1,1,'FAC',21,21,'N/C','FAC-21 Rec-21','Ventas','C',4,'','',31.000,257.930,'2025-12-09 13:50:26',0,'Administracion'),
 (25,2,1,'FAC',22,22,'N/C','FAC-22 Rec-22','Ventas','C',4,'','',14959.940,257.930,'2025-12-09 14:05:28',0,'Administracion'),
 (26,2,1,'FAC',23,23,'N/C','FAC-23 Rec-23','Ventas','C',4,'','',28759.190,257.930,'2025-12-09 15:54:41',0,'Administracion'),
 (27,2,1,'FAC',24,24,'N/C','FAC-24 Rec-24','Ventas','C',156,'','',32370.220,257.930,'2025-12-09 16:40:18',0,'Administracion'),
 (28,1,1,'FAC',25,25,'N/C','FAC-25 Rec-25','Ventas','C',255,'','',163.000,262.100,'2025-12-10 14:00:01',0,'Administracion'),
 (29,1,1,'FAC',26,27,'N/C','FAC-26 Rec-27','Ventas','C',252,'','',30.000,262.100,'2025-12-10 14:14:57',0,'Administracion'),
 (30,1,1,'FAC',26,28,'N/C','FAC-26 Rec-28','Ventas','C',252,'','',94.000,262.100,'2025-12-10 14:14:57',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (31,1,1,'FAC',27,30,'N/C','FAC-27 Rec-30','Ventas','C',4,'','',137.000,262.100,'2025-12-10 15:27:51',0,'Administracion'),
 (32,1,12,'APA',6,31,'N/C','APA-0 Rec-31','Apartados','C',117,'','',40.000,262.100,'2025-12-10 19:13:03',0,'Administracion'),
 (33,1,1,'FAC',30,32,'N/C','FAC-30 Rec-32','Ventas','C',250,'','',15.000,262.100,'2025-12-11 09:29:50',0,'Administracion'),
 (34,1,12,'APA',6,33,'N/C','APA-6 Rec-33','Cobranza Apartado','C',117,'','',133.000,265.070,'2025-12-11 16:24:07',0,'Administracion'),
 (35,2,1,'FAC',33,34,'N/C','FAC-33 Rec-34','Ventas','C',4,'','',7497.000,267.750,'2025-12-12 10:09:16',0,'Administracion'),
 (36,8,1,'FAC',34,35,'N/C','FAC-34 Rec-35','Ventas','C',4,'','',8000.000,267.750,'2025-12-12 10:35:12',0,'Administracion'),
 (37,2,1,'FAC',34,36,'N/C','FAC-34 Rec-36','Ventas','C',4,'','',567.630,267.750,'2025-12-12 10:35:12',0,'Administracion'),
 (38,1,1,'FAC',35,37,'N/C','FAC-35 Rec-37','Ventas','C',4,'','',36.000,267.750,'2025-12-12 11:19:35',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (39,2,1,'FAC',36,38,'N/C','FAC-36 Rec-38','Ventas','C',257,'','',19813.500,267.750,'2025-12-12 12:07:51',0,'Administracion'),
 (40,1,12,'APA',3,39,'N/C','APA-3 Rec-39','Cobranza Apartado','C',251,'','',24.000,270.790,'2025-12-13 13:44:13',0,'Administracion'),
 (41,1,1,'FAC',37,40,'N/C','FAC-37 Rec-40','Ventas','C',254,'','',5.000,270.790,'2025-12-13 16:46:05',0,'Administracion'),
 (42,1,12,'APA',7,41,'N/C','APA-0 Rec-41','Apartados','C',58,'','',20.000,270.790,'2025-12-13 17:40:03',0,'Administracion'),
 (43,1,12,'APA',8,42,'N/C','APA-0 Rec-42','Apartados','C',258,'','',20.000,270.790,'2025-12-14 10:17:28',0,'Administracion'),
 (44,2,1,'FAC',38,43,'N/C','FAC-38 Rec-43','Ventas','C',4,'','',1760.140,270.790,'2025-12-14 10:36:04',0,'Administracion'),
 (45,2,1,'FAC',39,44,'N/C','FAC-39 Rec-44','Ventas','C',254,'','',2707.900,270.790,'2025-12-14 11:07:15',0,'Administracion'),
 (46,1,1,'FAC',40,45,'N/C','FAC-40 Rec-45','Ventas','C',259,'','',30.000,270.790,'2025-12-14 12:20:50',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (47,1,12,'APA',9,46,'N/C','APA-0 Rec-46','Apartados','C',260,'','',10.000,270.790,'2025-12-14 12:30:42',0,'Administracion'),
 (48,1,1,'FAC',41,47,'N/C','FAC-41 Rec-47','Ventas','C',261,'','',25.000,270.790,'2025-12-15 13:26:12',0,'Administracion'),
 (49,1,1,'FAC',42,48,'N/C','FAC-42 Rec-48','Ventas','C',262,'','',30.000,270.790,'2025-12-15 14:42:37',0,'Administracion'),
 (50,2,2,'FAC',19,49,'N/C','FAC-19 Rec-49','Cobranza','C',35,'','',2707.900,270.790,'2025-12-15 00:00:00',0,'Administracion'),
 (51,2,2,'FAC',19,50,'N/C','FAC-19 Rec-50','Cobranza','C',35,'','',4061.850,270.790,'2025-12-15 00:00:00',0,'Administracion'),
 (52,2,2,'FAC',31,51,'N/C','FAC-31 Rec-51','Cobranza','C',4,'','',8665.280,270.790,'2025-12-15 00:00:00',0,'Administracion'),
 (53,2,1,'FAC',43,52,'N/C','FAC-43 Rec-52','Ventas','C',263,'','',15164.240,270.790,'2025-12-15 16:38:53',0,'Administracion'),
 (54,2,5,'0',0,0,'TRA','BCO002 00000054','COMPRA DE DOLARES','0',0,'0','0',35275.000,240.000,'2025-12-16 10:10:18',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (55,1,5,'0',0,0,'N/C','TS0000055','COMPRA DE DOLARES','0',0,'0','0',85.000,240.000,'2025-12-16 10:10:18',0,'Administracion'),
 (56,2,2,'FAC',19,53,'N/C','FAC-19 Rec-53','Cobranza','C',35,'','',2765.800,276.580,'2025-12-16 00:00:00',0,'Administracion'),
 (57,1,1,'FAC',44,54,'N/C','FAC-44 Rec-54','Ventas','C',238,'','',29.000,276.580,'2025-12-16 17:45:59',0,'Administracion'),
 (58,1,1,'FAC',45,55,'N/C','FAC-45 Rec-55','Ventas','C',238,'','',20.000,276.580,'2025-12-16 18:03:12',0,'Administracion'),
 (59,2,1,'FAC',46,56,'N/C','FAC-46 Rec-56','Ventas','C',238,'','',7467.660,276.580,'2025-12-16 18:08:09',0,'Administracion'),
 (60,1,1,'FAC',47,57,'N/C','FAC-47 Rec-57','Ventas','C',265,'','',40.000,276.580,'2025-12-16 18:14:55',0,'Administracion'),
 (61,1,12,'APA',7,58,'N/C','APA-7 Rec-58','Cobranza Apartado','C',58,'','',10.000,276.580,'2025-12-16 18:58:09',0,'Administracion'),
 (62,2,1,'FAC',48,59,'N/C','FAC-48 Rec-59','Ventas','C',198,'','',1659.480,276.580,'2025-12-17 15:33:22',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (63,2,12,'APA',10,60,'N/C','APA-0 Rec-60','Apartados','C',198,'','',1659.480,276.580,'2025-12-17 15:59:04',0,'Administracion'),
 (64,1,1,'FAC',49,61,'N/C','FAC-49 Rec-61','Ventas','C',266,'','',15.000,276.580,'2025-12-17 16:26:41',0,'Administracion'),
 (65,1,1,'FAC',50,62,'N/C','FAC-50 Rec-62','Ventas','C',262,'','',30.000,276.580,'2025-12-17 17:41:46',0,'Administracion'),
 (66,2,1,'FAC',51,63,'N/C','FAC-51 Rec-63','Ventas','C',87,'','',7467.660,276.580,'2025-12-17 18:27:15',0,'Administracion'),
 (67,1,1,'FAC',52,64,'N/C','FAC-52 Rec-64','Anul.52Rec64M:79','C',267,'','',0.000,276.580,'2025-12-17 18:34:10',1,'Administracion'),
 (68,1,7,'COMP',7,1,'N/D','COMP-7 Rec-1','Pago COMP','P',5,'','',462.000,276.580,'2025-12-18 00:00:00',0,'Administracion'),
 (69,1,7,'COMP',8,3,'N/D','COMP-8 Rec-3','Pago COMP','P',6,'','',216.000,276.580,'2025-12-18 00:00:00',0,'Administracion'),
 (70,1,4,'GAST',1,4,'N/D','GAST-1 Rec-4','Pago GAST','P',7,'','',40.000,276.580,'2025-12-18 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (71,1,4,'GAST',2,5,'N/D','GAST-2 Rec-5','Pago GAST','P',7,'','',2.000,276.580,'2025-12-18 00:00:00',0,'Administracion'),
 (72,1,1,'FAC',53,65,'N/C','FAC-53 Rec-65','Ventas','C',267,'','',101.000,276.580,'2025-12-18 10:17:33',0,'Administracion'),
 (73,2,1,'FAC',55,66,'N/C','FAC-55 Rec-66','Ventas','C',269,'','',15655.360,279.560,'2025-12-18 12:51:39',0,'Administracion'),
 (74,1,1,'FAC',56,67,'N/C','FAC-56 Rec-67','Ventas','C',270,'','',25.000,279.560,'2025-12-18 14:33:57',0,'Administracion'),
 (75,1,1,'FAC',57,68,'N/C','FAC-57 Rec-68','Ventas','C',271,'','',16.000,279.560,'2025-12-18 16:03:07',0,'Administracion'),
 (76,1,1,'FAC',58,69,'N/C','FAC-58 Rec-69','Ventas','C',265,'','',75.000,279.560,'2025-12-18 16:45:06',0,'Administracion'),
 (77,1,12,'APA',8,70,'N/C','APA-8 Rec-70','Cobranza Apartado','C',258,'','',15.000,279.560,'2025-12-18 16:49:56',0,'Administracion'),
 (78,2,2,'FAC',19,71,'N/C','FAC-19 Rec-71','Cobranza','C',35,'','',2825.100,282.510,'2025-12-19 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (79,1,1,'FAC',59,72,'N/C','FAC-59 Rec-72','Ventas','C',272,'','',15.000,282.510,'2025-12-19 15:20:21',0,'Administracion'),
 (80,2,1,'FAC',60,73,'N/C','FAC-60 Rec-73','Ventas','C',20,'','',17798.130,282.510,'2025-12-19 15:30:08',0,'Administracion'),
 (81,2,1,'FAC',61,74,'N/C','FAC-61 Rec-74','Ventas','C',273,'','',23117.400,285.400,'2025-12-19 17:46:56',0,'Administracion'),
 (82,1,12,'APA',11,75,'N/C','APA-0 Rec-75','Anul.11Rec75M:10','C',239,'','',0.000,285.400,'2025-12-20 14:01:27',1,'Administracion'),
 (83,1,12,'APA',12,76,'N/C','APA-0 Rec-76','Doc. Anul.12Rec76M:10','C',239,'','',0.000,285.400,'2025-12-20 14:11:00',1,'Administracion'),
 (84,1,12,'APA',4,77,'N/C','APA-4 Rec-77','Cobranza Apartado','C',87,'','',10.000,285.400,'2025-12-20 14:17:38',0,'Administracion'),
 (85,1,1,'FAC',62,78,'N/C','FAC-62 Rec-78','Anul.62Rec78M:7','C',236,'','',0.000,285.400,'2025-12-20 15:43:16',1,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (86,2,1,'FAC',63,79,'N/C','FAC-63 Rec-79','Ventas','C',4,'','',2283.200,285.400,'2025-12-20 15:50:53',0,'Administracion'),
 (87,2,1,'FAC',64,80,'N/C','FAC-64 Rec-80','Ventas','C',4,'','',10987.900,285.400,'2025-12-20 15:53:16',0,'Administracion'),
 (88,2,1,'FAC',65,81,'N/C','FAC-65 Rec-81','Ventas','C',4,'','',3424.800,285.400,'2025-12-20 16:35:43',0,'Administracion'),
 (89,1,1,'FAC',66,82,'N/C','FAC-66 Rec-82','Ventas','C',4,'','',20.000,285.400,'2025-12-20 16:51:41',0,'Administracion'),
 (90,1,12,'APA',13,83,'N/C','APA-0 Rec-83','Doc. Anul.13Rec83M:4','C',4,'','',4.000,285.400,'2025-12-20 16:55:02',1,'Administracion'),
 (91,1,1,'FAC',67,84,'N/C','FAC-67 Rec-84','Ventas','C',4,'','',30.000,285.400,'2025-12-20 17:21:59',0,'Administracion'),
 (92,2,1,'FAC',68,85,'N/C','FAC-68 Rec-85','Ventas','C',4,'','',11416.000,285.400,'2025-12-20 17:42:22',0,'Administracion'),
 (93,2,1,'FAC',69,86,'N/C','FAC-69 Rec-86','Ventas','C',4,'','',1855.100,285.400,'2025-12-20 18:18:28',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (94,1,1,'FAC',70,87,'N/C','FAC-70 Rec-87','Ventas','C',274,'','',20.000,285.400,'2025-12-20 18:24:50',0,'Administracion'),
 (95,1,1,'FAC',71,88,'N/C','FAC-71 Rec-88','Ventas','C',4,'','',110.000,285.400,'2025-12-20 18:32:02',0,'Administracion'),
 (96,1,12,'APA',2,89,'N/C','APA-2 Rec-89','Cobranza Apartado','C',4,'','',13.000,285.400,'2025-12-20 18:46:51',0,'Administracion'),
 (97,1,12,'APA',14,91,'N/C','APA-0 Rec-91','Doc. Anul.14Rec91M:5','C',236,'','',5.000,285.400,'2025-12-20 18:57:10',1,'Administracion'),
 (98,1,12,'APA',15,92,'N/C','APA-0 Rec-92','Doc. Anul.15Rec92M:5','C',236,'','',5.000,285.400,'2025-12-20 18:59:47',1,'Administracion'),
 (99,1,12,'APA',16,93,'N/C','APA-0 Rec-93','Apartados','C',239,'','',10.000,285.400,'2025-12-20 19:44:03',0,'Administracion'),
 (100,2,1,'FAC',73,94,'N/C','FAC-73 Rec-94','Ventas','C',131,'','',11416.000,285.400,'2025-12-21 10:37:41',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (101,1,1,'FAC',74,95,'N/C','FAC-74 Rec-95','Ventas','C',4,'','',15.000,285.400,'2025-12-21 10:43:50',0,'Administracion'),
 (102,1,1,'FAC',75,96,'N/C','FAC-75 Rec-96','Ventas','C',238,'','',15.000,285.400,'2025-12-21 10:57:57',0,'Administracion'),
 (103,2,1,'FAC',76,97,'N/C','FAC-76 Rec-97','Ventas','C',275,'','',3710.200,285.400,'2025-12-21 11:11:31',0,'Administracion'),
 (104,2,1,'FAC',77,98,'N/C','FAC-77 Rec-98','Ventas','C',238,'','',13699.200,285.400,'2025-12-21 11:26:29',0,'Administracion'),
 (105,1,1,'FAC',78,99,'N/C','FAC-78 Rec-99','Ventas','C',238,'','',15.000,285.400,'2025-12-21 11:29:09',0,'Administracion'),
 (106,1,1,'FAC',79,100,'N/C','FAC-79 Rec-100','Ventas','C',270,'','',15.000,285.400,'2025-12-21 12:27:58',0,'Administracion'),
 (107,1,4,'GAST',3,6,'N/D','GAST-3 Rec-6','Gastos','P',7,'','',5.000,285.400,'2025-12-21 13:17:42',0,'Administracion'),
 (108,1,1,'FAC',80,101,'N/C','FAC-80 Rec-101','Ventas','C',68,'','',110.000,285.400,'2025-12-22 12:28:06',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (109,2,1,'FAC',82,102,'N/C','FAC-82 Rec-102','Ventas','C',276,'','',19121.800,285.400,'2025-12-22 14:58:19',0,'Administracion'),
 (110,1,1,'FAC',83,103,'N/C','FAC-83 Rec-103','Ventas','C',277,'','',90.000,285.400,'2025-12-22 15:34:36',0,'Administracion'),
 (111,1,1,'FAC',84,104,'N/C','FAC-84 Rec-104','Ventas','C',271,'','',10.000,285.400,'2025-12-22 16:01:41',0,'Administracion'),
 (112,2,1,'FAC',85,105,'N/C','FAC-85 Rec-105','Ventas','C',57,'','',13699.200,285.400,'2025-12-22 16:33:01',0,'Administracion'),
 (113,1,1,'FAC',87,106,'N/C','FAC-87 Rec-106','Ventas','C',273,'','',140.000,285.400,'2025-12-22 16:46:55',0,'Administracion'),
 (114,2,1,'FAC',88,107,'N/C','FAC-88 Rec-107','Ventas','C',13,'','',23745.280,285.400,'2025-12-22 16:51:08',0,'Administracion'),
 (115,1,1,'FAC',89,108,'N/C','FAC-89 Rec-108','Ventas','C',236,'','',4.000,285.400,'2025-12-22 16:51:50',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (116,1,4,'GAST',4,7,'N/D','GAST-4 Rec-7','Gastos','P',7,'','',4.000,285.400,'2025-12-22 16:52:21',0,'Administracion'),
 (117,1,1,'FAC',90,109,'N/C','FAC-90 Rec-109','Ventas','C',279,'','',100.000,288.450,'2025-12-22 17:15:39',0,'Administracion'),
 (118,2,1,'FAC',90,110,'N/C','FAC-90 Rec-110','Ventas','C',279,'','',1442.250,288.450,'2025-12-22 17:15:39',0,'Administracion'),
 (119,1,1,'FAC',92,111,'N/C','FAC-92 Rec-111','Ventas','C',280,'','',25.000,288.450,'2025-12-23 11:48:27',0,'Administracion'),
 (120,2,1,'FAC',93,112,'N/C','FAC-93 Rec-112','Ventas','C',281,'','',18460.800,288.450,'2025-12-23 13:00:01',0,'Administracion'),
 (121,1,1,'FAC',94,113,'N/C','FAC-94 Rec-113','Ventas','C',276,'','',20.000,288.450,'2025-12-23 13:15:56',0,'Administracion'),
 (122,1,1,'FAC',95,114,'N/C','FAC-95 Rec-114','Ventas','C',68,'','',20.000,288.450,'2025-12-23 15:30:52',0,'Administracion'),
 (123,1,1,'FAC',96,115,'N/C','FAC-96 Rec-115','Ventas','C',275,'','',7.000,288.450,'2025-12-23 15:54:09',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (124,1,1,'FAC',97,116,'N/C','FAC-97 Rec-116','Ventas','C',275,'','',1.000,288.450,'2025-12-23 15:55:20',0,'Administracion'),
 (125,2,1,'FAC',98,117,'N/C','FAC-98 Rec-117','Ventas','C',277,'','',1153.800,288.450,'2025-12-23 16:16:54',0,'Administracion'),
 (126,1,12,'APA',16,118,'N/C','APA-16 Rec-118','Cobranza Apartado','C',239,'','',10.000,288.450,'2025-12-23 16:38:52',0,'Administracion'),
 (127,2,1,'FAC',100,119,'N/C','FAC-100 Rec-119','Ventas','C',197,'','',3749.850,288.450,'2025-12-23 18:08:41',0,'Administracion'),
 (128,2,1,'FAC',101,120,'N/C','FAC-101 Rec-120','Ventas','C',13,'','',8653.500,288.450,'2025-12-23 18:38:10',0,'Administracion'),
 (129,3,1,'FAC',102,121,'N/C','FAC-102 Rec-121','Ventas','C',5,'','',20.000,288.450,'2025-12-23 19:11:39',0,'Administracion'),
 (130,1,1,'FAC',103,122,'N/C','FAC-103 Rec-122','Ventas','C',275,'','',4.000,291.350,'2025-12-24 10:10:12',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (131,2,1,'FAC',106,123,'N/C','FAC-106 Rec-123','Ventas','C',221,'','',23308.000,291.350,'2025-12-24 10:39:59',0,'Administracion'),
 (132,1,1,'FAC',107,124,'N/C','FAC-107 Rec-124','Ventas','C',279,'','',20.000,291.350,'2025-12-24 10:42:28',0,'Administracion'),
 (133,2,1,'FAC',109,125,'N/C','FAC-109 Rec-125','Ventas','C',276,'','',16024.250,291.350,'2025-12-24 11:12:20',0,'Administracion'),
 (134,1,12,'APA',9,126,'N/C','APA-9 Rec-126','Cobranza Apartado','C',260,'','',48.000,291.350,'2025-12-24 11:20:00',0,'Administracion'),
 (135,1,1,'FAC',110,127,'N/C','FAC-110 Rec-127','Ventas','C',10,'','',10.000,291.350,'2025-12-24 11:20:21',0,'Administracion'),
 (136,1,1,'FAC',112,128,'N/C','FAC-112 Rec-128','Ventas','C',275,'','',12.000,291.350,'2025-12-24 11:35:08',0,'Administracion'),
 (137,2,1,'FAC',113,129,'N/C','FAC-113 Rec-129','Ventas','C',275,'','',11654.000,291.350,'2025-12-24 13:00:57',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (138,2,1,'FAC',115,130,'N/C','FAC-115 Rec-130','Ventas','C',279,'','',8740.500,291.350,'2025-12-24 13:18:21',0,'Administracion'),
 (139,2,1,'FAC',116,131,'N/C','FAC-116 Rec-131','Ventas','C',276,'','',4370.250,291.350,'2025-12-24 13:29:43',0,'Administracion'),
 (140,2,1,'FAC',117,132,'N/C','FAC-117 Rec-132','Ventas','C',279,'','',11654.000,291.350,'2025-12-24 13:32:24',0,'Administracion'),
 (141,1,1,'FAC',118,133,'N/C','FAC-118 Rec-133','Ventas','C',16,'','',15.000,291.350,'2025-12-24 13:39:59',0,'Administracion'),
 (142,1,2,'FAC',32,134,'N/C','FAC-32 Rec-134','Cobranza','C',95,'','',5.000,291.350,'2025-12-24 00:00:00',0,'Administracion'),
 (143,2,1,'FAC',119,135,'N/C','FAC-119 Rec-135','Ventas','C',277,'','',291.350,291.350,'2025-12-24 13:52:08',0,'Administracion'),
 (144,1,1,'FAC',121,136,'N/C','FAC-121 Rec-136','Ventas','C',276,'','',25.000,291.350,'2025-12-24 14:43:33',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (145,2,1,'FAC',122,137,'N/C','FAC-122 Rec-137','Ventas','C',275,'','',8740.500,291.350,'2025-12-24 14:56:20',0,'Administracion'),
 (146,8,1,'FAC',123,138,'N/C','FAC-123 Rec-138','Ventas','C',277,'','',8740.500,291.350,'2025-12-24 15:13:10',0,'Administracion'),
 (147,2,2,'FAC',19,139,'N/C','FAC-19 Rec-139','Cobranza','C',35,'','',2913.500,291.350,'2025-12-24 00:00:00',0,'Administracion'),
 (148,2,1,'FAC',124,140,'N/C','FAC-124 Rec-140','Ventas','C',275,'','',15150.200,291.350,'2025-12-24 16:22:31',0,'Administracion'),
 (149,2,1,'FAC',125,141,'N/C','FAC-125 Rec-141','Ventas','C',276,'','',3496.200,291.350,'2025-12-24 16:25:35',0,'Administracion'),
 (150,2,2,'FAC',111,142,'N/C','FAC-111 Rec-142','Cobranza','C',63,'','',2913.500,291.350,'2025-12-24 00:00:00',0,'Administracion'),
 (151,1,1,'FAC',126,143,'N/C','FAC-126 Rec-143','Ventas','C',92,'','',6.000,291.350,'2025-12-24 17:45:49',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (152,2,1,'FAC',128,144,'N/C','FAC-128 Rec-144','Ventas','C',276,'','',18937.750,291.350,'2025-12-24 18:32:32',0,'Administracion'),
 (153,2,1,'FAC',129,145,'N/C','FAC-129 Rec-145','Ventas','C',10,'','',10197.250,291.350,'2025-12-24 19:20:39',0,'Administracion'),
 (154,1,1,'FAC',130,146,'N/C','FAC-130 Rec-146','Ventas','C',279,'','',4.000,291.350,'2025-12-26 10:13:25',0,'Administracion'),
 (155,1,1,'FAC',131,147,'N/C','FAC-131 Rec-147','Ventas','C',276,'','',4.000,291.350,'2025-12-26 12:16:43',0,'Administracion'),
 (156,2,2,'FAC',86,148,'N/C','FAC-86 Rec-148','Anul.86Rec148M:20394.5','C',278,'','',0.000,291.350,'2025-12-26 00:00:00',1,'Administracion'),
 (157,2,2,'FAC',86,149,'N/C','FAC-86 Rec-149','Cobranza','C',278,'','',20394.500,291.350,'2025-12-26 00:00:00',0,'Administracion'),
 (158,2,1,'FAC',133,150,'N/C','FAC-133 Rec-150','Ventas','C',282,'','',14684.040,291.350,'2025-12-26 16:31:36',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (159,2,1,'FAC',134,151,'N/C','FAC-134 Rec-151','Ventas','C',282,'','',6409.700,291.350,'2025-12-26 16:38:50',0,'Administracion'),
 (160,2,2,'FAC',19,152,'N/C','FAC-19 Rec-152','Cobranza','C',35,'','',2914.000,291.350,'2025-12-26 00:00:00',0,'Administracion'),
 (161,1,1,'FAC',135,153,'N/C','FAC-135 Rec-153','Ventas','C',89,'','',7.000,294.960,'2025-12-27 12:32:48',0,'Administracion'),
 (162,1,1,'FAC',136,154,'N/C','FAC-136 Rec-154','Ventas','C',83,'','',35.000,294.960,'2025-12-27 15:56:38',0,'Administracion'),
 (163,1,1,'FAC',137,155,'N/C','FAC-137 Rec-155','Ventas','C',280,'','',20.000,294.960,'2025-12-27 18:21:22',0,'Administracion'),
 (164,2,1,'FAC',138,156,'N/C','FAC-138 Rec-156','Ventas','C',151,'','',10618.560,294.960,'2025-12-28 09:40:59',0,'Administracion'),
 (165,8,4,'GAST',5,8,'N/D','GAST-5 Rec-8','Gastos','P',7,'','',6489.120,294.960,'2025-12-28 10:07:14',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (166,8,4,'GAST',6,9,'N/D','GAST-6 Rec-9','Gastos','P',7,'','',2359.680,294.960,'2025-12-28 10:08:00',0,'Administracion'),
 (167,8,4,'GAST',7,10,'N/D','GAST-7 Rec-10','Gastos','P',7,'','',2359.680,294.960,'2025-12-28 10:08:40',0,'Administracion'),
 (168,1,1,'FAC',139,157,'N/C','FAC-139 Rec-157','Ventas','C',247,'','',13.000,294.960,'2025-12-28 14:17:24',0,'Administracion'),
 (169,1,1,'FAC',140,158,'N/C','FAC-140 Rec-158','Anul.140Rec158M:18','C',33,'','',0.000,294.960,'2025-12-29 11:54:09',1,'Administracion'),
 (170,1,2,'FAC',81,159,'N/C','FAC-81 Rec-159','Cobranza','C',268,'','',44.500,294.960,'2025-12-29 00:00:00',0,'Administracion'),
 (171,1,1,'FAC',141,160,'N/C','FAC-141 Rec-160','Ventas','C',75,'','',40.000,294.960,'2025-12-29 13:54:45',0,'Administracion'),
 (172,1,1,'FAC',142,161,'N/C','FAC-142 Rec-161','Ventas','C',4,'','',20.000,294.960,'2025-12-29 14:20:31',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (173,1,1,'FAC',143,162,'N/C','FAC-143 Rec-162','Ventas','C',4,'','',10.000,294.960,'2025-12-29 14:23:44',0,'Administracion'),
 (174,1,1,'FAC',144,163,'N/C','FAC-144 Rec-163','Ventas','C',4,'','',25.000,294.960,'2025-12-29 15:20:13',0,'Administracion'),
 (175,2,1,'FAC',145,164,'N/C','FAC-145 Rec-164','Ventas','C',283,'','',14748.000,294.960,'2025-12-29 15:29:04',0,'Administracion'),
 (176,1,12,'APA',10,165,'N/C','APA-10 Rec-165','Cobranza Apartado','C',198,'','',10.000,294.960,'2025-12-29 16:15:56',0,'Administracion'),
 (177,1,1,'FAC',146,167,'N/C','FAC-146 Rec-167','Ventas','C',4,'','',25.000,294.960,'2025-12-29 17:10:31',0,'Administracion'),
 (178,2,1,'FAC',148,168,'N/C','FAC-148 Rec-168','Ventas','C',284,'','',11031.180,298.140,'2025-12-30 10:36:06',0,'Administracion'),
 (179,1,1,'FAC',150,169,'N/C','FAC-150 Rec-169','Ventas','C',4,'','',28.000,298.140,'2025-12-30 12:10:26',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (180,2,1,'FAC',151,170,'N/C','FAC-151 Rec-170','Ventas','C',63,'','',8944.200,298.140,'2025-12-30 12:47:35',0,'Administracion'),
 (181,1,1,'FAC',152,171,'N/C','FAC-152 Rec-171','Ventas','C',4,'','',25.000,298.140,'2025-12-30 13:48:12',0,'Administracion'),
 (182,1,12,'APA',16,172,'N/C','APA-16 Rec-172','Cobranza Apartado','C',239,'','',15.000,298.140,'2025-12-30 14:44:41',0,'Administracion'),
 (183,1,1,'FAC',153,173,'N/C','FAC-153 Rec-173','Ventas','C',4,'','',10.000,298.140,'2025-12-30 15:29:52',0,'Administracion'),
 (184,1,1,'FAC',154,174,'N/C','FAC-154 Rec-174','Ventas','C',285,'','',67.000,298.140,'2025-12-30 16:08:38',0,'Administracion'),
 (185,2,1,'FAC',155,175,'N/C','FAC-155 Rec-175','Ventas','C',156,'','',4472.100,298.140,'2025-12-30 16:25:20',0,'Administracion'),
 (186,2,1,'FAC',157,176,'N/C','FAC-157 Rec-176','Ventas','C',4,'','',9041.100,301.370,'2025-12-30 18:00:14',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (187,2,1,'FAC',158,177,'N/C','FAC-158 Rec-177','Ventas','C',287,'','',9051.000,301.370,'2025-12-30 19:36:41',0,'Administracion'),
 (188,2,2,'FAC',105,178,'N/C','FAC-105 Rec-178','Cobranza','C',237,'','',5068.380,0.000,'2025-12-30 19:37:25',0,'Administracion'),
 (189,2,2,'FAC',114,179,'N/C','FAC-114 Rec-179','Cobranza','C',237,'','',5962.800,0.000,'2025-12-30 19:37:25',0,'Administracion'),
 (190,2,2,'FAC',127,180,'N/C','FAC-127 Rec-180','Cobranza','C',237,'','',18782.820,0.000,'2025-12-30 19:37:25',0,'Administracion'),
 (191,1,1,'FAC',159,181,'N/C','FAC-159 Rec-181','Anul.159Rec181M:65','C',282,'','',0.000,301.370,'2025-12-30 19:47:29',1,'Administracion'),
 (192,1,4,'GAST',8,11,'N/D','GAST-8 Rec-11','Gastos','P',7,'','',5.000,301.370,'2025-12-30 19:48:28',0,'Administracion'),
 (193,1,1,'FAC',161,182,'N/C','FAC-161 Rec-182','Ventas','C',4,'','',5.000,301.370,'2025-12-31 09:30:43',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (194,1,1,'FAC',162,183,'N/C','FAC-162 Rec-183','Ventas','C',288,'','',34.000,301.370,'2025-12-31 09:55:14',0,'Administracion'),
 (195,2,1,'FAC',163,184,'N/C','FAC-163 Rec-184','Ventas','C',289,'','',18102.000,301.370,'2025-12-31 10:21:21',0,'Administracion'),
 (196,1,1,'FAC',164,185,'N/C','FAC-164 Rec-185','Ventas','C',4,'','',15.000,301.370,'2025-12-31 10:22:40',0,'Administracion'),
 (197,2,1,'FAC',165,186,'N/C','FAC-165 Rec-186','Ventas','C',238,'','',6034.000,301.370,'2025-12-31 10:27:38',0,'Administracion'),
 (198,2,1,'FAC',166,187,'N/C','FAC-166 Rec-187','Anul.166Rec187M:15','C',238,'','',0.000,301.370,'2025-12-31 10:29:55',1,'Administracion'),
 (199,1,1,'FAC',167,188,'N/C','FAC-167 Rec-188','Ventas','C',282,'','',65.000,301.370,'2025-12-31 10:38:24',0,'Administracion'),
 (200,2,1,'FAC',168,189,'N/C','FAC-168 Rec-189','Ventas','C',125,'','',4525.500,301.370,'2025-12-31 10:59:18',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (201,2,1,'FAC',169,190,'N/C','FAC-169 Rec-190','Ventas','C',238,'','',7534.250,301.370,'2025-12-31 11:03:44',0,'Administracion'),
 (202,2,1,'FAC',170,191,'N/C','FAC-170 Rec-191','Ventas','C',238,'','',2109.590,301.370,'2025-12-31 11:10:15',0,'Administracion'),
 (203,2,2,'FAC',19,192,'N/C','FAC-19 Rec-192','Cobranza','C',35,'','',1808.220,301.370,'2025-12-31 00:00:00',0,'Administracion'),
 (204,2,1,'FAC',171,193,'N/C','FAC-171 Rec-193','Ventas','C',238,'','',4520.550,301.370,'2025-12-31 11:31:35',0,'Administracion'),
 (205,2,1,'FAC',172,194,'N/C','FAC-172 Rec-194','Ventas','C',238,'','',6027.400,301.370,'2025-12-31 11:43:31',0,'Administracion'),
 (206,1,1,'FAC',173,195,'N/C','FAC-173 Rec-195','Ventas','C',238,'','',25.000,301.370,'2025-12-31 11:44:49',0,'Administracion'),
 (207,2,1,'FAC',174,196,'N/C','FAC-174 Rec-196','Ventas','C',238,'','',7534.250,301.370,'2025-12-31 11:46:27',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (208,2,1,'FAC',175,197,'N/C','FAC-175 Rec-197','Ventas','C',238,'','',7835.620,301.370,'2025-12-31 11:49:40',0,'Administracion'),
 (209,1,1,'FAC',176,198,'N/C','FAC-176 Rec-198','Ventas','C',238,'','',4.000,301.370,'2025-12-31 11:53:20',0,'Administracion'),
 (210,2,1,'FAC',177,199,'N/C','FAC-177 Rec-199','Ventas','C',238,'','',2109.590,301.370,'2025-12-31 11:55:14',0,'Administracion'),
 (211,2,1,'FAC',178,200,'N/C','FAC-178 Rec-200','Anul.178Rec200M:20','C',287,'','',0.000,301.370,'2025-12-31 12:47:55',1,'Administracion'),
 (212,1,1,'FAC',179,201,'N/C','FAC-179 Rec-201','Ventas','C',238,'','',30.000,301.370,'2025-12-31 12:54:24',0,'Administracion'),
 (213,2,2,'FAC',132,202,'N/C','FAC-132 Rec-202','Cobranza','C',134,'','',18500.720,0.000,'2026-01-10 13:11:27',0,'Administracion'),
 (214,2,1,'FAC',180,203,'N/C','FAC-180 Rec-203','Ventas','C',287,'','',6034.000,330.370,'2026-01-13 16:53:58',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (215,1,1,'FAC',181,204,'N/C','FAC-181 Rec-204','Ventas','C',285,'','',10.000,330.370,'2026-01-13 17:01:59',0,'Administracion'),
 (216,1,1,'FAC',182,205,'N/C','FAC-182 Rec-205','Ventas','C',290,'','',25.000,341.740,'2026-01-17 14:57:51',0,'Administracion'),
 (217,2,2,'FAC',86,206,'N/C','FAC-86 Rec-206','Cobranza','C',278,'','',17225.360,0.000,'2026-01-17 17:02:41',0,'Administracion'),
 (218,1,1,'FAC',183,207,'N/C','FAC-183 Rec-207','Ventas','C',4,'','',10.000,344.510,'2026-01-18 11:24:38',0,'Administracion'),
 (219,2,1,'FAC',184,208,'N/C','FAC-184 Rec-208','Ventas','C',291,'','',10001.090,347.260,'2026-01-21 17:09:35',0,'Administracion'),
 (220,1,1,'FAC',185,209,'N/C','FAC-185 Rec-209','Ventas','C',291,'','',42.000,347.260,'2026-01-21 17:14:17',0,'Administracion'),
 (221,2,1,'FAC',186,210,'N/C','FAC-186 Rec-210','Ventas','C',292,'','',16796.640,349.930,'2026-01-22 11:48:58',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (222,1,1,'FAC',187,211,'N/C','FAC-187 Rec-211','Ventas','C',38,'','',18.000,349.930,'2026-01-22 14:49:26',0,'Administracion'),
 (223,1,2,'FAC',127,212,'N/C','FAC-127 Rec-212','Cobranza','C',237,'','',2.000,0.000,'2026-01-22 14:50:10',0,'Administracion'),
 (224,1,1,'FAC',188,213,'N/C','FAC-188 Rec-213','Ventas','C',294,'','',20.000,355.550,'2026-01-24 09:42:18',0,'Administracion'),
 (225,1,12,'APA',17,214,'N/C','APA-0 Rec-214','Apartados','C',295,'','',5.000,355.550,'2026-01-24 11:36:24',0,'Administracion'),
 (226,2,1,'FAC',189,215,'N/C','FAC-189 Rec-215','Ventas','C',287,'','',2311.080,355.550,'2026-01-24 14:43:14',0,'Administracion'),
 (227,2,1,'FAC',190,216,'N/C','FAC-190 Rec-216','Ventas','C',279,'','',5688.800,355.550,'2026-01-24 15:16:14',0,'Administracion'),
 (228,1,1,'FAC',191,217,'N/C','FAC-191 Rec-217','Ventas','C',237,'','',15.000,358.920,'2026-01-27 10:32:27',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (229,1,4,'GAST',9,12,'N/D','GAST-9 Rec-12','Gastos','P',7,'','',72.000,370.250,'2026-01-31 13:05:17',0,'Administracion'),
 (230,1,1,'FAC',192,218,'N/C','FAC-192 Rec-218','Ventas','C',4,'','',10.000,372.100,'2026-02-03 09:34:07',0,'Administracion'),
 (231,1,1,'FAC',193,219,'N/C','FAC-193 Rec-219','Ventas','C',296,'','',21.000,372.100,'2026-02-03 18:03:39',0,'Administracion'),
 (232,2,1,'FAC',194,220,'N/C','FAC-194 Rec-220','Ventas','C',4,'','',26113.050,378.450,'2026-02-05 11:18:41',0,'Administracion'),
 (233,1,1,'FAC',195,221,'N/C','FAC-195 Rec-221','Ventas','C',289,'','',15.000,378.450,'2026-02-05 17:33:57',0,'Administracion'),
 (234,1,12,'APA',17,222,'N/C','APA-17 Rec-222','Cobranza Apartado','C',295,'','',10.000,381.110,'2026-02-07 10:01:50',0,'Administracion'),
 (235,2,1,'FAC',196,223,'N/C','FAC-196 Rec-223','Ventas','C',292,'','',13484.450,385.270,'2026-02-10 11:28:11',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (236,3,4,'GAST',10,13,'N/D','GAST-10 Rec-13','Gastos','P',7,'','',1.000,388.740,'2026-02-11 17:36:00',0,'Administracion'),
 (237,1,2,'FAC',127,224,'N/C','FAC-127 Rec-224','Cobranza','C',237,'','',2.000,388.740,'2026-02-12 00:00:00',0,'Administracion'),
 (238,1,1,'FAC',198,225,'N/C','FAC-198 Rec-225','Ventas','C',298,'','',15.000,390.290,'2026-02-12 16:42:18',0,'Administracion'),
 (239,1,1,'FAC',199,226,'N/C','FAC-199 Rec-226','Ventas','C',156,'','',20.000,530.000,'2026-02-12 17:53:50',0,'Administracion'),
 (240,2,1,'FAC',199,227,'N/C','FAC-199 Rec-227','Ventas','C',156,'','',2650.000,530.000,'2026-02-12 17:53:50',0,'Administracion'),
 (241,1,1,'FAC',201,228,'N/C','FAC-201 Rec-228','Ventas','C',216,'','',10.000,396.370,'2026-02-14 13:04:13',0,'Administracion'),
 (242,1,4,'GAST',11,14,'N/D','GAST-11 Rec-14','Gastos','P',7,'','',1.000,396.370,'2026-02-18 12:32:22',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (243,2,4,'GAST',12,15,'N/D','GAST-12 Rec-15','Gastos','P',9,'','',51528.100,396.370,'2026-02-18 12:33:32',0,'Administracion'),
 (244,2,4,'GAST',13,16,'N/D','GAST-13 Rec-16','Gastos','P',7,'','',29727.750,396.370,'2026-02-18 12:33:58',0,'Administracion'),
 (245,2,4,'GAST',14,17,'N/D','GAST-14 Rec-17','Gastos','P',7,'','',29727.750,396.370,'2026-02-18 12:35:01',0,'Administracion'),
 (246,1,12,'APA',18,229,'N/C','APA-0 Rec-229','Apartados','C',299,'','',20.000,396.370,'2026-02-18 14:07:58',0,'Administracion'),
 (247,1,1,'FAC',203,230,'N/C','FAC-203 Rec-230','Ventas','C',300,'','',10.000,402.330,'2026-02-20 15:01:39',0,'Administracion'),
 (248,1,1,'FAC',205,231,'N/C','FAC-205 Rec-231','Ventas','C',301,'','',25.000,405.350,'2026-02-21 11:40:38',0,'Administracion'),
 (249,1,1,'FAC',206,232,'N/C','FAC-206 Rec-232','Ventas','C',302,'','',25.000,405.350,'2026-02-21 17:04:42',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (250,1,2,'FAC',204,233,'N/C','FAC-204 Rec-233','Cobranza','C',16,'','',27.000,405.350,'2026-02-21 00:00:00',0,'Administracion'),
 (251,1,4,'GAST',15,18,'N/D','GAST-15 Rec-18','Gastos','P',7,'','',20.000,407.380,'2026-02-24 16:37:35',0,'Administracion'),
 (252,1,4,'GAST',16,19,'N/D','GAST-16 Rec-19','Gastos','P',7,'','',20.000,411.080,'2026-02-25 10:13:11',0,'Administracion'),
 (253,1,1,'FAC',208,234,'N/C','FAC-208 Rec-234','Ventas','C',5,'','',15.000,417.360,'2026-02-27 15:02:43',0,'Administracion'),
 (254,1,4,'GAST',18,20,'N/D','GAST-18 Rec-20','Gastos','P',7,'','',15.000,417.360,'2026-02-27 15:03:18',0,'Administracion'),
 (255,1,1,'FAC',209,235,'N/C','FAC-209 Rec-235','Ventas','C',179,'','',5.000,421.880,'2026-03-03 10:35:09',0,'Administracion'),
 (256,1,1,'FAC',210,236,'N/C','FAC-210 Rec-236','Ventas','C',57,'','',2.000,425.670,'2026-03-04 14:30:41',0,'Administracion'),
 (257,1,4,'GAST',19,21,'N/D','GAST-19 Rec-21','Gastos','P',9,'','',62.000,427.930,'2026-03-05 14:05:25',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (258,1,1,'FAC',213,237,'N/C','FAC-213 Rec-237','Ventas','C',300,'','',30.000,433.170,'2026-03-07 14:18:27',0,'Administracion'),
 (259,1,4,'GAST',20,22,'N/D','GAST-20 Rec-22','Gastos','P',7,'','',59.000,433.170,'2026-03-07 14:36:03',0,'Administracion'),
 (260,1,4,'GAST',21,23,'N/D','GAST-21 Rec-23','Gastos','P',7,'','',50.000,433.170,'2026-03-07 17:49:32',0,'Administracion'),
 (261,1,7,'COMP',5,24,'N/D','COMP-5 Rec-24','Pago COMP','P',4,'','',923.000,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (262,1,7,'COMP',9,25,'N/D','COMP-9 Rec-25','Pago COMP','P',5,'','',917.100,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (263,1,7,'COMP',2,26,'N/D','COMP-2 Rec-26','Pago COMP','P',2,'','',308.000,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (264,1,7,'COMP',3,27,'N/D','COMP-3 Rec-27','Pago COMP','P',3,'','',24.900,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (265,2,7,'COMP',4,28,'N/D','COMP-4 Rec-28','Pago COMP','P',3,'','',319720.000,433.170,'2026-03-07 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (266,2,7,'COMP',10,29,'N/D','COMP-10 Rec-29','Pago COMP','P',3,'','',31535.000,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (267,2,7,'COMP',11,30,'N/D','COMP-11 Rec-30','Pago COMP','P',3,'','',345995.000,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (268,2,7,'COMP',6,31,'N/D','COMP-6 Rec-31','Pago COMP','P',3,'','',8016.000,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (269,1,7,'COMP',3,32,'N/D','COMP-3 Rec-32','Pago COMP','P',3,'','',481.500,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (270,1,2,'FAC',8,239,'N/C','FAC-8 Rec-239','Cobranza','C',112,'','',186.500,0.000,'2026-03-07 18:07:04',0,'Administracion'),
 (271,1,2,'FAC',91,240,'N/C','FAC-91 Rec-240','Cobranza','C',112,'','',100.000,0.000,'2026-03-07 18:07:04',0,'Administracion'),
 (272,1,2,'FAC',108,241,'N/C','FAC-108 Rec-241','Cobranza','C',112,'','',195.000,0.000,'2026-03-07 18:07:04',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (273,1,2,'FAC',28,242,'N/C','FAC-28 Rec-242','Cobranza','C',236,'','',35.000,0.000,'2026-03-07 18:09:17',0,'Administracion'),
 (274,1,2,'FAC',29,243,'N/C','FAC-29 Rec-243','Cobranza','C',236,'','',15.000,0.000,'2026-03-07 18:09:17',0,'Administracion'),
 (275,1,2,'FAC',72,244,'N/C','FAC-72 Rec-244','Cobranza','C',236,'','',4.000,0.000,'2026-03-07 18:09:17',0,'Administracion'),
 (276,1,7,'COMP',3,33,'N/D','COMP-3 Rec-33','Pago COMP','P',3,'','',54.000,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (277,1,7,'COMP',3,34,'N/D','COMP-3 Rec-34','Pago COMP','P',3,'','',19.000,433.170,'2026-03-07 00:00:00',0,'Administracion'),
 (278,1,1,'FAC',214,245,'N/C','FAC-214 Rec-245','Ventas','C',220,'','',35.000,433.170,'2026-03-07 18:34:11',0,'Administracion'),
 (279,1,2,'FAC',212,246,'N/C','FAC-212 Rec-246','Anul.212Rec246M:45','C',303,'','',0.000,433.170,'2026-03-10 00:00:00',1,'Administracion'),
 (280,1,2,'FAC',14,247,'N/C','FAC-14 Rec-247','Anul.14Rec247M:34','C',253,'','',0.000,0.000,'2026-03-10 10:52:36',1,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (281,1,2,'FAC',160,248,'N/C','FAC-160 Rec-248','Anul.160Rec248M:30','C',253,'','',0.000,0.000,'2026-03-10 10:52:36',1,'Administracion'),
 (282,1,2,'FAC',14,249,'N/C','FAC-14 Rec-249','Anul.14Rec249M:25','C',253,'','',0.000,433.170,'2026-03-10 00:00:00',1,'Administracion'),
 (283,1,2,'FAC',212,250,'N/C','FAC-212 Rec-250','Anul.212Rec250M:45','C',303,'','',0.000,433.170,'2026-03-10 00:00:00',1,'Administracion'),
 (284,1,2,'FAC',14,251,'N/C','FAC-14 Rec-251','Anul.14Rec251M:34','C',253,'','',0.000,0.000,'2026-03-10 11:21:54',1,'Administracion'),
 (285,1,2,'FAC',160,252,'N/C','FAC-160 Rec-252','Anul.160Rec252M:21','C',253,'','',0.000,0.000,'2026-03-10 11:21:54',1,'Administracion'),
 (286,1,12,'APA',18,253,'N/C','APA-18 Rec-253','Cobranza Apartado','C',299,'','',5.000,433.170,'2026-03-10 11:34:28',0,'Administracion'),
 (287,2,2,'FAC',160,254,'N/C','FAC-160 Rec-254','Cobranza','C',253,'','',9051.000,433.170,'2025-12-31 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (288,1,2,'FAC',14,255,'N/C','FAC-14 Rec-255','Cobranza','C',253,'','',34.000,433.170,'2026-03-10 00:00:00',0,'Administracion'),
 (289,1,2,'FAC',212,256,'N/C','FAC-212 Rec-256','Cobranza','C',303,'','',45.000,433.170,'2026-03-10 00:00:00',0,'Administracion'),
 (290,1,2,'FAC',197,257,'N/C','FAC-197 Rec-257','Cobranza','C',297,'','',10.000,436.240,'2026-03-10 00:00:00',0,'Administracion'),
 (291,1,1,'FAC',216,259,'N/C','FAC-216 Rec-259','Ventas','C',206,'','',5.000,436.240,'2026-03-10 16:01:34',0,'Administracion'),
 (292,1,1,'FAC',218,260,'N/C','FAC-218 Rec-260','Ventas','C',156,'','',25.000,440.970,'2026-03-12 12:10:39',0,'Administracion'),
 (293,2,2,'FAC',86,261,'N/C','FAC-86 Rec-261','Cobranza','C',278,'','',4468.000,446.800,'2026-03-14 00:00:00',0,'Administracion'),
 (294,2,2,'FAC',201,262,'N/C','FAC-201 Rec-262','Cobranza','C',216,'','',6200.000,620.000,'2026-03-14 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (295,2,2,'FAC',149,263,'N/C','FAC-149 Rec-263','Cobranza','C',278,'','',15638.000,446.800,'2026-03-14 00:00:00',0,'Administracion'),
 (296,1,2,'FAC',32,264,'N/C','FAC-32 Rec-264','Cobranza','C',95,'','',8.000,446.800,'2026-03-14 00:00:00',0,'Administracion'),
 (297,1,1,'FAC',220,265,'N/C','FAC-220 Rec-265','Ventas','C',304,'','',25.000,455.250,'2026-03-19 16:13:33',0,'Administracion'),
 (298,2,1,'FAC',221,266,'N/C','FAC-221 Rec-266','Ventas','C',4,'','',8007.850,455.250,'2026-03-19 16:36:39',0,'Administracion'),
 (299,1,1,'FAC',222,267,'N/C','FAC-222 Rec-267','Ventas','C',106,'','',34.000,455.250,'2026-03-19 16:44:44',0,'Administracion'),
 (300,2,4,'GAST',22,35,'N/D','GAST-22 Rec-35','Gastos','P',9,'','',59182.500,455.250,'2026-03-19 16:57:36',0,'Administracion'),
 (301,2,4,'GAST',23,36,'N/D','GAST-23 Rec-36','Gastos','P',7,'','',34143.750,455.250,'2026-03-19 16:58:58',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (302,1,1,'FAC',223,268,'N/C','FAC-223 Rec-268','Ventas','C',216,'','',5.000,455.250,'2026-03-19 17:26:54',0,'Administracion'),
 (303,1,1,'FAC',224,269,'N/C','FAC-224 Rec-269','Ventas','C',4,'','',12.000,457.080,'2026-03-22 11:21:24',0,'Administracion'),
 (304,2,1,'FAC',225,270,'N/C','FAC-225 Rec-270','Ventas','C',305,'','',11824.660,457.080,'2026-03-22 12:55:26',0,'Administracion'),
 (305,1,1,'0',0,0,'N/C','BCO001 00000305','sobrante de dinero','V',3,'LISETH CONTRERAS','30685899',19.000,240.000,'2026-03-24 00:00:00',0,'Administracion'),
 (306,1,1,'FAC',226,271,'N/C','FAC-226 Rec-271','Ventas','C',300,'','',32.000,462.660,'2026-03-25 12:31:42',0,'Administracion'),
 (307,1,1,'FAC',227,272,'N/C','FAC-227 Rec-272','Ventas','C',306,'','',25.000,466.600,'2026-03-26 09:35:25',0,'Administracion'),
 (308,1,1,'FAC',228,273,'N/C','FAC-228 Rec-273','Ventas','C',12,'','',30.000,466.600,'2026-03-26 15:34:07',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (309,1,1,'FAC',229,274,'N/C','FAC-229 Rec-274','Ventas','C',12,'','',5.000,466.600,'2026-03-26 15:43:50',0,'Administracion'),
 (310,1,1,'FAC',231,275,'N/C','FAC-231 Rec-275','Ventas','C',4,'','',35.000,468.510,'2026-03-27 13:55:17',0,'Administracion'),
 (311,2,1,'FAC',232,276,'N/C','FAC-232 Rec-276','Ventas','C',300,'','',15845.010,468.510,'2026-03-27 16:47:53',0,'Administracion'),
 (312,1,1,'FAC',233,277,'N/C','FAC-233 Rec-277','Ventas','C',252,'','',20.000,471.700,'2026-03-29 12:19:38',0,'Administracion'),
 (313,1,12,'APA',19,278,'N/C','APA-0 Rec-278','Apartados','C',239,'','',5.000,473.870,'2026-03-31 16:06:14',0,'Administracion'),
 (314,8,1,'FAC',235,279,'N/C','FAC-235 Rec-279','Ventas','C',307,'','',7814.940,473.920,'2026-04-01 11:41:51',0,'Administracion'),
 (315,1,1,'FAC',236,280,'N/C','FAC-236 Rec-280','Ventas','C',58,'','',15.000,473.920,'2026-04-01 12:06:01',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (316,1,1,'FAC',237,281,'N/C','FAC-237 Rec-281','Ventas','C',12,'','',12.000,473.920,'2026-04-01 17:54:31',0,'Administracion'),
 (317,8,4,'GAST',24,37,'N/D','GAST-24 Rec-37','Gastos','P',7,'','',370.000,370.000,'2026-04-04 11:21:17',0,'Administracion'),
 (318,1,4,'GAST',25,38,'N/D','GAST-25 Rec-38','Gastos','P',7,'','',50.000,474.060,'2026-04-04 11:26:24',0,'Administracion'),
 (319,1,1,'FAC',238,282,'N/C','FAC-238 Rec-282','Ventas','C',308,'','',23.000,474.060,'2026-04-04 14:13:36',0,'Administracion'),
 (320,8,4,'GAST',26,39,'N/D','GAST-26 Rec-39','Gastos','P',7,'','',4275.090,475.010,'2026-04-08 13:53:38',0,'Administracion'),
 (321,8,4,'GAST',27,40,'N/D','GAST-27 Rec-40','Gastos','P',7,'','',760.020,475.010,'2026-04-08 15:55:26',0,'Administracion'),
 (322,1,1,'FAC',239,283,'N/C','FAC-239 Rec-283','Ventas','C',4,'','',25.000,475.960,'2026-04-09 14:30:52',0,'Administracion'),
 (323,1,4,'GAST',28,41,'N/D','GAST-28 Rec-41','Gastos','P',7,'','',25.000,475.960,'2026-04-09 14:34:32',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (324,8,4,'GAST',29,42,'N/D','GAST-29 Rec-42','Gastos','P',7,'','',1429.290,476.430,'2026-04-10 10:18:21',0,'Administracion'),
 (325,2,2,'FAC',86,284,'N/C','FAC-86 Rec-284','Cobranza','C',278,'','',7146.450,0.000,'2026-04-10 14:23:45',0,'Administracion'),
 (326,2,2,'FAC',149,285,'N/C','FAC-149 Rec-285','Cobranza','C',278,'','',9052.170,0.000,'2026-04-10 14:23:45',0,'Administracion'),
 (327,2,1,'FAC',240,286,'N/C','FAC-240 Rec-286','Ventas','C',38,'','',19057.200,476.430,'2026-04-10 14:52:54',0,'Administracion'),
 (328,2,1,'FAC',241,287,'N/C','FAC-241 Rec-287','Ventas','C',309,'','',9543.000,477.150,'2026-04-11 12:24:19',0,'Administracion'),
 (329,1,1,'FAC',242,288,'N/C','FAC-242 Rec-288','Ventas','C',310,'','',15.000,477.630,'2026-04-14 09:42:47',0,'Administracion'),
 (330,1,1,'FAC',243,289,'N/C','FAC-243 Rec-289','Ventas','C',311,'','',67.000,478.580,'2026-04-15 11:17:04',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (331,1,1,'FAC',244,290,'N/C','FAC-244 Rec-290','Anul.244Rec290M:5','C',312,'','',0.000,478.580,'2026-04-15 14:16:12',1,'Administracion'),
 (332,2,1,'FAC',244,291,'N/C','FAC-244 Rec-291','Anul.244Rec291M:8.1','C',312,'','',0.000,478.580,'2026-04-15 14:16:12',1,'Administracion'),
 (333,1,12,'APA',20,292,'N/C','APA-0 Rec-292','Doc. Anul.20Rec292M:3','C',312,'','',3.000,478.580,'2026-04-15 14:27:02',1,'Administracion'),
 (334,1,2,'FAC',223,293,'N/C','FAC-223 Rec-293','Cobranza','C',216,'','',10.000,478.580,'2026-04-16 00:00:00',0,'Administracion'),
 (335,1,1,'FAC',245,294,'N/C','FAC-245 Rec-294','Ventas','C',292,'','',25.000,480.260,'2026-04-17 11:52:31',0,'Administracion'),
 (336,2,1,'FAC',246,295,'N/C','FAC-246 Rec-295','Ventas','C',292,'','',12400.310,480.260,'2026-04-17 11:55:55',0,'Administracion'),
 (337,1,4,'GAST',30,43,'N/D','GAST-30 Rec-43','Gastos','P',7,'','',60.000,480.260,'2026-04-17 13:36:21',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (338,1,4,'GAST',31,44,'N/D','GAST-31 Rec-44','Gastos','P',9,'','',104.000,480.260,'2026-04-17 13:38:01',0,'Administracion'),
 (339,1,4,'GAST',32,45,'N/D','GAST-32 Rec-45','Gastos','P',7,'','',50.000,480.260,'2026-04-17 16:59:00',0,'Administracion'),
 (340,1,2,'FAC',217,296,'N/C','FAC-217 Rec-296','Cobranza','C',297,'','',20.000,480.260,'2026-04-17 00:00:00',0,'Administracion'),
 (341,1,1,'FAC',247,297,'N/C','FAC-247 Rec-297','Ventas','C',89,'','',25.000,481.220,'2026-04-18 11:23:07',0,'Administracion'),
 (342,1,2,'FAC',211,298,'N/C','FAC-211 Rec-298','Cobranza','C',57,'','',45.000,481.220,'2026-04-19 00:00:00',0,'Administracion'),
 (343,1,1,'FAC',248,299,'N/C','FAC-248 Rec-299','Ventas','C',232,'','',20.000,482.760,'2026-04-22 16:17:18',0,'Administracion'),
 (344,1,4,'GAST',33,46,'N/D','GAST-33 Rec-46','Gastos','P',7,'','',20.000,483.340,'2026-04-23 10:24:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (345,1,12,'APA',21,300,'N/C','APA-21 Rec-300','Doc. Anul.21Rec300M:15','C',38,'','',15.000,483.870,'2026-04-24 09:38:15',1,'Administracion'),
 (346,1,12,'APA',22,301,'N/C','APA-22 Rec-301','Anul.22Rec301M:18','C',38,'','',0.000,483.870,'2026-04-24 09:43:17',1,'Administracion'),
 (347,2,1,'FAC',250,302,'N/C','FAC-250 Rec-302','Ventas','C',57,'','',2511.290,483.870,'2026-04-24 11:39:27',0,'Administracion'),
 (348,2,1,'FAC',264,303,'N/C','FAC-264 Rec-303','Ventas','C',1,'','',3141.120,484.740,'2026-04-25 11:57:25',0,'Administracion'),
 (349,1,1,'FAC',265,304,'N/C','FAC-265 Rec-304','Ventas','C',314,'','',38.000,484.740,'2026-04-25 15:57:24',0,'Administracion'),
 (350,1,12,'APA',19,305,'N/C','APA-19 Rec-305','Cobranza Apartado','C',239,'','',10.000,484.740,'2026-04-25 16:05:25',0,'Administracion'),
 (351,2,1,'FAC',266,306,'N/C','FAC-266 Rec-306','Ventas','C',212,'','',7542.550,484.740,'2026-04-25 16:12:13',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (352,1,1,'FAC',267,307,'N/C','FAC-267 Rec-307','Ventas','C',306,'','',20.000,630.000,'2026-04-25 16:19:54',0,'Administracion'),
 (353,2,1,'FAC',267,308,'N/C','FAC-267 Rec-308','Ventas','C',306,'','',3150.000,630.000,'2026-04-25 16:19:54',0,'Administracion'),
 (354,3,13,'0',0,0,'N/D','BCO006 00000354','AJUSTE DE SALDO','C',236,'KELLY ANDRADE CLIENTE','25720023',19.000,240.000,'2026-04-25 00:00:00',0,'Administracion'),
 (355,8,4,'GAST',34,47,'N/D','GAST-34 Rec-47','Gastos','P',7,'','',1749.910,484.740,'2026-04-25 17:14:36',0,'Administracion'),
 (356,8,13,'0',0,0,'N/D','BCO004 00000356','saldo','C',236,'KELLY ANDRADE CLIENTE','25720023',4762.650,240.000,'2026-04-25 00:00:00',0,'Administracion'),
 (357,1,1,'FAC',268,309,'N/C','FAC-268 Rec-309','Ventas','C',32,'','',27.000,484.740,'2026-04-28 11:11:00',0,'Administracion'),
 (358,2,2,'FAC',234,310,'N/C','FAC-234 Rec-310','Cobranza','C',226,'','',3150.000,630.000,'2026-04-29 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (359,1,12,'APA',23,312,'N/C','APA-0 Rec-312','Apartados','C',233,'','',1.000,640.000,'2026-04-29 17:14:37',0,'Administracion'),
 (360,8,12,'APA',23,313,'N/C','APA-0 Rec-313','Apartados','C',233,'','',240.000,640.000,'2026-04-29 17:14:37',0,'Administracion'),
 (361,2,12,'APA',23,314,'N/C','APA-0 Rec-314','Apartados','C',233,'','',1040.000,640.000,'2026-04-29 17:14:37',0,'Administracion'),
 (362,1,4,'GAST',35,48,'N/D','GAST-35 Rec-48','Gastos','P',9,'','',60.000,489.550,'2026-05-02 17:41:16',0,'Administracion'),
 (363,2,1,'FAC',272,315,'N/C','FAC-272 Rec-315','Ventas','C',57,'','',3172.280,489.550,'2026-05-02 17:46:55',0,'Administracion'),
 (364,1,1,'FAC',273,316,'N/C','FAC-273 Rec-316','Ventas','C',16,'','',20.000,489.550,'2026-05-03 12:04:35',0,'Administracion'),
 (365,1,1,'FAC',274,317,'N/C','FAC-274 Rec-317','Ventas','C',315,'','',12.000,494.110,'2026-05-06 09:29:37',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (366,1,2,'FAC',263,318,'N/C','FAC-263 Rec-318','Cobranza','C',232,'','',45.000,494.110,'2026-05-06 00:00:00',0,'Administracion'),
 (367,1,1,'FAC',275,319,'N/C','FAC-275 Rec-319','Ventas','C',315,'','',17.000,494.110,'2026-05-06 16:23:18',0,'Administracion'),
 (368,1,1,'FAC',276,320,'N/C','FAC-276 Rec-320','Ventas','C',316,'','',20.000,494.110,'2026-05-06 17:54:17',0,'Administracion'),
 (369,1,4,'GAST',36,49,'N/D','GAST-36 Rec-49','Gastos','P',7,'','',50.000,499.860,'2026-05-09 09:53:41',0,'Administracion'),
 (370,1,1,'FAC',277,321,'N/C','FAC-277 Rec-321','Ventas','C',288,'','',55.000,500.460,'2026-05-10 11:24:53',0,'Administracion'),
 (371,1,1,'FAC',279,322,'N/C','FAC-279 Rec-322','Ventas','C',288,'','',24.000,504.910,'2026-05-12 10:39:58',0,'Administracion'),
 (372,1,4,'GAST',37,50,'N/D','GAST-37 Rec-50','Gastos','P',7,'','',20.000,504.910,'2026-05-12 14:26:38',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (373,8,12,'APA',23,323,'N/C','APA-23 Rec-323','Cobranza Apartado','C',233,'','',633.600,640.000,'2026-05-13 10:33:39',0,'Administracion'),
 (374,8,4,'GAST',38,51,'N/D','GAST-38 Rec-51','Gastos','P',7,'','',510.790,510.790,'2026-05-14 11:59:56',0,'Administracion'),
 (375,1,4,'GAST',38,52,'N/D','GAST-38 Rec-52','Gastos','P',7,'','',2.000,510.790,'2026-05-14 11:59:56',0,'Administracion'),
 (376,1,1,'FAC',283,324,'N/C','FAC-283 Rec-324','Ventas','C',317,'','',25.000,510.790,'2026-05-15 15:09:31',0,'Administracion'),
 (377,2,1,'FAC',284,325,'N/C','FAC-284 Rec-325','Ventas','C',318,'','',48581.240,510.790,'2026-05-15 16:21:41',0,'Administracion'),
 (378,1,1,'FAC',285,326,'N/C','FAC-285 Rec-326','Ventas','C',319,'','',20.000,517.960,'2026-05-16 11:46:51',0,'Administracion'),
 (379,1,4,'GAST',39,53,'N/D','GAST-39 Rec-53','Pago GAST','P',9,'','',25.000,517.960,'2026-05-16 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (380,2,1,'FAC',286,327,'N/C','FAC-286 Rec-327','Ventas','C',320,'','',16025.680,517.960,'2026-05-19 15:20:31',0,'Administracion'),
 (381,1,12,'APA',24,328,'N/C','APA-0 Rec-328','Apartados','C',321,'','',10.000,520.910,'2026-05-20 17:00:07',0,'Administracion'),
 (382,2,2,'FAC',271,329,'N/C','FAC-271 Rec-329','Cobranza','C',278,'','',8488.800,707.400,'2026-05-21 00:00:00',0,'Administracion'),
 (383,2,1,'FAC',287,330,'N/C','FAC-287 Rec-330','Ventas','C',125,'','',8540.560,526.870,'2026-05-22 16:48:19',0,'Administracion'),
 (384,1,1,'FAC',288,331,'N/C','FAC-288 Rec-331','Ventas','C',322,'','',50.000,530.500,'2026-05-23 10:07:29',0,'Administracion'),
 (385,2,1,'FAC',289,332,'N/C','FAC-289 Rec-332','Ventas','C',133,'','',2952.000,738.000,'2026-05-27 16:52:53',0,'Administracion'),
 (386,1,1,'FAC',290,333,'N/C','FAC-290 Rec-333','Ventas','C',323,'','',10.000,738.000,'2026-05-27 17:22:51',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (387,1,1,'FAC',291,334,'N/C','FAC-291 Rec-334','Ventas','C',247,'','',15.000,738.000,'2026-05-28 10:25:53',0,'Administracion'),
 (388,1,12,'APA',24,335,'N/C','APA-24 Rec-335','Cobranza Apartado','C',321,'','',15.000,549.370,'2026-05-29 11:36:40',0,'Administracion'),
 (389,1,1,'FAC',293,336,'N/C','FAC-293 Rec-336','Ventas','C',261,'','',20.000,557.970,'2026-06-02 11:14:24',0,'Administracion'),
 (390,1,4,'GAST',40,54,'N/D','GAST-40 Rec-54','Gastos','P',7,'','',2.000,557.970,'2026-06-02 15:16:45',0,'Administracion'),
 (391,2,4,'GAST',41,55,'N/D','GAST-41 Rec-55','Gastos','P',9,'','',51796.000,557.970,'2026-06-02 15:21:06',0,'Administracion'),
 (392,2,4,'GAST',42,56,'N/D','GAST-42 Rec-56','Gastos','P',9,'','',83164.500,557.970,'2026-06-02 15:22:26',0,'Administracion'),
 (393,1,4,'GAST',43,57,'N/D','GAST-43 Rec-57','Gastos','P',7,'','',50.000,557.970,'2026-06-02 15:23:39',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (394,1,2,'FAC',217,337,'N/C','FAC-217 Rec-337','Cobranza','C',297,'','',40.000,557.970,'2026-06-02 00:00:00',0,'Administracion'),
 (395,1,2,'FAC',127,338,'N/C','FAC-127 Rec-338','Cobranza','C',237,'','',10.000,557.970,'2026-06-02 00:00:00',0,'Administracion'),
 (396,1,1,'FAC',294,339,'N/C','FAC-294 Rec-339','Ventas','C',298,'','',4.000,558.640,'2026-06-03 17:39:05',0,'Administracion'),
 (397,1,1,'FAC',295,340,'N/C','FAC-295 Rec-340','Ventas','C',324,'','',57.000,560.380,'2026-06-04 10:56:16',0,'Administracion'),
 (398,1,2,'FAC',127,341,'N/C','FAC-127 Rec-341','Cobranza','C',237,'','',20.000,560.380,'2026-06-04 00:00:00',0,'Administracion'),
 (399,2,1,'FAC',296,342,'N/C','FAC-296 Rec-342','Ventas','C',325,'','',11203.840,563.290,'2026-06-05 18:06:11',0,'Administracion'),
 (400,3,1,'FAC',297,343,'N/C','FAC-297 Rec-343','Ventas','C',326,'','',22.000,563.290,'2026-06-05 18:29:51',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (401,1,1,'FAC',297,344,'N/C','FAC-297 Rec-344','Ventas','C',326,'','',14.000,563.290,'2026-06-05 18:29:51',0,'Administracion'),
 (402,2,1,'FAC',298,345,'N/C','FAC-298 Rec-345','Ventas','C',327,'','',11506.870,567.680,'2026-06-06 13:17:01',0,'Administracion'),
 (403,1,3,'COMP',12,59,'N/D','COMP-12 Rec-59','Compras','P',3,'','',504.000,567.680,'2026-06-08 15:28:54',0,'Administracion'),
 (404,1,3,'COMP',12,60,'N/D','COMP-12 Rec-60','Compras','P',3,'','',180.000,567.680,'2026-06-08 15:28:54',0,'Administracion'),
 (405,1,1,'FAC',299,346,'N/C','FAC-299 Rec-346','Ventas','C',237,'','',10.000,567.680,'2026-06-08 16:04:55',0,'Administracion'),
 (406,2,1,'FAC',299,347,'N/C','FAC-299 Rec-347','Ventas','C',237,'','',10668.000,567.680,'2026-06-08 16:04:55',0,'Administracion'),
 (407,1,4,'GAST',45,61,'N/D','GAST-45 Rec-61','Pago GAST','P',7,'','',5.000,572.680,'2026-06-10 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (408,1,1,'FAC',300,348,'N/C','FAC-300 Rec-348','Ventas','C',38,'','',10.000,572.680,'2026-06-10 14:31:46',0,'Administracion'),
 (409,2,1,'FAC',301,349,'N/C','FAC-301 Rec-349','Ventas','C',38,'','',8010.620,577.550,'2026-06-11 09:40:41',0,'Administracion'),
 (410,1,12,'APA',25,350,'N/C','APA-0 Rec-350','Anul.APARec350M:10','C',2,'','',0.000,577.550,'2026-06-12 13:50:08',1,'Administracion'),
 (411,1,1,'FAC',303,351,'N/C','FAC-303 Rec-351','Ventas','C',237,'','',5.000,587.410,'2026-06-13 09:01:55',0,'Administracion'),
 (412,1,1,'FAC',304,352,'N/C','FAC-304 Rec-352','Ventas','C',237,'','',18.000,587.410,'2026-06-13 09:02:45',0,'Administracion'),
 (413,1,1,'FAC',305,353,'N/C','FAC-305 Rec-353','Ventas','C',322,'','',12.000,587.410,'2026-06-13 09:03:32',0,'Administracion'),
 (414,1,1,'FAC',306,354,'N/C','FAC-306 Rec-354','Ventas','C',89,'','',36.000,587.410,'2026-06-13 09:04:34',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (415,2,1,'FAC',307,355,'N/C','FAC-307 Rec-355','Ventas','C',237,'','',7900.000,790.000,'2026-06-13 09:07:06',0,'Administracion'),
 (416,1,1,'FAC',308,356,'N/C','FAC-308 Rec-356','Ventas','C',237,'','',10.000,587.410,'2026-06-13 13:20:38',0,'Administracion'),
 (417,2,1,'FAC',310,357,'N/C','FAC-310 Rec-357','Ventas','C',237,'','',12041.900,587.410,'2026-06-13 15:50:44',0,'Administracion'),
 (418,1,1,'FAC',311,358,'N/C','FAC-311 Rec-358','Ventas','C',328,'','',28.000,587.410,'2026-06-15 09:59:02',0,'Administracion'),
 (419,1,1,'FAC',312,359,'N/C','FAC-312 Rec-359','Ventas','C',111,'','',49.000,587.410,'2026-06-15 14:00:59',0,'Administracion'),
 (420,1,4,'GAST',46,62,'N/D','GAST-46 Rec-62','Gastos','P',7,'','',2.000,587.410,'2026-06-15 14:38:52',0,'Administracion'),
 (421,1,1,'FAC',313,360,'N/C','FAC-313 Rec-360','Ventas','C',329,'','',38.000,587.410,'2026-06-15 16:53:52',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (422,1,4,'GAST',47,63,'N/D','GAST-47 Rec-63','Gastos','P',9,'','',20.000,592.520,'2026-06-17 16:43:05',0,'Administracion'),
 (423,2,4,'GAST',47,64,'N/D','GAST-47 Rec-64','Gastos','P',9,'','',75647.000,592.520,'2026-06-17 16:43:05',0,'Administracion'),
 (424,1,3,'COMP',13,65,'N/D','COMP-13 Rec-65','Compras','P',5,'','',320.000,592.520,'2026-06-17 16:51:33',0,'Administracion'),
 (425,1,1,'FAC',314,361,'N/C','FAC-314 Rec-361','Ventas','C',161,'','',18.000,592.520,'2026-06-17 16:57:30',0,'Administracion'),
 (426,1,1,'FAC',315,362,'N/C','FAC-315 Rec-362','Ventas','C',38,'','',18.000,602.330,'2026-06-18 09:15:40',0,'Administracion'),
 (427,1,1,'FAC',316,363,'N/C','FAC-316 Rec-363','Ventas','C',237,'','',7.000,780.000,'2026-06-18 10:40:50',0,'Administracion'),
 (428,2,1,'FAC',316,364,'N/C','FAC-316 Rec-364','Ventas','C',237,'','',3900.000,780.000,'2026-06-18 10:40:50',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (429,2,1,'FAC',317,365,'N/C','FAC-317 Rec-365','Ventas','C',237,'','',14257.150,602.330,'2026-06-18 15:36:18',0,'Administracion'),
 (430,1,12,'APA',26,366,'N/C','APA-0 Rec-366','Apartados','C',38,'','',5.000,602.330,'2026-06-18 15:59:44',0,'Administracion'),
 (431,1,1,'FAC',318,367,'N/C','FAC-318 Rec-367','Ventas','C',330,'','',15.000,607.390,'2026-06-19 09:43:26',0,'Administracion'),
 (432,1,1,'FAC',319,368,'N/C','FAC-319 Rec-368','Ventas','C',331,'','',10.000,607.390,'2026-06-19 11:10:24',0,'Administracion'),
 (433,1,1,'FAC',322,369,'N/C','FAC-322 Rec-369','Ventas','C',244,'','',40.000,607.390,'2026-06-19 14:33:19',0,'Administracion'),
 (434,2,1,'FAC',325,370,'N/C','FAC-325 Rec-370','Ventas','C',237,'','',20320.430,612.430,'2026-06-20 11:07:29',0,'Administracion'),
 (435,2,1,'FAC',326,371,'N/C','FAC-326 Rec-371','Ventas','C',305,'','',11372.830,612.430,'2026-06-20 14:29:54',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (436,2,1,'FAC',327,372,'N/C','FAC-327 Rec-372','Ventas','C',333,'','',12193.480,612.430,'2026-06-20 16:27:29',0,'Administracion'),
 (437,2,1,'FAC',329,373,'N/C','FAC-329 Rec-373','Ventas','C',38,'','',14630.950,612.430,'2026-06-22 09:32:15',0,'Administracion'),
 (438,1,1,'FAC',330,374,'N/C','FAC-330 Rec-374','Ventas','C',237,'','',25.000,617.640,'2026-06-23 11:25:07',0,'Administracion'),
 (439,1,1,'FAC',331,375,'N/C','FAC-331 Rec-375','Ventas','C',237,'','',20.000,621.530,'2026-06-24 09:25:26',0,'Administracion'),
 (440,1,2,'FAC',332,376,'N/C','FAC-332 Rec-376','Cobranza','C',237,'','',15.000,621.530,'2026-06-24 00:00:00',0,'Administracion'),
 (441,1,1,'FAC',333,377,'N/C','FAC-333 Rec-377','Ventas','C',241,'','',20.000,621.530,'2026-06-25 15:12:13',0,'Administracion'),
 (442,1,1,'FAC',334,378,'N/C','FAC-334 Rec-378','Anul.334Rec378M:17','C',38,'','',0.000,623.020,'2026-06-27 10:58:58',1,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (443,2,1,'FAC',335,379,'N/C','FAC-335 Rec-379','Ventas','C',335,'','',46589.440,623.020,'2026-06-27 11:30:33',0,'Administracion'),
 (444,1,1,'FAC',337,380,'N/C','FAC-337 Rec-380','Ventas','C',336,'','',15.000,623.020,'2026-06-29 10:49:04',0,'Administracion'),
 (445,2,1,'FAC',338,381,'N/C','FAC-338 Rec-381','Ventas','C',337,'','',11650.470,623.020,'2026-06-29 17:11:52',0,'Administracion'),
 (446,1,1,'FAC',339,382,'N/C','FAC-339 Rec-382','Ventas','C',237,'','',50.000,623.020,'2026-06-30 11:11:56',0,'Administracion'),
 (447,1,3,'COMP',14,66,'N/D','COMP-14 Rec-66','Compras','P',3,'','',85.000,623.020,'2026-07-01 18:31:17',0,'Administracion'),
 (448,1,3,'COMP',14,67,'N/D','COMP-14 Rec-67','Compras','P',3,'','',280.000,623.020,'2026-07-01 18:31:17',0,'Administracion'),
 (449,1,3,'COMP',14,68,'N/D','COMP-14 Rec-68','Compras','P',3,'','',40.000,623.020,'2026-07-01 18:31:17',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (450,1,4,'GAST',48,69,'N/D','GAST-48 Rec-69','Gastos','P',9,'','',20.000,623.020,'2026-07-01 18:33:14',0,'Administracion'),
 (451,2,4,'GAST',49,70,'N/D','GAST-49 Rec-70','Gastos','P',9,'','',85345.860,623.020,'2026-07-01 18:35:57',0,'Administracion'),
 (452,1,4,'GAST',50,71,'N/D','GAST-50 Rec-71','Gastos','P',7,'','',35.000,633.360,'2026-07-01 18:37:27',0,'Administracion'),
 (453,1,1,'FAC',340,384,'N/C','FAC-340 Rec-384','Ventas','C',338,'','',31.000,639.700,'2026-07-02 11:40:07',0,'Administracion'),
 (454,1,12,'APA',27,385,'N/C','APA-0 Rec-385','Apartados','C',329,'','',20.000,652.970,'2026-07-03 09:41:23',0,'Administracion'),
 (455,1,1,'FAC',341,386,'N/C','FAC-341 Rec-386','Ventas','C',237,'','',20.000,652.970,'2026-07-03 10:53:05',0,'Administracion'),
 (456,2,1,'FAC',341,387,'N/C','FAC-341 Rec-387','Ventas','C',237,'','',1305.940,652.970,'2026-07-03 10:53:05',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (457,2,1,'FAC',342,388,'N/C','FAC-342 Rec-388','Ventas','C',38,'','',30000.000,667.050,'2026-07-04 12:09:44',0,'Administracion'),
 (458,2,1,'FAC',342,389,'N/C','FAC-342 Rec-389','Ventas','C',38,'','',1591.490,667.050,'2026-07-04 12:09:44',0,'Administracion'),
 (459,1,4,'GAST',51,72,'N/D','GAST-51 Rec-72','Gastos','P',7,'','',50.000,667.050,'2026-07-04 15:59:40',0,'Administracion'),
 (460,2,1,'FAC',343,390,'N/C','FAC-343 Rec-390','Ventas','C',237,'','',4736.050,667.050,'2026-07-04 17:45:17',0,'Administracion'),
 (461,2,1,'FAC',344,391,'N/C','FAC-344 Rec-391','Ventas','C',237,'','',17376.650,667.050,'2026-07-06 09:08:06',0,'Administracion'),
 (462,1,12,'APA',27,392,'N/C','APA-27 Rec-392','Cobranza Apartado','C',329,'','',15.000,674.930,'2026-07-07 15:18:40',0,'Administracion'),
 (463,2,1,'FAC',346,393,'N/C','FAC-346 Rec-393','Ventas','C',329,'','',34347.190,674.930,'2026-07-07 15:41:09',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (464,2,5,'0',0,0,'TRA','BCO002 00000464','COMPRA DE DIVISAS 08JULIO','0',0,'0','0',69947.180,240.000,'2026-07-08 10:45:32',0,'Administracion'),
 (465,3,5,'0',0,0,'N/C','TS00000465','COMPRA DE DIVISAS 08JULIO','0',0,'0','0',85.510,240.000,'2026-07-08 10:45:32',0,'Administracion'),
 (466,1,2,'FAC',322,394,'N/C','FAC-322 Rec-394','Cobranza','C',244,'','',15.000,685.940,'2026-07-08 00:00:00',0,'Administracion'),
 (467,1,1,'FAC',347,395,'N/C','FAC-347 Rec-395','Ventas','C',237,'','',58.000,685.940,'2026-07-08 15:36:55',0,'Administracion'),
 (468,1,1,'FAC',348,396,'N/C','FAC-348 Rec-396','Ventas','C',237,'','',62.000,685.940,'2026-07-08 18:12:36',0,'Administracion'),
 (469,1,1,'FAC',349,397,'N/C','FAC-349 Rec-397','Ventas','C',339,'','',25.000,700.220,'2026-07-09 09:46:07',0,'Administracion'),
 (470,1,1,'FAC',350,398,'N/C','FAC-350 Rec-398','Ventas','C',340,'','',30.000,709.690,'2026-07-10 14:48:29',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (471,2,1,'FAC',351,399,'N/C','FAC-351 Rec-399','Ventas','C',292,'','',30474.090,709.690,'2026-07-10 15:54:44',0,'Administracion'),
 (472,2,1,'FAC',352,400,'N/C','FAC-352 Rec-400','Ventas','C',38,'','',8239.500,709.690,'2026-07-10 18:12:18',0,'Administracion'),
 (473,1,1,'FAC',353,401,'N/C','FAC-353 Rec-401','Ventas','C',237,'','',24.000,721.350,'2026-07-11 14:26:24',0,'Administracion'),
 (474,1,1,'FAC',354,402,'N/C','FAC-354 Rec-402','Ventas','C',38,'','',23.000,721.350,'2026-07-13 09:41:38',0,'Administracion'),
 (475,2,12,'APA',26,403,'N/C','APA-26 Rec-403','Cobranza Apartado','C',38,'','',5740.000,721.350,'2026-07-13 09:43:37',0,'Administracion'),
 (476,1,12,'APA',1,404,'N/C','APA-1 Rec-404','Cobranza Apartado','C',254,'','',33.000,724.000,'2026-07-14 15:56:43',0,'Administracion'),
 (477,1,1,'FAC',357,406,'N/C','FAC-357 Rec-406','Ventas','C',38,'','',20.000,725.750,'2026-07-15 17:15:17',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (478,1,1,'FAC',358,407,'N/C','FAC-358 Rec-407','Ventas','C',38,'','',18.000,725.750,'2026-07-15 17:16:37',0,'Administracion'),
 (479,1,12,'APA',28,408,'N/C','APA-0 Rec-408','Apartados','C',341,'','',5.000,725.750,'2026-07-15 17:25:06',0,'Administracion'),
 (480,1,4,'GAST',52,73,'N/D','GAST-52 Rec-73','Gastos','P',9,'','',130.000,732.480,'2026-07-17 10:16:23',0,'Administracion'),
 (481,2,1,'FAC',359,409,'N/C','FAC-359 Rec-409','Ventas','C',125,'','',20099.250,732.480,'2026-07-17 11:17:28',0,'Administracion'),
 (482,2,2,'FAC',99,410,'N/C','FAC-99 Rec-410','Cobranza','C',240,'','',127650.000,0.000,'2026-07-17 17:57:59',0,'Administracion'),
 (483,2,2,'FAC',200,411,'N/C','FAC-200 Rec-411','Cobranza','C',240,'','',33189.000,0.000,'2026-07-17 17:57:59',0,'Administracion'),
 (484,2,2,'FAC',202,412,'N/C','FAC-202 Rec-412','Cobranza','C',240,'','',12765.000,0.000,'2026-07-17 17:57:59',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (485,2,2,'FAC',207,413,'N/C','FAC-207 Rec-413','Cobranza','C',240,'','',25530.000,0.000,'2026-07-17 17:57:59',0,'Administracion'),
 (486,2,2,'FAC',251,414,'N/C','FAC-251 Rec-414','Cobranza','C',240,'','',19573.000,0.000,'2026-07-17 17:57:59',0,'Administracion'),
 (487,2,2,'FAC',323,415,'N/C','FAC-323 Rec-415','Cobranza','C',240,'','',79143.000,0.000,'2026-07-17 17:57:59',0,'Administracion'),
 (488,2,2,'FAC',360,416,'N/C','FAC-360 Rec-416','Cobranza','C',240,'','',61272.000,0.000,'2026-07-17 17:57:59',0,'Administracion'),
 (489,2,2,'FAC',328,417,'N/C','FAC-328 Rec-417','Cobranza','C',334,'','',14940.000,732.480,'2026-07-18 00:00:00',0,'Administracion'),
 (490,2,2,'FAC',361,418,'N/C','FAC-361 Rec-418','Cobranza','C',134,'','',6225.000,732.480,'2026-07-11 00:00:00',0,'Administracion'),
 (491,2,2,'FAC',361,419,'N/C','FAC-361 Rec-419','Cobranza','C',134,'','',6300.000,732.480,'2026-07-17 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (492,1,1,'FAC',362,420,'N/C','FAC-362 Rec-420','Ventas','C',237,'','',4.000,736.930,'2026-07-18 10:19:48',0,'Administracion'),
 (493,1,4,'GAST',53,74,'N/D','GAST-53 Rec-74','Gastos','P',1,'','',4.000,736.930,'2026-07-18 10:20:43',0,'Administracion'),
 (494,1,12,'APA',28,421,'N/C','APA-28 Rec-421','Cobranza Apartado','C',341,'','',15.000,736.930,'2026-07-18 10:51:42',0,'Administracion'),
 (495,1,1,'FAC',364,422,'N/C','FAC-364 Rec-422','Ventas','C',342,'','',25.000,736.930,'2026-07-18 14:42:40',0,'Administracion'),
 (496,1,1,'FAC',365,423,'N/C','FAC-365 Rec-423','Ventas','C',38,'','',7.000,736.930,'2026-07-18 14:49:40',0,'Administracion'),
 (497,1,1,'FAC',367,424,'N/C','FAC-367 Rec-424','Ventas','C',89,'','',30.000,736.930,'2026-07-18 16:08:08',0,'Administracion'),
 (498,1,1,'FAC',368,425,'N/C','FAC-368 Rec-425','Ventas','C',344,'','',100.000,736.930,'2026-07-18 17:41:37',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (499,2,1,'FAC',369,426,'N/C','FAC-369 Rec-426','Ventas','C',38,'','',4996.390,736.930,'2026-07-19 10:29:01',0,'Administracion'),
 (500,2,1,'FAC',370,427,'N/C','FAC-370 Rec-427','Ventas','C',38,'','',8327.310,736.930,'2026-07-19 10:33:44',0,'Administracion'),
 (501,1,1,'FAC',372,428,'N/C','FAC-372 Rec-428','Ventas','C',345,'','',50.000,736.930,'2026-07-19 11:37:50',0,'Administracion'),
 (502,2,1,'FAC',373,429,'N/C','FAC-373 Rec-429','Ventas','C',185,'','',4156.290,736.930,'2026-07-19 12:02:01',0,'Administracion'),
 (503,1,2,'FAC',374,430,'N/C','FAC-374 Rec-430','Cobranza','C',213,'','',32.000,736.930,'2026-07-20 00:00:00',0,'Administracion'),
 (504,1,7,'COMP',14,75,'N/D','COMP-14 Rec-75','Pago COMP','P',3,'','',225.000,736.930,'2026-07-11 00:00:00',0,'Administracion'),
 (505,1,1,'FAC',379,431,'N/C','FAC-379 Rec-431','Ventas','C',38,'','',20.000,737.230,'2026-07-21 17:56:25',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (506,1,1,'FAC',380,432,'N/C','FAC-380 Rec-432','Ventas','C',38,'','',21.000,737.880,'2026-07-23 11:44:53',0,'Administracion'),
 (507,1,7,'COMP',3,76,'N/D','COMP-3 Rec-76','Pago COMP','P',3,'','',300.000,742.230,'2026-07-24 00:00:00',0,'Administracion'),
 (508,1,1,'FAC',381,433,'N/C','FAC-381 Rec-433','Ventas','C',38,'','',25.000,742.230,'2026-07-24 14:42:16',0,'Administracion'),
 (509,2,1,'FAC',383,434,'N/C','FAC-383 Rec-434','Ventas','C',125,'','',16794.930,742.810,'2026-07-28 09:08:01',0,'Administracion'),
 (510,1,1,'FAC',385,435,'N/C','FAC-385 Rec-435','Ventas','C',237,'','',30.000,742.810,'2026-07-28 16:38:51',0,'Administracion'),
 (511,1,1,'FAC',386,436,'N/C','FAC-386 Rec-436','Ventas','C',237,'','',10.000,742.810,'2026-07-28 17:01:38',0,'Administracion'),
 (512,2,1,'FAC',387,437,'N/C','FAC-387 Rec-437','Ventas','C',237,'','',25065.670,744.230,'2026-07-29 10:10:58',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (513,2,1,'FAC',388,438,'N/C','FAC-388 Rec-438','Ventas','C',237,'','',20094.210,744.230,'2026-07-29 11:21:54',0,'Administracion'),
 (514,1,1,'FAC',389,439,'N/C','FAC-389 Rec-439','Ventas','C',38,'','',20.000,744.230,'2026-07-30 09:38:46',0,'Administracion'),
 (515,2,1,'FAC',390,440,'N/C','FAC-390 Rec-440','Ventas','C',237,'','',5219.480,745.640,'2026-07-30 11:18:55',0,'Administracion'),
 (516,2,1,'FAC',391,441,'N/C','FAC-391 Rec-441','Ventas','C',237,'','',11184.600,745.640,'2026-07-30 14:40:59',0,'Administracion'),
 (517,1,1,'FAC',392,442,'N/C','FAC-392 Rec-442','Ventas','C',57,'','',38.000,746.630,'2026-07-31 17:03:12',0,'Administracion'),
 (518,2,1,'FAC',393,443,'N/C','FAC-393 Rec-443','Ventas','C',38,'','',33485.890,748.790,'2026-08-01 10:09:27',0,'Administracion'),
 (519,2,12,'APA',29,444,'N/C','APA-0 Rec-444','Apartados','C',237,'','',10000.000,748.790,'2026-08-01 10:36:16',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (520,2,2,'FAC',319,445,'N/C','FAC-319 Rec-445','Cobranza','C',331,'','',6800.000,748.790,'2026-08-01 00:00:00',0,'Administracion'),
 (521,2,1,'FAC',394,446,'N/C','FAC-394 Rec-446','Ventas','C',237,'','',12729.430,748.790,'2026-08-01 11:58:01',0,'Administracion'),
 (522,1,4,'GAST',55,77,'N/D','GAST-55 Rec-77','Gastos','P',7,'','',50.000,748.790,'2026-08-01 14:04:31',0,'Administracion'),
 (523,1,2,'FAC',382,447,'N/C','FAC-382 Rec-447','Cobranza','C',237,'','',50.000,748.790,'2026-08-01 00:00:00',0,'Administracion'),
 (524,2,4,'GAST',56,78,'N/D','GAST-56 Rec-78','Gastos','P',9,'','',120566.600,861.190,'2026-08-01 14:35:37',0,'Administracion'),
 (525,2,4,'GAST',57,79,'N/D','GAST-57 Rec-79','Pago GAST','P',7,'','',8524.350,855.000,'2026-08-01 00:00:00',0,'Administracion'),
 (526,1,4,'GAST',58,80,'N/D','GAST-58 Rec-80','Gastos','P',7,'','',2.000,855.000,'2026-08-01 15:03:57',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (527,1,1,'FAC',396,448,'N/C','FAC-396 Rec-448','Ventas','C',237,'','',10.000,748.790,'2026-08-01 16:48:31',0,'Administracion'),
 (528,2,1,'FAC',397,449,'N/C','FAC-397 Rec-449','Ventas','C',237,'','',8393.940,748.790,'2026-08-01 16:52:03',0,'Administracion'),
 (529,2,1,'FAC',398,450,'N/C','FAC-398 Rec-450','Ventas','C',237,'','',12729.430,748.790,'2026-08-03 13:47:22',0,'Administracion'),
 (530,2,2,'FAC',156,451,'N/C','FAC-156 Rec-451','Cobranza','C',286,'','',63750.000,748.790,'2026-08-03 00:00:00',0,'Administracion'),
 (531,1,1,'FAC',399,452,'N/C','FAC-399 Rec-452','Ventas','C',237,'','',17.000,748.790,'2026-08-03 16:44:56',0,'Administracion'),
 (532,1,4,'GAST',59,81,'N/D','GAST-59 Rec-81','Gastos','P',7,'','',34.000,748.790,'2026-08-03 16:47:57',0,'Administracion'),
 (533,2,1,'FAC',400,453,'N/C','FAC-400 Rec-453','Ventas','C',345,'','',24924.260,752.090,'2026-08-04 13:46:11',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (534,1,1,'FAC',401,454,'N/C','FAC-401 Rec-454','Anul.401Rec454M:20','C',341,'','',0.000,752.090,'2026-08-04 14:26:13',1,'Administracion'),
 (535,2,1,'FAC',402,455,'N/C','FAC-402 Rec-455','Ventas','C',237,'','',20772.730,752.090,'2026-08-04 16:42:09',0,'Administracion'),
 (536,1,1,'FAC',403,456,'N/C','FAC-403 Rec-456','Ventas','C',38,'','',22.000,752.090,'2026-08-04 17:55:32',0,'Administracion'),
 (537,2,12,'APA',30,457,'N/C','APA-0 Rec-457','Apartados','C',347,'','',7600.000,755.900,'2026-08-06 10:00:08',0,'Administracion'),
 (538,2,12,'APA',29,458,'N/C','APA-29 Rec-458','Cobranza Apartado','C',237,'','',7294.440,755.900,'2026-08-06 14:55:45',0,'Administracion'),
 (539,2,1,'FAC',404,459,'N/C','FAC-404 Rec-459','Ventas','C',38,'','',9826.700,755.900,'2026-08-06 14:56:43',0,'Administracion'),
 (540,1,7,'COMP',14,82,'N/D','COMP-14 Rec-82','Pago COMP','P',3,'','',50.000,756.710,'2026-08-07 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (541,1,1,'FAC',405,460,'N/C','FAC-405 Rec-460','Ventas','C',237,'','',15.000,756.710,'2026-08-07 17:45:08',0,'Administracion'),
 (542,1,1,'FAC',406,461,'N/C','FAC-406 Rec-461','Ventas','C',341,'','',20.000,756.710,'2026-08-08 10:30:59',0,'Administracion'),
 (543,2,5,'0',0,0,'TRA','BCO002 00000543','Transferencia entre cuentas','0',0,'0','0',7000000.000,240.000,'2026-08-08 16:49:30',0,'Administracion'),
 (544,1,5,'0',0,0,'N/C','TS00000544','Anul.0Rec0M:865','0',0,'0','0',0.000,240.000,'2026-08-08 16:49:30',1,'Administracion'),
 (545,2,1,'0',0,0,'N/C','BCO002 00000545','ajuste','P',8,'FRESITA SHOP TIENDA GRANDE','25720023-',7000000.000,240.000,'2026-08-08 00:00:00',0,'Administracion'),
 (546,2,5,'0',0,0,'TRA','BCO002 00000546','Transferencia entre cuentas','0',0,'0','0',700000.000,240.000,'2026-08-08 16:52:28',0,'Administracion'),
 (547,1,5,'0',0,0,'N/C','TS00000547','Transferencia entre cuentas','0',0,'0','0',865.000,240.000,'2026-08-08 16:52:28',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (548,3,4,'GAST',9,83,'N/D','GAST-9 Rec-83','Pago GAST','P',7,'','',73.000,756.710,'2026-08-08 00:00:00',0,'Administracion'),
 (549,1,4,'GAST',17,84,'N/D','GAST-17 Rec-84','Pago GAST','P',7,'','',25.000,756.710,'2026-08-08 00:00:00',0,'Administracion'),
 (550,1,4,'GAST',54,85,'N/D','GAST-54 Rec-85','Pago GAST','P',7,'','',35.000,756.710,'2026-08-08 00:00:00',0,'Administracion'),
 (551,1,7,'COMP',13,86,'N/D','COMP-13 Rec-86','Pago COMP','P',5,'','',6.000,756.710,'2026-08-08 00:00:00',0,'Administracion'),
 (552,1,7,'COMP',3,87,'N/D','COMP-3 Rec-87','Pago COMP','P',3,'','',1818.150,756.710,'2026-08-08 00:00:00',0,'Administracion'),
 (553,1,7,'COMP',6,88,'N/D','COMP-6 Rec-88','Pago COMP','P',3,'','',1500.600,756.710,'2026-08-08 00:00:00',0,'Administracion'),
 (554,1,7,'COMP',12,89,'N/D','COMP-12 Rec-89','Pago COMP','P',3,'','',2.090,756.710,'2026-08-08 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (555,1,7,'COMP',14,90,'N/D','COMP-14 Rec-90','Pago COMP','P',3,'','',0.570,756.710,'2026-08-08 00:00:00',0,'Administracion'),
 (556,1,1,'0',0,0,'N/C','BCO001 00000556','pago kelly','C',236,'KELLY ANDRADE CLIENTE','25720023',3321.410,240.000,'2026-08-08 00:00:00',0,'Administracion'),
 (557,1,5,'0',0,0,'TRA','BCO001 00000557','Transferencia entre cuentas','0',0,'0','0',800.000,240.000,'2026-08-08 17:23:06',0,'Administracion'),
 (558,3,5,'0',0,0,'N/C','TS00000558','Transferencia entre cuentas','0',0,'0','0',800.000,240.000,'2026-08-08 17:23:06',0,'Administracion'),
 (559,1,2,'FAC',376,462,'N/C','FAC-376 Rec-462','Cobranza','C',95,'','',40.000,756.710,'2026-08-10 00:00:00',0,'Administracion'),
 (560,1,2,'FAC',366,463,'N/C','FAC-366 Rec-463','Cobranza','C',244,'','',20.000,756.710,'2026-08-10 00:00:00',0,'Administracion'),
 (561,1,12,'APA',32,464,'N/C','APA-0 Rec-464','Apartados','C',348,'','',15.000,761.220,'2026-08-12 11:45:14',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (562,2,2,'FAC',384,465,'N/C','FAC-384 Rec-465','Cobranza','C',346,'','',21875.000,761.220,'2026-08-12 00:00:00',0,'Administracion'),
 (563,1,1,'FAC',407,466,'N/C','FAC-407 Rec-466','Ventas','C',343,'','',10.000,761.220,'2026-08-12 15:06:05',0,'Administracion'),
 (564,2,1,'FAC',408,467,'N/C','FAC-408 Rec-467','Ventas','C',343,'','',18404.640,766.860,'2026-08-13 14:02:13',0,'Administracion'),
 (565,2,2,'FAC',127,468,'N/C','FAC-127 Rec-468','Anul.127Rec468M:15840','C',237,'','',0.000,0.000,'2026-08-14 13:24:57',1,'Administracion'),
 (566,2,2,'FAC',127,469,'N/C','FAC-127 Rec-469','Cobranza','C',237,'','',15840.000,771.070,'2026-08-13 00:00:00',0,'Administracion'),
 (567,2,12,'APA',32,470,'N/C','APA-32 Rec-470','Cobranza Apartado','C',348,'','',30800.000,772.540,'2026-08-15 10:11:53',0,'Administracion'),
 (568,1,4,'GAST',60,91,'N/D','GAST-60 Rec-91','Gastos','P',9,'','',130.000,772.540,'2026-08-15 14:32:05',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (569,2,1,'FAC',410,471,'N/C','FAC-410 Rec-471','Ventas','C',348,'','',18162.420,772.540,'2026-08-15 15:27:15',0,'Administracion'),
 (570,1,1,'FAC',411,472,'N/C','FAC-411 Rec-472','Ventas','C',349,'','',60.000,772.540,'2026-08-15 18:03:18',0,'Administracion'),
 (571,2,1,'FAC',411,473,'N/C','FAC-411 Rec-473','Ventas','C',349,'','',1660.000,772.540,'2026-08-15 18:03:18',0,'Administracion'),
 (572,1,1,'FAC',413,474,'N/C','FAC-413 Rec-474','Ventas','C',343,'','',16.000,773.310,'2026-08-18 15:46:01',0,'Administracion'),
 (573,1,2,'FAC',375,475,'N/C','FAC-375 Rec-475','Cobranza','C',343,'','',12.000,773.310,'2026-08-19 00:00:00',0,'Administracion'),
 (574,1,2,'FAC',377,476,'N/C','FAC-377 Rec-476','Cobranza','C',343,'','',3.000,773.310,'2026-08-19 00:00:00',0,'Administracion'),
 (575,1,1,'FAC',414,477,'N/C','FAC-414 Rec-477','Ventas','C',350,'','',43.000,777.420,'2026-08-20 13:45:45',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (576,1,2,'FAC',415,478,'N/C','FAC-415 Rec-478','Cobranza','C',343,'','',12.000,777.420,'2026-08-20 00:00:00',0,'Administracion'),
 (577,1,1,'FAC',416,479,'N/C','FAC-416 Rec-479','Ventas','C',200,'','',61.000,777.420,'2026-08-21 10:25:01',0,'Administracion'),
 (578,2,4,'GAST',61,92,'N/D','GAST-61 Rec-92','Gastos','P',7,'','',67086.750,894.490,'2026-08-22 09:10:10',0,'Administracion'),
 (579,2,1,'FAC',419,480,'N/C','FAC-419 Rec-480','Ventas','C',38,'','',13660.930,784.660,'2026-08-22 10:50:53',0,'Administracion'),
 (580,1,1,'FAC',420,481,'N/C','FAC-420 Rec-481','Ventas','C',71,'','',35.000,784.660,'2026-08-22 16:49:13',0,'Administracion'),
 (581,2,12,'APA',30,482,'N/C','APA-30 Rec-482','Cobranza Apartado','C',347,'','',8557.000,784.660,'2026-08-24 13:15:05',0,'Administracion'),
 (582,1,2,'FAC',156,483,'N/C','FAC-156 Rec-483','Cobranza','C',286,'','',17.000,784.660,'2026-08-24 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (583,1,4,'GAST',62,93,'N/D','GAST-62 Rec-93','Gastos','P',7,'','',3.000,784.660,'2026-08-24 13:59:44',0,'Administracion'),
 (584,1,1,'FAC',421,484,'N/C','FAC-421 Rec-484','Ventas','C',343,'','',20.000,791.320,'2026-08-27 11:46:50',0,'Administracion'),
 (585,2,1,'FAC',422,485,'N/C','FAC-422 Rec-485','Ventas','C',330,'','',4650.000,791.320,'2026-08-29 08:47:09',0,'Administracion'),
 (586,2,1,'FAC',423,486,'N/C','FAC-423 Rec-486','Ventas','C',343,'','',19874.750,794.990,'2026-08-29 12:24:08',0,'Administracion'),
 (587,1,4,'GAST',63,94,'N/D','GAST-63 Rec-94','Gastos','P',7,'','',50.000,798.330,'2026-09-01 10:13:32',0,'Administracion'),
 (588,1,4,'GAST',64,95,'N/D','GAST-64 Rec-95','Gastos','P',7,'','',120.000,798.330,'2026-09-01 10:40:47',0,'Administracion'),
 (589,1,2,'FAC',418,487,'N/C','FAC-418 Rec-487','Cobranza','C',351,'','',22.000,798.330,'2026-09-01 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (590,2,1,'FAC',424,488,'N/C','FAC-424 Rec-488','Ventas','C',343,'','',31134.870,798.330,'2026-09-01 14:51:00',0,'Administracion'),
 (591,1,1,'FAC',425,489,'N/C','FAC-425 Rec-489','Ventas','C',352,'','',48.000,798.330,'2026-09-01 16:00:29',0,'Administracion'),
 (592,1,1,'FAC',426,490,'N/C','FAC-426 Rec-490','Ventas','C',161,'','',20.000,798.330,'2026-09-01 17:53:54',0,'Administracion'),
 (593,2,1,'FAC',426,491,'N/C','FAC-426 Rec-491','Ventas','C',161,'','',2394.990,798.330,'2026-09-01 17:53:54',0,'Administracion'),
 (594,1,1,'FAC',427,492,'N/C','FAC-427 Rec-492','Ventas','C',38,'','',8.000,804.810,'2026-09-03 15:00:32',0,'Administracion'),
 (595,1,1,'FAC',428,493,'N/C','FAC-428 Rec-493','Ventas','C',126,'','',23.000,804.810,'2026-09-03 15:06:50',0,'Administracion'),
 (596,1,4,'GAST',65,96,'N/D','GAST-65 Rec-96','Gastos','P',7,'','',10.600,807.390,'2026-09-04 09:30:05',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (597,1,1,'FAC',429,494,'N/C','FAC-429 Rec-494','Ventas','C',38,'','',25.000,807.390,'2026-09-04 16:53:56',0,'Administracion'),
 (598,2,1,'FAC',430,495,'N/C','FAC-430 Rec-495','Ventas','C',38,'','',17088.540,813.740,'2026-09-05 11:41:58',0,'Administracion'),
 (599,1,1,'FAC',431,496,'N/C','FAC-431 Rec-496','Ventas','C',280,'','',18.000,813.740,'2026-09-05 16:34:30',0,'Administracion'),
 (600,1,2,'FAC',376,497,'N/C','FAC-376 Rec-497','Cobranza','C',95,'','',35.000,813.740,'2026-09-05 00:00:00',0,'Administracion'),
 (601,1,1,'FAC',432,498,'N/C','FAC-432 Rec-498','Ventas','C',38,'','',20.000,980.000,'2026-09-08 16:25:26',0,'Administracion'),
 (602,2,1,'FAC',432,499,'N/C','FAC-432 Rec-499','Ventas','C',38,'','',9800.000,980.000,'2026-09-08 16:25:26',0,'Administracion'),
 (603,1,1,'FAC',433,500,'N/C','FAC-433 Rec-500','Ventas','C',38,'','',20.000,827.740,'2026-09-10 11:21:09',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (604,2,1,'FAC',434,501,'N/C','FAC-434 Rec-501','Ventas','C',38,'','',17382.540,827.740,'2026-09-10 14:00:44',0,'Administracion'),
 (605,1,1,'FAC',435,502,'N/C','FAC-435 Rec-502','Ventas','C',38,'','',15.000,827.740,'2026-09-10 14:37:07',0,'Administracion'),
 (606,1,2,'FAC',366,503,'N/C','FAC-366 Rec-503','Cobranza','C',244,'','',9.000,842.210,'2026-09-12 00:00:00',0,'Administracion'),
 (607,2,1,'FAC',437,504,'N/C','FAC-437 Rec-504','Ventas','C',38,'','',10106.520,842.210,'2026-09-14 15:42:59',0,'Administracion'),
 (608,2,1,'FAC',438,505,'N/C','FAC-438 Rec-505','Ventas','C',38,'','',9264.310,842.210,'2026-09-14 15:46:05',0,'Administracion'),
 (609,1,1,'FAC',439,506,'N/C','FAC-439 Rec-506','Ventas','C',38,'','',12.000,842.210,'2026-09-16 09:15:04',0,'Administracion'),
 (610,1,1,'FAC',440,507,'N/C','FAC-440 Rec-507','Ventas','C',329,'','',5.000,980.000,'2026-09-16 15:13:45',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (611,2,4,'GAST',66,97,'N/D','GAST-66 Rec-97','Gastos','P',7,'','',46550.000,980.000,'2026-09-16 15:28:56',0,'Administracion'),
 (612,2,4,'GAST',67,98,'N/D','GAST-67 Rec-98','Gastos','P',7,'','',73284.400,980.000,'2026-09-16 15:35:09',0,'Administracion'),
 (613,2,4,'GAST',68,99,'N/D','GAST-68 Rec-99','Gastos','P',7,'','',9032.260,846.510,'2026-09-16 15:40:17',0,'Administracion'),
 (614,1,4,'GAST',69,100,'N/D','GAST-69 Rec-100','Gastos','P',9,'','',130.000,846.510,'2026-09-17 09:18:26',0,'Administracion'),
 (615,2,1,'FAC',441,508,'N/C','FAC-441 Rec-508','Ventas','C',346,'','',5880.000,846.510,'2026-09-17 16:57:37',0,'Administracion'),
 (616,2,1,'FAC',442,509,'N/C','FAC-442 Rec-509','Ventas','C',7,'','',20626.690,847.440,'2026-09-17 17:59:44',0,'Administracion'),
 (617,1,1,'FAC',443,510,'N/C','FAC-443 Rec-510','Ventas','C',38,'','',25.000,848.550,'2026-09-18 14:42:36',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (618,2,1,'FAC',444,511,'N/C','FAC-444 Rec-511','Ventas','C',38,'','',12072.250,849.560,'2026-09-19 09:38:32',0,'Administracion'),
 (619,1,1,'FAC',445,512,'N/C','FAC-445 Rec-512','Ventas','C',350,'','',16.000,849.560,'2026-09-21 15:31:08',0,'Administracion'),
 (620,1,1,'FAC',446,513,'N/C','FAC-446 Rec-513','Ventas','C',38,'','',44.000,852.420,'2026-09-22 13:21:58',0,'Administracion'),
 (621,2,1,'FAC',447,514,'N/C','FAC-447 Rec-514','Ventas','C',38,'','',23688.750,852.420,'2026-09-22 14:55:21',0,'Administracion'),
 (622,2,1,'FAC',448,515,'N/C','FAC-448 Rec-515','Ventas','C',133,'','',12980.000,852.420,'2026-09-22 15:28:41',0,'Administracion'),
 (623,1,1,'FAC',448,516,'N/C','FAC-448 Rec-516','Ventas','C',133,'','',10.000,852.420,'2026-09-22 15:28:41',0,'Administracion'),
 (624,1,7,'COMP',15,101,'N/D','COMP-15 Rec-101','Pago COMP','P',3,'','',260.000,852.420,'2026-09-22 00:00:00',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (625,1,4,'GAST',70,102,'N/D','GAST-70 Rec-102','Gastos','P',7,'','',5.000,852.420,'2026-09-22 15:57:19',0,'Administracion'),
 (626,1,1,'FAC',450,518,'N/C','FAC-450 Rec-518','Ventas','C',38,'','',15.000,852.420,'2026-09-23 13:16:04',0,'Administracion'),
 (627,1,7,'COMP',15,103,'N/D','COMP-15 Rec-103','Pago COMP','P',3,'','',160.000,852.420,'2026-09-24 00:00:00',0,'Administracion'),
 (628,2,1,'FAC',451,519,'N/C','FAC-451 Rec-519','Ventas','C',216,'','',4900.000,852.420,'2026-09-24 16:54:36',0,'Administracion'),
 (629,1,2,'FAC',436,520,'N/C','FAC-436 Rec-520','Cobranza','C',244,'','',5.000,852.420,'2026-09-25 00:00:00',0,'Administracion'),
 (630,2,12,'APA',33,521,'N/C','APA-0 Rec-521','Apartados','C',224,'','',8544.600,855.620,'2026-09-25 17:48:36',0,'Administracion'),
 (631,1,1,'FAC',453,522,'N/C','FAC-453 Rec-522','Ventas','C',173,'','',20.000,860.010,'2026-10-01 15:19:57',0,'Administracion');
INSERT INTO `mov_ban` (`id_mov`,`idbanco`,`clasificador`,`tipodoc`,`docrelacion`,`iddocumento`,`tipo_mov`,`numero`,`concepto`,`tipo_per`,`idbeneficiario`,`identificacion`,`ced`,`monto`,`tasadolar`,`fecha_mov`,`estatus`,`user`) VALUES 
 (632,2,12,'APA',33,523,'N/C','APA-33 Rec-523','Cobranza Apartado','C',224,'','',12026.810,860.010,'2026-10-01 16:38:15',0,'Administracion'),
 (633,3,7,'COMP',15,104,'N/D','COMP-15 Rec-104','Pago COMP','P',3,'','',783.300,860.010,'2026-10-01 00:00:00',0,'Administracion'),
 (634,3,7,'COMP',16,105,'N/D','COMP-16 Rec-105','Pago COMP','P',10,'','',51.210,860.010,'2026-10-01 00:00:00',0,'Administracion'),
 (635,2,5,'0',0,0,'TRA','BCO002 00000635','Transferencia entre cuentas','0',0,'0','0',144888.380,240.000,'2026-10-01 16:59:25',0,'Administracion'),
 (636,3,5,'0',0,0,'N/C','TS00000636','Transferencia entre cuentas','0',0,'0','0',152.000,240.000,'2026-10-01 16:59:25',0,'Administracion'),
 (637,1,2,'FAC',451,524,'N/C','FAC-451 Rec-524','Cobranza','C',216,'','',10.000,866.560,'2026-10-02 00:00:00',0,'Administracion'),
 (638,1,4,'GAST',71,106,'N/D','GAST-71 Rec-106','Gastos','P',7,'','',40.000,866.560,'2026-10-03 09:21:00',0,'Administracion');
/*!40000 ALTER TABLE `mov_ban` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`mov_notas`
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
-- Dumping data for table `svwebkids`.`mov_notas`
--

/*!40000 ALTER TABLE `mov_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_notas` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`mov_notasp`
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
-- Dumping data for table `svwebkids`.`mov_notasp`
--

/*!40000 ALTER TABLE `mov_notasp` DISABLE KEYS */;
/*!40000 ALTER TABLE `mov_notasp` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`notasadm`
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
  `iddocnc` int(11) DEFAULT '0',
  `movban` int(11) DEFAULT '0',
  PRIMARY KEY (`idnota`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`notasadm`
--

/*!40000 ALTER TABLE `notasadm` DISABLE KEYS */;
INSERT INTO `notasadm` (`idnota`,`tipo`,`ndocumento`,`idcliente`,`descripcion`,`referencia`,`monto`,`fecha`,`pendiente`,`usuario`,`pordevolucion`,`iddocnc`,`movban`) VALUES 
 (1,2,1,3,'N/C por Devolucion','FAC A 3',2.000,'2025-11-15',2.000,'Administracion',1,0,0),
 (2,1,1,38,'CUENTA POR COBRAR','CUENTA POR COBRAR',1.000,'2025-11-17',0.000,'Administracion',0,0,0),
 (3,2,2,244,'N/C por Devolucion','FAC A 4',12.750,'2025-11-25',12.750,'Administracion',1,0,0),
 (4,2,3,251,'N/C por Devolucion','FAC A 7',10.000,'2025-12-09',10.000,'Administracion',1,0,0),
 (5,2,4,87,'N/C por Devolucion','FAC A 12',10.000,'2025-12-09',10.000,'Administracion',1,0,0),
 (6,2,5,252,'N/C por Devolucion','FAC A 13',10.000,'2025-12-09',10.000,'Administracion',1,0,0),
 (7,2,6,4,'N/C por Devolucion','FAC A 10',185.000,'2025-12-10',185.000,'Administracion',1,0,0),
 (8,2,7,198,'N/C por Devolucion','FAC A 48',6.000,'2025-12-17',6.000,'Administracion',1,0,0),
 (9,2,8,238,'N/C por Devolucion','FAC A 46',27.000,'2025-12-17',27.000,'Administracion',1,0,0),
 (10,2,9,267,'N/C por Devolucion','FAC A 52',79.000,'2025-12-18',79.000,'Administracion',1,0,0);
INSERT INTO `notasadm` (`idnota`,`tipo`,`ndocumento`,`idcliente`,`descripcion`,`referencia`,`monto`,`fecha`,`pendiente`,`usuario`,`pordevolucion`,`iddocnc`,`movban`) VALUES 
 (11,2,10,33,'N/C por Devolucion','FAC A 140',18.000,'2025-12-29',18.000,'Administracion',1,0,0);
/*!40000 ALTER TABLE `notasadm` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`notasadmp`
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
  `movban` int(11) DEFAULT '0',
  `usuario` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idnota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`notasadmp`
--

/*!40000 ALTER TABLE `notasadmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `notasadmp` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svwebkids`.`password_resets`
--

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`pedidos`
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
-- Dumping data for table `svwebkids`.`pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `abilities` text CHARACTER SET utf8mb4,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svwebkids`.`personal_access_tokens`
--

/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`proveedores`
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`proveedores`
--

/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` (`idproveedor`,`nombre`,`rif`,`direccion`,`telefono`,`contacto`,`estatus`,`tpersona`,`creado`,`tipo`) VALUES 
 (1,'INVENTARIO DE FRESITA SHOP KIDS','123','SANTA CRUZ DE MORA','(123) ___-____','INVENTARIO DE FRESITA SHOP KIDS','A',3,NULL,'P'),
 (2,'JEANS MOST WANTED NIÑA','v99900000','VALENCIA','(424) 409-1422','JEANS MOST WANTED NIÑA','A',3,NULL,'P'),
 (3,'SHEIN USA','1234','USA','(232) 434-____','SHEIN USA','A',3,NULL,'P'),
 (4,'ROPA DE PERU NIÑA','7678980','PERU','(414) 565-6___','ROPA DE PERU NIÑA','A',3,NULL,'P'),
 (5,'LA ROCA','010012','VALENCIA-EDO CARABOBO','(241) 848-5024','LA ROCA','A',3,NULL,'P'),
 (6,'KALUA','8763','UREÑA','(424) 657-890_','KALUA','A',3,NULL,'P'),
 (7,'GASTO GENERAL','76456','SANTA CRUZ DE MORA','(412) 219-2007','GASTO GENERAL','A',3,NULL,'P'),
 (8,'FRESITA SHOP TIENDA GRANDE','25720023-','SANTA CRUZ DE MORA','(412) 213-2007','KELLY','A',3,'2025-12-28','P'),
 (9,'NOMINA','8765445','SANTA CRUZ DE MORA','(765) 4__-____','ANDREA','A',3,NULL,'P'),
 (10,'ARABE CCS',',KUYRD','CARACAS','(876) 5__-____','ARABE CCS','A',3,NULL,'P');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`recibos`
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
  `idbanco` varchar(30) DEFAULT NULL,
  `recibido` float(11,2) NOT NULL,
  `tasab` float(11,2) DEFAULT NULL,
  `tasap` float(11,2) DEFAULT NULL,
  `referencia` varchar(20) DEFAULT NULL,
  `aux` varchar(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecharecibo` date DEFAULT NULL,
  `idcomsion` int(11) DEFAULT '0',
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idrecibo`)
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`recibos`
--

/*!40000 ALTER TABLE `recibos` DISABLE KEYS */;
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (1,3,0,0,'P',0.00,15,0,'PTO VENTA BNC',0.00,203.74,4000.00,'Anulado ->2','0.00','2026-10-04 15:17:54','2025-11-15',0,'Administracion'),
 (2,0,2,0,'A',0.00,1,0,'Dolares',0.00,236.46,4000.00,'Anulado ->1','0.00','2026-10-04 15:17:54','2025-11-17',0,'Administracion'),
 (3,4,0,0,'P',0.00,1,0,'Dolares',0.00,236.84,4000.00,'Anulado ->12.75','0.00','2026-10-04 15:17:54','2025-11-25',0,'Administracion'),
 (4,5,0,0,'P',0.00,1,0,'Dolares',0.00,236.84,4000.00,'Anulado ->20','0.00','2026-10-04 15:17:54','2025-12-05',0,'Administracion'),
 (5,5,0,0,'P',0.00,15,0,'PTO VENTA BNC',0.00,236.84,4000.00,'Anulado ->14.5','0.00','2026-10-04 15:17:54','2025-12-05',0,'Administracion'),
 (6,5,0,0,'P',0.00,13,0,'transferencia bnc',0.00,236.84,4000.00,'Anulado ->12.5','0.00','2026-10-04 15:17:54','2025-12-05',0,'Administracion'),
 (7,6,0,0,'P',25.00,1,0,'Dolares',25.00,0.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-06',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (8,7,0,0,'A',0.00,1,0,'Dolares',0.00,0.00,4000.00,'Anulado ->10','24.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion'),
 (9,9,0,0,'P',31.00,15,0,'PTO VENTA BNC',7995.83,0.00,4000.00,'Tc: 257.93','0.00','2026-10-04 15:17:54','2025-12-06',0,'Administracion'),
 (10,10,0,0,'P',0.00,1,0,'Dolares',0.00,0.00,4000.00,'Anulado ->0','0.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion'),
 (11,11,0,0,'P',13.50,13,0,'transferencia bnc',3482.06,0.00,4000.00,'Tc: 257.93','0.00','2026-10-04 15:17:54','2025-12-06',0,'Administracion'),
 (12,12,0,0,'A',0.00,13,0,'transferencia bnc',0.00,0.00,4000.00,'Anulado ->10','10.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion'),
 (13,13,0,0,'A',0.00,1,0,'Dolares',0.00,0.00,4000.00,'Anulado ->10','70.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion'),
 (14,15,0,0,'P',8.50,1,0,'Dolares',8.50,0.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-06',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (15,16,0,0,'P',4.00,15,0,'PTO VENTA BNC',1031.72,0.00,4000.00,'Tc: 257.93','0.00','2026-10-04 15:17:54','2025-12-06',0,'Administracion'),
 (16,17,0,0,'P',80.98,1,0,'Dolares',80.98,0.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-06',0,'Administracion'),
 (17,18,0,0,'P',23.00,1,0,'Dolares',23.00,0.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-08',0,'Administracion'),
 (18,0,0,3,'AP',10.00,1,0,'Dolares',10.00,257.93,4000.00,NULL,'24.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion'),
 (19,0,0,4,'AP',10.00,13,0,'transferencia bnc',2579.30,257.93,4000.00,'Tc: 257.93','10.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion'),
 (20,0,0,5,'AP',30.00,1,0,'Dolares',30.00,257.93,4000.00,'Doc. Anulado ->30','81.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion'),
 (21,21,0,0,'P',31.00,1,0,'Dolares',31.00,257.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (22,22,0,0,'P',58.00,15,0,'PTO VENTA BNC',14959.94,257.93,4000.00,'Tc: 257.93','0.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion'),
 (23,23,0,0,'P',111.50,13,0,'transferencia bnc',28759.19,257.93,4000.00,'Tc: 257.93','0.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion'),
 (24,24,0,0,'P',125.50,13,0,'transferencia bnc',32370.22,257.93,4000.00,'Tc: 257.93','0.00','2026-10-04 15:17:54','2025-12-09',0,'Administracion'),
 (25,25,0,0,'P',163.00,1,0,'Dolares',163.00,262.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion'),
 (26,25,0,0,'P',0.87,16,0,'DESC. FACT.',0.87,262.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion'),
 (27,26,0,0,'P',30.00,1,0,'Dolares',30.00,262.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion'),
 (28,26,0,0,'P',94.00,1,0,'Dolares',94.00,262.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (29,26,0,0,'P',0.40,16,0,'DESC. FACT.',0.40,262.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion'),
 (30,27,0,0,'P',137.00,1,0,'Dolares',137.00,262.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion'),
 (31,0,0,6,'AP',40.00,1,0,'Dolares',40.00,262.10,4000.00,NULL,'133.00','2026-10-04 15:17:54','2025-12-10',0,'Administracion'),
 (32,30,0,0,'P',15.00,1,0,'Dolares',15.00,262.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-11',0,'Administracion'),
 (33,0,0,6,'AP',133.00,1,0,'Dolares',133.00,265.07,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-11',0,'Administracion'),
 (34,33,0,0,'P',28.00,15,0,'PTO VENTA BNC',7497.00,267.75,4000.00,'Tc: 267.75','0.00','2026-10-04 15:17:54','2025-12-12',0,'Administracion'),
 (35,34,0,0,'P',29.88,4,0,'Bolivares Efect.',8000.00,267.75,4000.00,'Tc: 267.75','0.00','2026-10-04 15:17:54','2025-12-12',0,'Administracion'),
 (36,34,0,0,'P',2.12,15,0,'PTO VENTA BNC',567.63,267.75,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-12',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (37,35,0,0,'P',36.00,1,0,'Dolares',36.00,267.75,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-12',0,'Administracion'),
 (38,36,0,0,'P',74.00,15,0,'PTO VENTA BNC',19813.50,267.75,4000.00,'Tc: 267.75','0.00','2026-10-04 15:17:54','2025-12-12',0,'Administracion'),
 (39,0,0,3,'AP',24.00,1,0,'Dolares',24.00,270.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-13',0,'Administracion'),
 (40,37,0,0,'P',5.00,1,0,'Dolares',5.00,270.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-13',0,'Administracion'),
 (41,0,0,7,'AP',20.00,1,0,'Dolares',20.00,270.79,4000.00,NULL,'10.00','2026-10-04 15:17:54','2025-12-13',0,'Administracion'),
 (42,0,0,8,'AP',20.00,1,0,'Dolares',20.00,270.79,4000.00,NULL,'15.00','2026-10-04 15:17:54','2025-12-14',0,'Administracion'),
 (43,38,0,0,'P',6.50,15,0,'PTO VENTA BNC',1760.14,270.79,4000.00,'Tc: 270.79','0.00','2026-10-04 15:17:54','2025-12-14',0,'Administracion'),
 (44,39,0,0,'P',10.00,15,0,'PTO VENTA BNC',2707.90,270.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-14',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (45,40,0,0,'P',30.00,1,0,'Dolares',30.00,270.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-14',0,'Administracion'),
 (46,0,0,9,'AP',10.00,1,0,'Dolares',10.00,270.79,4000.00,NULL,'48.00','2026-10-04 15:17:54','2025-12-14',0,'Administracion'),
 (47,41,0,0,'P',25.00,1,0,'Dolares',25.00,270.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-15',0,'Administracion'),
 (48,42,0,0,'P',30.00,1,0,'Dolares',30.00,270.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-15',0,'Administracion'),
 (49,19,0,0,'A',10.00,13,0,'transferencia bnc',2707.90,270.79,4000.00,'Tc: 270.79','61.00','2026-10-04 15:17:54','2025-12-15',0,'Administracion'),
 (50,19,0,0,'A',15.00,13,0,'transferencia bnc',4061.85,270.79,4000.00,'Tc: 270.79','46.00','2026-10-04 15:17:54','2025-12-15',0,'Administracion'),
 (51,31,0,0,'A',32.00,15,0,'PTO VENTA BNC',8665.28,270.79,4000.00,'Tc: 270.79','0.00','2026-10-04 15:17:54','2025-12-15',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (52,43,0,0,'P',56.00,13,0,'transferencia bnc',15164.24,270.79,4000.00,'Tc: 270.79','0.00','2026-10-04 15:17:54','2025-12-15',0,'Administracion'),
 (53,19,0,0,'A',10.00,13,0,'transferencia bnc',2765.80,276.58,4000.00,'Tc: 276.58','36.00','2026-10-04 15:17:54','2025-12-16',0,'Administracion'),
 (54,44,0,0,'P',29.00,1,0,'Dolares',29.00,276.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-16',0,'Administracion'),
 (55,45,0,0,'P',20.00,1,0,'Dolares',20.00,276.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-16',0,'Administracion'),
 (56,46,0,0,'P',0.00,15,0,'PTO VENTA BNC',0.00,276.58,4000.00,'Anulado ->27','0.00','2026-10-04 15:17:54','2025-12-17',0,'Administracion'),
 (57,47,0,0,'P',40.00,1,0,'Dolares',40.00,276.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-16',0,'Administracion'),
 (58,0,0,7,'AP',10.00,1,0,'Dolares',10.00,276.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-16',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (59,48,0,0,'A',0.00,13,0,'transferencia bnc',0.00,276.58,4000.00,'Anulado ->6','14.00','2026-10-04 15:17:54','2025-12-17',0,'Administracion'),
 (60,0,0,10,'AP',6.00,13,0,'transferencia bnc',1659.48,276.58,4000.00,'Tc: 276.58','14.00','2026-10-04 15:17:54','2025-12-17',0,'Administracion'),
 (61,49,0,0,'P',15.00,1,0,'Dolares',15.00,276.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-17',0,'Administracion'),
 (62,50,0,0,'P',30.00,1,0,'Dolares',30.00,276.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-17',0,'Administracion'),
 (63,51,0,0,'P',27.00,15,0,'PTO VENTA BNC',7467.66,276.58,4000.00,'Tc: 276.58','0.00','2026-10-04 15:17:54','2025-12-17',0,'Administracion'),
 (64,52,0,0,'P',0.00,1,0,'Dolares',0.00,276.58,4000.00,'Anulado ->0','0.00','2026-10-04 15:17:54','2025-12-18',0,'Administracion'),
 (65,53,0,0,'P',101.00,1,0,'Dolares',101.00,276.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-18',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (66,55,0,0,'P',56.00,13,0,'transferencia bnc',15655.36,279.56,4000.00,'Tc: 279.56','0.00','2026-10-04 15:17:54','2025-12-18',0,'Administracion'),
 (67,56,0,0,'P',25.00,1,0,'Dolares',25.00,279.56,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-18',0,'Administracion'),
 (68,57,0,0,'P',16.00,1,0,'Dolares',16.00,279.56,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-18',0,'Administracion'),
 (69,58,0,0,'P',75.00,1,0,'Dolares',75.00,279.56,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-18',0,'Administracion'),
 (70,0,0,8,'AP',15.00,1,0,'Dolares',15.00,279.56,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-18',0,'Administracion'),
 (71,19,0,0,'A',10.00,13,0,'transferencia bnc',2825.10,282.51,4000.00,'Tc: 282.51','26.00','2026-10-04 15:17:54','2025-12-19',0,'Administracion'),
 (72,59,0,0,'P',15.00,1,0,'Dolares',15.00,282.51,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-19',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (73,60,0,0,'P',63.00,15,0,'PTO VENTA BNC',17798.13,282.51,4000.00,'Tc: 282.51','0.00','2026-10-04 15:17:54','2025-12-19',0,'Administracion'),
 (74,61,0,0,'P',81.00,15,0,'PTO VENTA BNC',23117.40,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-19',0,'Administracion'),
 (75,0,0,11,'AP',10.00,1,0,'Dolares',10.00,285.40,4000.00,'Doc. Anulado ->10','30.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (76,0,0,12,'AP',0.00,1,0,'Dolares',0.00,285.40,4000.00,'Doc. Anulado ->10','35.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (77,0,0,4,'AP',10.00,1,0,'Dolares',10.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (78,62,0,0,'P',0.00,1,0,'Dolares',0.00,285.40,4000.00,'Anulado ->7','0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (79,63,0,0,'P',8.00,15,0,'PTO VENTA BNC',2283.20,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (80,64,0,0,'P',38.50,15,0,'PTO VENTA BNC',10987.90,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (81,65,0,0,'P',12.00,15,0,'PTO VENTA BNC',3424.80,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (82,66,0,0,'P',20.00,1,0,'Dolares',20.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (83,0,0,13,'P',4.00,1,0,'Dolares',4.00,285.40,4000.00,'Doc. Anulado ->4','0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (84,67,0,0,'P',30.00,1,0,'Dolares',30.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (85,68,0,0,'P',40.00,13,0,'transferencia bnc',11416.00,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (86,69,0,0,'P',6.50,15,0,'PTO VENTA BNC',1855.10,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (87,70,0,0,'P',20.00,1,0,'Dolares',20.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (88,71,0,0,'P',110.00,1,0,'Dolares',110.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (89,0,0,2,'AP',13.00,1,0,'Dolares',13.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (90,0,0,2,'AP',4.50,16,0,'DESC. FACT.',4.50,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (91,0,0,14,'AP',0.00,1,0,'Dolares',0.00,285.40,4000.00,'Doc. Anulado ->5','2.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (92,0,0,15,'AP',0.00,1,0,'Dolares',0.00,285.40,4000.00,'Doc. Anulado ->5','2.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (93,0,0,16,'AP',10.00,1,0,'Dolares',10.00,285.40,4000.00,NULL,'25.00','2026-10-04 15:17:54','2025-12-20',0,'Administracion'),
 (94,73,0,0,'P',40.00,15,0,'PTO VENTA BNC',11416.00,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-21',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (95,74,0,0,'P',15.00,1,0,'Dolares',15.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-21',0,'Administracion'),
 (96,75,0,0,'P',15.00,1,0,'Dolares',15.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-21',0,'Administracion'),
 (97,76,0,0,'P',13.00,15,0,'PTO VENTA BNC',3710.20,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-21',0,'Administracion'),
 (98,77,0,0,'P',48.00,15,0,'PTO VENTA BNC',13699.20,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-21',0,'Administracion'),
 (99,78,0,0,'P',15.00,1,0,'Dolares',15.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-21',0,'Administracion'),
 (100,79,0,0,'P',15.00,1,0,'Dolares',15.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-21',0,'Administracion'),
 (101,80,0,0,'P',110.00,1,0,'Dolares',110.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (102,82,0,0,'P',67.00,13,0,'transferencia bnc',19121.80,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion'),
 (103,83,0,0,'P',90.00,1,0,'Dolares',90.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion'),
 (104,84,0,0,'P',10.00,1,0,'Dolares',10.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion'),
 (105,85,0,0,'P',48.00,15,0,'PTO VENTA BNC',13699.20,285.40,4000.00,'Tc: 285.4','0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion'),
 (106,87,0,0,'P',140.00,1,0,'Dolares',140.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion'),
 (107,88,0,0,'P',64.00,15,0,'PTO VENTA BNC',23745.28,285.40,4000.00,'Tc: 371.02','0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion'),
 (108,89,0,0,'P',4.00,1,0,'Dolares',4.00,285.40,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (109,90,0,0,'P',100.00,1,0,'Dolares',100.00,288.45,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion'),
 (110,90,0,0,'P',5.00,15,0,'PTO VENTA BNC',1442.25,288.45,4000.00,'Tc: 288.45','0.00','2026-10-04 15:17:54','2025-12-22',0,'Administracion'),
 (111,92,0,0,'P',25.00,1,0,'Dolares',25.00,288.45,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (112,93,0,0,'P',64.00,15,0,'PTO VENTA BNC',18460.80,288.45,4000.00,'Tc: 288.45','0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (113,94,0,0,'P',20.00,1,0,'Dolares',20.00,288.45,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (114,95,0,0,'P',20.00,1,0,'Dolares',20.00,288.45,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (115,96,0,0,'P',7.00,1,0,'Dolares',7.00,288.45,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (116,97,0,0,'P',1.00,1,0,'Dolares',1.00,288.45,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (117,98,0,0,'P',4.00,15,0,'PTO VENTA BNC',1153.80,288.45,4000.00,'Tc: 288.45','0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (118,0,0,16,'AP',10.00,1,0,'Dolares',10.00,288.45,4000.00,NULL,'15.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (119,100,0,0,'P',13.00,15,0,'PTO VENTA BNC',3749.85,288.45,4000.00,'Tc: 288.45','0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (120,101,0,0,'P',30.00,13,0,'transferencia bnc',8653.50,288.45,4000.00,'Tc: 288.45','0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (121,102,0,0,'P',20.00,2,0,'Dolares Transf.',20.00,288.45,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-23',0,'Administracion'),
 (122,103,0,0,'P',4.00,1,0,'Dolares',4.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (123,106,0,0,'P',80.00,15,0,'PTO VENTA BNC',23308.00,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (124,107,0,0,'P',20.00,1,0,'Dolares',20.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (125,109,0,0,'P',55.00,13,0,'transferencia bnc',16024.25,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (126,0,0,9,'AP',48.00,1,0,'Dolares',48.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (127,110,0,0,'P',10.00,1,0,'Dolares',10.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (128,112,0,0,'P',12.00,1,0,'Dolares',12.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (129,113,0,0,'P',40.00,13,0,'transferencia bnc',11654.00,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (130,115,0,0,'P',30.00,15,0,'PTO VENTA BNC',8740.50,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (131,116,0,0,'P',15.00,15,0,'PTO VENTA BNC',4370.25,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (132,117,0,0,'P',40.00,15,0,'PTO VENTA BNC',11654.00,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (133,118,0,0,'P',15.00,1,0,'Dolares',15.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (134,32,0,0,'A',5.00,1,0,'Dolares',5.00,291.35,4000.00,NULL,'8.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (135,119,0,0,'P',1.00,15,0,'PTO VENTA BNC',291.35,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (136,121,0,0,'P',25.00,1,0,'Dolares',25.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (137,122,0,0,'P',30.00,13,0,'transferencia bnc',8740.50,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (138,123,0,0,'P',30.00,4,0,'Bolivares Efect.',8740.50,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (139,19,0,0,'A',10.00,13,0,'transferencia bnc',2913.50,291.35,4000.00,'Tc: 291.35','16.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (140,124,0,0,'P',52.00,15,0,'PTO VENTA BNC',15150.20,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (141,125,0,0,'P',12.00,15,0,'PTO VENTA BNC',3496.20,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (142,111,0,0,'A',10.00,15,0,'PTO VENTA BNC',2913.50,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (143,126,0,0,'P',6.00,1,0,'Dolares',6.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (144,128,0,0,'P',65.00,13,0,'transferencia bnc',18937.75,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (145,129,0,0,'P',35.00,13,0,'transferencia bnc',10197.25,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-24',0,'Administracion'),
 (146,130,0,0,'P',4.00,1,0,'Dolares',4.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-26',0,'Administracion'),
 (147,131,0,0,'P',4.00,1,0,'Dolares',4.00,291.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-26',0,'Administracion'),
 (148,86,0,0,'A',0.00,13,0,'transferencia bnc',0.00,291.35,4000.00,'Anulado ->70','75.00','2026-10-04 15:17:54','2025-12-26',0,'Administracion'),
 (149,86,0,0,'A',70.00,15,0,'PTO VENTA BNC',20394.50,291.35,4000.00,'Tc: 291.35','75.00','2026-10-04 15:17:54','2025-12-26',0,'Administracion'),
 (150,133,0,0,'P',50.40,15,0,'PTO VENTA BNC',14684.04,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-26',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (151,134,0,0,'P',22.00,15,0,'PTO VENTA BNC',6409.70,291.35,4000.00,'Tc: 291.35','0.00','2026-10-04 15:17:54','2025-12-26',0,'Administracion'),
 (152,19,0,0,'A',10.00,13,0,'transferencia bnc',2914.00,291.35,4000.00,'Tc: 291.35','6.00','2026-10-04 15:17:54','2025-12-26',0,'Administracion'),
 (153,135,0,0,'P',7.00,1,0,'Dolares',7.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-27',0,'Administracion'),
 (154,136,0,0,'P',35.00,1,0,'Dolares',35.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-27',0,'Administracion'),
 (155,137,0,0,'P',20.00,1,0,'Dolares',20.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-27',0,'Administracion'),
 (156,138,0,0,'P',36.00,15,0,'PTO VENTA BNC',10618.56,294.96,4000.00,'Tc: 294.96','0.00','2026-10-04 15:17:54','2025-12-28',0,'Administracion'),
 (157,139,0,0,'P',13.00,1,0,'Dolares',13.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-28',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (158,140,0,0,'P',0.00,1,0,'Dolares',0.00,294.96,4000.00,'Anulado ->0','0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (159,81,0,0,'A',44.50,1,0,'Dolares',44.50,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (160,141,0,0,'P',40.00,1,0,'Dolares',40.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (161,142,0,0,'P',20.00,1,0,'Dolares',20.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (162,143,0,0,'P',10.00,1,0,'Dolares',10.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (163,144,0,0,'P',25.00,1,0,'Dolares',25.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (164,145,0,0,'P',50.00,15,0,'PTO VENTA BNC',14748.00,294.96,4000.00,'Tc: 294.96','0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (165,0,0,10,'AP',10.00,1,0,'Dolares',10.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (166,0,0,10,'AP',4.00,16,0,'DESC. FACT.',4.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (167,146,0,0,'P',25.00,1,0,'Dolares',25.00,294.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-29',0,'Administracion'),
 (168,148,0,0,'P',37.00,15,0,'PTO VENTA BNC',11031.18,298.14,4000.00,'Tc: 298.14','0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (169,150,0,0,'P',28.00,1,0,'Dolares',28.00,298.14,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (170,151,0,0,'P',30.00,15,0,'PTO VENTA BNC',8944.20,298.14,4000.00,'Tc: 298.14','0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (171,152,0,0,'P',25.00,1,0,'Dolares',25.00,298.14,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (172,0,0,16,'AP',15.00,1,0,'Dolares',15.00,298.14,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (173,153,0,0,'P',10.00,1,0,'Dolares',10.00,298.14,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (174,154,0,0,'P',67.00,1,0,'Dolares',67.00,298.14,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (175,155,0,0,'P',15.00,15,0,'PTO VENTA BNC',4472.10,298.14,4000.00,'Tc: 298.14','0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (176,157,0,0,'P',30.00,15,0,'PTO VENTA BNC',9041.10,301.37,4000.00,'Tc: 301.37','0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (177,158,0,0,'P',30.00,15,0,'PTO VENTA BNC',9051.00,301.37,4000.00,'Tc: 301.7','0.00','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (178,105,0,0,'A',17.00,13,0,'transferencia bnc',5068.38,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (179,114,0,0,'A',20.00,13,0,'transferencia bnc',5962.80,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2025-12-30',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (180,127,0,0,'A',63.00,13,0,'transferencia bnc',18782.82,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2025-12-30',0,'Administracion'),
 (181,159,0,0,'P',0.00,1,0,'Dolares',0.00,301.37,4000.00,'Anulado ->65','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (182,161,0,0,'P',5.00,1,0,'Dolares',5.00,301.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (183,162,0,0,'P',34.00,1,0,'Dolares',34.00,301.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (184,163,0,0,'P',60.00,15,0,'PTO VENTA BNC',18102.00,301.37,4000.00,'Tc: 301.7','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (185,164,0,0,'P',15.00,1,0,'Dolares',15.00,301.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (186,165,0,0,'P',20.00,15,0,'PTO VENTA BNC',6034.00,301.37,4000.00,'Tc: 301.7','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (187,166,0,0,'P',0.00,15,0,'PTO VENTA BNC',0.00,301.37,4000.00,'Anulado ->15','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (188,167,0,0,'P',65.00,1,0,'Dolares',65.00,301.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (189,168,0,0,'P',15.00,15,0,'PTO VENTA BNC',4525.50,301.37,4000.00,'Tc: 301.7','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (190,169,0,0,'P',25.00,13,0,'transferencia bnc',7534.25,301.37,4000.00,'Tc: 301.37','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (191,170,0,0,'P',7.00,13,0,'transferencia bnc',2109.59,301.37,4000.00,'Tc: 301.37','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (192,19,0,0,'A',6.00,13,0,'transferencia bnc',1808.22,301.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (193,171,0,0,'P',15.00,13,0,'transferencia bnc',4520.55,301.37,4000.00,'Tc: 301.37','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (194,172,0,0,'P',20.00,13,0,'transferencia bnc',6027.40,301.37,4000.00,'Tc: 301.37','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (195,173,0,0,'P',25.00,1,0,'Dolares',25.00,301.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (196,174,0,0,'P',25.00,13,0,'transferencia bnc',7534.25,301.37,4000.00,'Tc: 301.37','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (197,175,0,0,'P',26.00,13,0,'transferencia bnc',7835.62,301.37,4000.00,'Tc: 301.37','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (198,176,0,0,'P',4.00,1,0,'Dolares',4.00,301.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (199,177,0,0,'P',7.00,13,0,'transferencia bnc',2109.59,301.37,4000.00,'Tc: 301.37','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (200,178,0,0,'P',0.00,15,0,'PTO VENTA BNC',0.00,301.37,4000.00,'Anulado ->20','0.00','2026-10-04 15:17:54','2026-01-13',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (201,179,0,0,'P',30.00,1,0,'Dolares',30.00,301.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (202,132,0,0,'A',56.00,13,0,'transferencia bnc',18500.72,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-01-10',0,'Administracion'),
 (203,180,0,0,'P',20.00,15,0,'PTO VENTA BNC',6034.00,330.37,4000.00,'Tc: 301.7','0.00','2026-10-04 15:17:54','2026-01-13',0,'Administracion'),
 (204,181,0,0,'P',10.00,1,0,'Dolares',10.00,330.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-01-13',0,'Administracion'),
 (205,182,0,0,'P',25.00,1,0,'Dolares',25.00,341.74,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-01-17',0,'Administracion'),
 (206,86,0,0,'A',50.00,13,0,'transferencia bnc',17225.36,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-01-17',0,'Administracion'),
 (207,183,0,0,'P',10.00,1,0,'Dolares',10.00,344.51,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-01-18',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (208,184,0,0,'P',28.80,15,0,'PTO VENTA BNC',10001.09,347.26,4000.00,'Tc: 347.26','0.00','2026-10-04 15:17:54','2026-01-21',0,'Administracion'),
 (209,185,0,0,'P',42.00,1,0,'Dolares',42.00,347.26,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-01-21',0,'Administracion'),
 (210,186,0,0,'P',48.00,15,0,'PTO VENTA BNC',16796.64,349.93,4000.00,'Tc: 349.93','0.00','2026-10-04 15:17:54','2026-01-22',0,'Administracion'),
 (211,187,0,0,'P',18.00,1,0,'Dolares',18.00,349.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-01-22',0,'Administracion'),
 (212,127,0,0,'A',2.00,1,0,'Dolares',2.00,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-01-22',0,'Administracion'),
 (213,188,0,0,'P',20.00,1,0,'Dolares',20.00,355.55,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-01-24',0,'Administracion'),
 (214,0,0,17,'AP',5.00,1,0,'Dolares',5.00,355.55,4000.00,NULL,'10.00','2026-10-04 15:17:54','2026-01-24',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (215,189,0,0,'P',6.50,15,0,'PTO VENTA BNC',2311.08,355.55,4000.00,'Tc: 355.55','0.00','2026-10-04 15:17:54','2026-01-24',0,'Administracion'),
 (216,190,0,0,'P',16.00,15,0,'PTO VENTA BNC',5688.80,355.55,4000.00,'Tc: 355.55','0.00','2026-10-04 15:17:54','2026-01-24',0,'Administracion'),
 (217,191,0,0,'P',15.00,1,0,'Dolares',15.00,358.92,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-01-27',0,'Administracion'),
 (218,192,0,0,'P',10.00,1,0,'Dolares',10.00,372.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-03',0,'Administracion'),
 (219,193,0,0,'P',21.00,1,0,'Dolares',21.00,372.10,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-03',0,'Administracion'),
 (220,194,0,0,'P',69.00,15,0,'PTO VENTA BNC',26113.05,378.45,4000.00,'Tc: 378.45','0.00','2026-10-04 15:17:54','2026-02-05',0,'Administracion'),
 (221,195,0,0,'P',15.00,1,0,'Dolares',15.00,378.45,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-05',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (222,0,0,17,'AP',10.00,1,0,'Dolares',10.00,381.11,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-07',0,'Administracion'),
 (223,196,0,0,'P',35.00,13,0,'transferencia bnc',13484.45,385.27,4000.00,'Tc: 385.27','0.00','2026-10-04 15:17:54','2026-02-10',0,'Administracion'),
 (224,127,0,0,'A',2.00,1,0,'Dolares',2.00,388.74,4000.00,NULL,'56.00','2026-10-04 15:17:54','2026-02-12',0,'Administracion'),
 (225,198,0,0,'P',15.00,1,0,'Dolares',15.00,390.29,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-12',0,'Administracion'),
 (226,199,0,0,'P',20.00,1,0,'Dolares',20.00,530.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-12',0,'Administracion'),
 (227,199,0,0,'P',5.00,13,0,'transferencia bnc',2650.00,530.00,4000.00,'Tc: 530','0.00','2026-10-04 15:17:54','2026-02-12',0,'Administracion'),
 (228,201,0,0,'A',10.00,1,0,'Dolares',10.00,396.37,4000.00,NULL,'10.00','2026-10-04 15:17:54','2026-02-14',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (229,0,0,18,'AP',20.00,1,0,'Dolares',20.00,396.37,4000.00,NULL,'5.00','2026-10-04 15:17:54','2026-02-18',0,'Administracion'),
 (230,203,0,0,'P',10.00,1,0,'Dolares',10.00,402.33,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-20',0,'Administracion'),
 (231,205,0,0,'P',25.00,1,0,'Dolares',25.00,405.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-21',0,'Administracion'),
 (232,206,0,0,'P',25.00,1,0,'Dolares',25.00,405.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-21',0,'Administracion'),
 (233,204,0,0,'A',27.00,1,0,'Dolares',27.00,405.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-21',0,'Administracion'),
 (234,208,0,0,'P',15.00,1,0,'Dolares',15.00,417.36,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-02-27',0,'Administracion'),
 (235,209,0,0,'P',5.00,1,0,'Dolares',5.00,421.88,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-03',0,'Administracion'),
 (236,210,0,0,'P',2.00,1,0,'Dolares',2.00,425.67,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-04',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (237,213,0,0,'P',30.00,1,0,'Dolares',30.00,433.17,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-07',0,'Administracion'),
 (238,213,0,0,'P',2.00,16,0,'DESC. FACT.',2.00,433.17,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-07',0,'Administracion'),
 (239,8,0,0,'A',186.50,1,0,'Dolares',186.50,0.00,0.00,'','0','2026-10-04 15:17:54','2026-03-07',0,'Administracion'),
 (240,91,0,0,'A',100.00,1,0,'Dolares',100.00,0.00,0.00,'','0','2026-10-04 15:17:54','2026-03-07',0,'Administracion'),
 (241,108,0,0,'A',195.00,1,0,'Dolares',195.00,0.00,0.00,'','0','2026-10-04 15:17:54','2026-03-07',0,'Administracion'),
 (242,28,0,0,'A',35.00,1,0,'Dolares',35.00,0.00,0.00,'','0','2026-10-04 15:17:54','2026-03-07',0,'Administracion'),
 (243,29,0,0,'A',15.00,1,0,'Dolares',15.00,0.00,0.00,'','0','2026-10-04 15:17:54','2026-03-07',0,'Administracion'),
 (244,72,0,0,'A',4.00,1,0,'Dolares',4.00,0.00,0.00,'','0','2026-10-04 15:17:54','2026-03-07',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (245,214,0,0,'P',35.00,1,0,'Dolares',35.00,433.17,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-07',0,'Administracion'),
 (246,212,0,0,'A',0.00,1,0,'Dolares',0.00,433.17,4000.00,'Anulado ->45','0.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (247,14,0,0,'A',0.00,1,0,'Dolares',0.00,0.00,0.00,'Anulado ->34','0','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (248,160,0,0,'A',0.00,1,0,'Dolares',0.00,0.00,0.00,'Anulado ->30','0','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (249,14,0,0,'A',0.00,1,0,'Dolares',0.00,433.17,4000.00,'Anulado ->25','9.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (250,212,0,0,'A',0.00,1,0,'Dolares',0.00,433.17,4000.00,'Anulado ->45','0.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (251,14,0,0,'A',0.00,1,0,'Dolares',0.00,0.00,0.00,'Anulado ->34','0','2026-10-04 15:17:54','2026-03-10',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (252,160,0,0,'A',0.00,1,0,'Dolares',0.00,0.00,0.00,'Anulado ->21','0','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (253,0,0,18,'AP',5.00,1,0,'Dolares',5.00,433.17,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (254,160,0,0,'A',30.00,15,0,'PTO VENTA BNC',9051.00,433.17,4000.00,'Tc: 301.70','0.00','2026-10-04 15:17:54','2025-12-31',0,'Administracion'),
 (255,14,0,0,'A',34.00,1,0,'Dolares',34.00,433.17,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (256,212,0,0,'A',45.00,1,0,'Dolares',45.00,433.17,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (257,197,0,0,'A',10.00,1,0,'Dolares',10.00,436.24,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (258,216,0,0,'P',25.00,3,0,'Pesos',100000.00,436.24,4000.00,'Tc: 4000','0.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion'),
 (259,216,0,0,'P',5.00,1,0,'Dolares',5.00,436.24,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-10',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (260,218,0,0,'P',25.00,1,0,'Dolares',25.00,440.97,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-12',0,'Administracion'),
 (261,86,0,0,'A',10.00,13,0,'transferencia bnc',4468.00,446.80,4000.00,'Tc: 446.8','15.00','2026-10-04 15:17:54','2026-03-14',0,'Administracion'),
 (262,201,0,0,'A',10.00,13,0,'transferencia bnc',6200.00,620.00,4000.00,'Tc: 620','0.00','2026-10-04 15:17:54','2026-03-14',0,'Administracion'),
 (263,149,0,0,'A',35.00,13,0,'transferencia bnc',15638.00,446.80,4000.00,'Tc: 446.8','19.00','2026-10-04 15:17:54','2026-03-14',0,'Administracion'),
 (264,32,0,0,'A',8.00,1,0,'Dolares',8.00,446.80,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-14',0,'Administracion'),
 (265,220,0,0,'P',25.00,1,0,'Dolares',25.00,455.25,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-19',0,'Administracion'),
 (266,221,0,0,'P',17.59,13,0,'transferencia bnc',8007.85,455.25,4000.00,'Tc: 455.25','0.00','2026-10-04 15:17:54','2026-03-19',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (267,222,0,0,'P',34.00,1,0,'Dolares',34.00,455.25,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-19',0,'Administracion'),
 (268,223,0,0,'A',5.00,1,0,'Dolares',5.00,455.25,4000.00,NULL,'10.00','2026-10-04 15:17:54','2026-03-19',0,'Administracion'),
 (269,224,0,0,'P',12.00,1,0,'Dolares',12.00,457.08,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-22',0,'Administracion'),
 (270,225,0,0,'P',25.87,15,0,'PTO VENTA BNC',11824.66,457.08,4000.00,'Tc: 457.08','0.00','2026-10-04 15:17:54','2026-03-22',0,'Administracion'),
 (271,226,0,0,'P',32.00,1,0,'Dolares',32.00,462.66,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-25',0,'Administracion'),
 (272,227,0,0,'P',25.00,1,0,'Dolares',25.00,466.60,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-26',0,'Administracion'),
 (273,228,0,0,'P',30.00,1,0,'Dolares',30.00,466.60,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-26',0,'Administracion'),
 (274,229,0,0,'P',5.00,1,0,'Dolares',5.00,466.60,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-26',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (275,231,0,0,'P',35.00,1,0,'Dolares',35.00,468.51,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-27',0,'Administracion'),
 (276,232,0,0,'P',33.82,15,0,'PTO VENTA BNC',15845.01,468.51,4000.00,'Tc: 468.51','0.00','2026-10-04 15:17:54','2026-03-27',0,'Administracion'),
 (277,233,0,0,'P',20.00,1,0,'Dolares',20.00,471.70,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-03-29',0,'Administracion'),
 (278,0,0,19,'AP',5.00,1,0,'Dolares',5.00,473.87,4000.00,NULL,'10.00','2026-10-04 15:17:54','2026-03-31',0,'Administracion'),
 (279,235,0,0,'P',16.49,4,0,'Bolivares Efect.',7814.94,473.92,4000.00,'Tc: 473.92','0.00','2026-10-04 15:17:54','2026-04-01',0,'Administracion'),
 (280,236,0,0,'P',15.00,1,0,'Dolares',15.00,473.92,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-01',0,'Administracion'),
 (281,237,0,0,'P',12.00,1,0,'Dolares',12.00,473.92,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-01',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (282,238,0,0,'P',23.00,1,0,'Dolares',23.00,474.06,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-04',0,'Administracion'),
 (283,239,0,0,'P',25.00,1,0,'Dolares',25.00,475.96,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-09',0,'Administracion'),
 (284,86,0,0,'A',15.00,13,0,'transferencia bnc',7146.45,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-04-10',0,'Administracion'),
 (285,149,0,0,'A',19.00,13,0,'transferencia bnc',9052.17,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-04-10',0,'Administracion'),
 (286,240,0,0,'P',40.00,13,0,'transferencia bnc',19057.20,476.43,4000.00,'Tc: 476.43','0.00','2026-10-04 15:17:54','2026-04-10',0,'Administracion'),
 (287,241,0,0,'P',20.00,13,0,'transferencia bnc',9543.00,477.15,4000.00,'Tc: 477.15','0.00','2026-10-04 15:17:54','2026-04-11',0,'Administracion'),
 (288,242,0,0,'P',15.00,1,0,'Dolares',15.00,477.63,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-14',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (289,243,0,0,'P',67.00,1,0,'Dolares',67.00,478.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-15',0,'Administracion'),
 (290,244,0,0,'P',0.00,1,0,'Dolares',0.00,478.58,4000.00,'Anulado ->5','0.00','2026-10-04 15:17:54','2026-04-15',0,'Administracion'),
 (291,244,0,0,'P',0.00,15,0,'PTO VENTA BNC',0.00,478.58,4000.00,'Anulado ->8.1','0.00','2026-10-04 15:17:54','2026-04-15',0,'Administracion'),
 (292,0,0,20,'AP',0.00,1,0,'Dolares',0.00,478.58,4000.00,'Doc. Anulado ->3','4.00','2026-10-04 15:17:54','2026-04-15',0,'Administracion'),
 (293,223,0,0,'A',10.00,1,0,'Dolares',10.00,478.58,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-16',0,'Administracion'),
 (294,245,0,0,'P',25.00,1,0,'Dolares',25.00,480.26,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-17',0,'Administracion'),
 (295,246,0,0,'P',25.82,13,0,'transferencia bnc',12400.31,480.26,4000.00,'Tc: 480.26','0.00','2026-10-04 15:17:54','2026-04-17',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (296,217,0,0,'A',20.00,1,0,'Dolares',20.00,480.26,4000.00,NULL,'40.00','2026-10-04 15:17:54','2026-04-17',0,'Administracion'),
 (297,247,0,0,'P',25.00,1,0,'Dolares',25.00,481.22,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-18',0,'Administracion'),
 (298,211,0,0,'A',45.00,1,0,'Dolares',45.00,481.22,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-19',0,'Administracion'),
 (299,248,0,0,'P',20.00,1,0,'Dolares',20.00,482.76,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-22',0,'Administracion'),
 (300,0,0,21,'AP',0.00,1,0,'Dolares',0.00,483.87,4000.00,'Doc. Anulado ->15','0.00','2026-10-04 15:17:54','2026-04-24',0,'Administracion'),
 (301,0,0,22,'AP',18.00,1,0,'Dolares',18.00,483.87,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-24',0,'Administracion'),
 (302,250,0,0,'P',5.19,13,0,'transferencia bnc',2511.29,483.87,4000.00,'Tc: 483.87','0.00','2026-10-04 15:17:54','2026-04-24',0,'Administracion'),
 (303,264,0,0,'P',6.48,15,0,'PTO VENTA BNC',3141.12,484.74,4000.00,'Tc: 484.74','0.00','2026-10-04 15:17:54','2026-04-25',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (304,265,0,0,'P',38.00,1,0,'Dolares',38.00,484.74,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-25',0,'Administracion'),
 (305,0,0,19,'AP',10.00,1,0,'Dolares',10.00,484.74,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-25',0,'Administracion'),
 (306,266,0,0,'P',15.56,15,0,'PTO VENTA BNC',7542.55,484.74,4000.00,'Tc: 484.74','0.00','2026-10-04 15:17:54','2026-04-25',0,'Administracion'),
 (307,267,0,0,'P',20.00,1,0,'Dolares',20.00,630.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-25',0,'Administracion'),
 (308,267,0,0,'P',5.00,13,0,'transferencia bnc',3150.00,630.00,4000.00,'Tc: 630','0.00','2026-10-04 15:17:54','2026-04-25',0,'Administracion'),
 (309,268,0,0,'P',27.00,1,0,'Dolares',27.00,484.74,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-28',0,'Administracion'),
 (310,234,0,0,'A',5.00,13,0,'transferencia bnc',3150.00,630.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-04-29',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (311,269,0,0,'P',2.00,3,0,'Pesos',8000.00,486.20,4000.00,'Tc: 4000','0.00','2026-10-04 15:17:54','2026-04-29',0,'Administracion'),
 (312,0,0,23,'AP',1.00,1,0,'Dolares',1.00,640.00,4000.00,NULL,'0.99','2026-10-04 15:17:54','2026-04-29',0,'Administracion'),
 (313,0,0,23,'AP',0.38,4,0,'Bolivares Efect.',240.00,640.00,4000.00,'Tc: 640','0.99','2026-10-04 15:17:54','2026-04-29',0,'Administracion'),
 (314,0,0,23,'AP',1.62,15,0,'PTO VENTA BNC',1040.00,640.00,4000.00,'Tc: 640','0.99','2026-10-04 15:17:54','2026-04-29',0,'Administracion'),
 (315,272,0,0,'P',6.48,13,0,'transferencia bnc',3172.28,489.55,4000.00,'Tc: 489.55','0.00','2026-10-04 15:17:54','2026-05-02',0,'Administracion'),
 (316,273,0,0,'P',20.00,1,0,'Dolares',20.00,489.55,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-03',0,'Administracion'),
 (317,274,0,0,'P',12.00,1,0,'Dolares',12.00,494.11,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-06',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (318,263,0,0,'A',45.00,1,0,'Dolares',45.00,494.11,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-06',0,'Administracion'),
 (319,275,0,0,'P',17.00,1,0,'Dolares',17.00,494.11,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-06',0,'Administracion'),
 (320,276,0,0,'P',20.00,1,0,'Dolares',20.00,494.11,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-06',0,'Administracion'),
 (321,277,0,0,'P',55.00,1,0,'Dolares',55.00,500.46,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-10',0,'Administracion'),
 (322,279,0,0,'P',24.00,1,0,'Dolares',24.00,504.91,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-12',0,'Administracion'),
 (323,0,0,23,'AP',0.99,4,0,'Bolivares Efect.',633.60,640.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-13',0,'Administracion'),
 (324,283,0,0,'P',25.00,1,0,'Dolares',25.00,510.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-15',0,'Administracion'),
 (325,284,0,0,'P',95.11,13,0,'transferencia bnc',48581.24,510.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-15',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (326,285,0,0,'A',20.00,1,0,'Dolares',20.00,517.96,4000.00,NULL,'25.00','2026-10-04 15:17:54','2026-05-16',0,'Administracion'),
 (327,286,0,0,'P',30.94,13,0,'transferencia bnc',16025.68,517.96,4000.00,'Tc: 517.96','0.00','2026-10-04 15:17:54','2026-05-19',0,'Administracion'),
 (328,0,0,24,'AP',10.00,1,0,'Dolares',10.00,520.91,4000.00,NULL,'15.00','2026-10-04 15:17:54','2026-05-20',0,'Administracion'),
 (329,271,0,0,'A',12.00,13,0,'transferencia bnc',8488.80,707.40,4000.00,'Tc: 707.4','0.00','2026-10-04 15:17:54','2026-05-21',0,'Administracion'),
 (330,287,0,0,'P',16.21,15,0,'PTO VENTA BNC',8540.56,526.87,4000.00,'Tc: 526.87','0.00','2026-10-04 15:17:54','2026-05-22',0,'Administracion'),
 (331,288,0,0,'P',50.00,1,0,'Dolares',50.00,530.50,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-23',0,'Administracion'),
 (332,289,0,0,'P',4.00,13,0,'transferencia bnc',2952.00,738.00,4000.00,'Tc: 738','0.00','2026-10-04 15:17:54','2026-05-27',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (333,290,0,0,'P',10.00,1,0,'Dolares',10.00,738.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-27',0,'Administracion'),
 (334,291,0,0,'P',15.00,1,0,'Dolares',15.00,738.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-28',0,'Administracion'),
 (335,0,0,24,'AP',15.00,1,0,'Dolares',15.00,549.37,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-05-29',0,'Administracion'),
 (336,293,0,0,'P',20.00,1,0,'Dolares',20.00,557.97,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-02',0,'Administracion'),
 (337,217,0,0,'A',40.00,1,0,'Dolares',40.00,557.97,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-02',0,'Administracion'),
 (338,127,0,0,'A',10.00,1,0,'Dolares',10.00,557.97,4000.00,NULL,'46.00','2026-10-04 15:17:54','2026-06-02',0,'Administracion'),
 (339,294,0,0,'P',4.00,1,0,'Dolares',4.00,558.64,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-03',0,'Administracion'),
 (340,295,0,0,'P',57.00,1,0,'Dolares',57.00,560.38,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-04',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (341,127,0,0,'A',20.00,1,0,'Dolares',20.00,560.38,4000.00,NULL,'26.00','2026-10-04 15:17:54','2026-06-04',0,'Administracion'),
 (342,296,0,0,'P',19.89,13,0,'transferencia bnc',11203.84,563.29,4000.00,'Tc: 563.29','0.00','2026-10-04 15:17:54','2026-06-05',0,'Administracion'),
 (343,297,0,0,'P',22.00,2,0,'Dolares Transf.',22.00,563.29,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-05',0,'Administracion'),
 (344,297,0,0,'P',14.00,1,0,'Dolares',14.00,563.29,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-05',0,'Administracion'),
 (345,298,0,0,'P',20.27,13,0,'transferencia bnc',11506.87,567.68,4000.00,'Tc: 567.68','0.00','2026-10-04 15:17:54','2026-06-06',0,'Administracion'),
 (346,299,0,0,'P',10.00,1,0,'Dolares',10.00,567.68,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-08',0,'Administracion'),
 (347,299,0,0,'P',14.00,15,0,'PTO VENTA BNC',10668.00,567.68,4000.00,'Tc: 762','0.00','2026-10-04 15:17:54','2026-06-08',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (348,300,0,0,'P',10.00,1,0,'Dolares',10.00,572.68,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-10',0,'Administracion'),
 (349,301,0,0,'P',13.87,15,0,'PTO VENTA BNC',8010.62,577.55,4000.00,'Tc: 577.55','0.00','2026-10-04 15:17:54','2026-06-11',0,'Administracion'),
 (350,0,0,25,'P',0.00,1,0,'Dolares',0.00,577.55,4000.00,'Anulado ->10','0.00','2026-10-04 15:17:54','2026-06-12',0,'Administracion'),
 (351,303,0,0,'P',5.00,1,0,'Dolares',5.00,587.41,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-13',0,'Administracion'),
 (352,304,0,0,'P',18.00,1,0,'Dolares',18.00,587.41,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-13',0,'Administracion'),
 (353,305,0,0,'P',12.00,1,0,'Dolares',12.00,587.41,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-13',0,'Administracion'),
 (354,306,0,0,'P',36.00,1,0,'Dolares',36.00,587.41,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-13',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (355,307,0,0,'P',10.00,13,0,'transferencia bnc',7900.00,790.00,4000.00,'Tc: 790','0.00','2026-10-04 15:17:54','2026-06-13',0,'Administracion'),
 (356,308,0,0,'P',10.00,1,0,'Dolares',10.00,587.41,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-13',0,'Administracion'),
 (357,310,0,0,'P',20.50,13,0,'transferencia bnc',12041.90,587.41,4000.00,'Tc: 587.41','0.00','2026-10-04 15:17:54','2026-06-13',0,'Administracion'),
 (358,311,0,0,'P',28.00,1,0,'Dolares',28.00,587.41,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-15',0,'Administracion'),
 (359,312,0,0,'P',49.00,1,0,'Dolares',49.00,587.41,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-15',0,'Administracion'),
 (360,313,0,0,'P',38.00,1,0,'Dolares',38.00,587.41,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-15',0,'Administracion'),
 (361,314,0,0,'P',18.00,1,0,'Dolares',18.00,592.52,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-17',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (362,315,0,0,'P',18.00,1,0,'Dolares',18.00,602.33,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-18',0,'Administracion'),
 (363,316,0,0,'P',7.00,1,0,'Dolares',7.00,780.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-18',0,'Administracion'),
 (364,316,0,0,'P',5.00,15,0,'PTO VENTA BNC',3900.00,780.00,4000.00,'Tc: 780','0.00','2026-10-04 15:17:54','2026-06-18',0,'Administracion'),
 (365,317,0,0,'P',23.67,15,0,'PTO VENTA BNC',14257.15,602.33,4000.00,'Tc: 602.33','0.00','2026-10-04 15:17:54','2026-06-18',0,'Administracion'),
 (366,0,0,26,'AP',5.00,1,0,'Dolares',5.00,602.33,4000.00,NULL,'7.00','2026-10-04 15:17:54','2026-06-18',0,'Administracion'),
 (367,318,0,0,'P',15.00,1,0,'Dolares',15.00,607.39,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-19',0,'Administracion'),
 (368,319,0,0,'A',10.00,1,0,'Dolares',10.00,607.39,4000.00,NULL,'8.00','2026-10-04 15:17:54','2026-06-19',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (369,322,0,0,'A',40.00,1,0,'Dolares',40.00,607.39,4000.00,NULL,'15.00','2026-10-04 15:17:54','2026-06-19',0,'Administracion'),
 (370,325,0,0,'P',33.18,13,0,'transferencia bnc',20320.43,612.43,4000.00,'Tc: 612.43','0.00','2026-10-04 15:17:54','2026-06-20',0,'Administracion'),
 (371,326,0,0,'P',18.57,15,0,'PTO VENTA BNC',11372.83,612.43,4000.00,'Tc: 612.43','0.00','2026-10-04 15:17:54','2026-06-20',0,'Administracion'),
 (372,327,0,0,'P',19.91,15,0,'PTO VENTA BNC',12193.48,612.43,4000.00,'Tc: 612.43','0.00','2026-10-04 15:17:54','2026-06-20',0,'Administracion'),
 (373,329,0,0,'P',23.89,13,0,'transferencia bnc',14630.95,612.43,4000.00,'Tc: 612.43','0.00','2026-10-04 15:17:54','2026-06-22',0,'Administracion'),
 (374,330,0,0,'P',25.00,1,0,'Dolares',25.00,617.64,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-23',0,'Administracion'),
 (375,331,0,0,'P',20.00,1,0,'Dolares',20.00,621.53,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-24',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (376,332,0,0,'A',15.00,1,0,'Dolares',15.00,621.53,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-24',0,'Administracion'),
 (377,333,0,0,'P',20.00,1,0,'Dolares',20.00,621.53,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-25',0,'Administracion'),
 (378,334,0,0,'P',0.00,1,0,'Dolares',0.00,623.02,4000.00,'Anulado ->17','0.00','2026-10-04 15:17:54','2026-06-27',0,'Administracion'),
 (379,335,0,0,'P',74.78,13,0,'transferencia bnc',46589.44,623.02,4000.00,'Tc: 623.02','0.00','2026-10-04 15:17:54','2026-06-27',0,'Administracion'),
 (380,337,0,0,'P',15.00,1,0,'Dolares',15.00,623.02,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-29',0,'Administracion'),
 (381,338,0,0,'P',18.70,15,0,'PTO VENTA BNC',11650.47,623.02,4000.00,'Tc: 623.02','0.00','2026-10-04 15:17:54','2026-06-29',0,'Administracion'),
 (382,339,0,0,'P',50.00,1,0,'Dolares',50.00,623.02,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-30',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (383,339,0,0,'P',1.00,16,0,'DESC. FACT.',1.00,623.02,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-06-30',0,'Administracion'),
 (384,340,0,0,'P',31.00,1,0,'Dolares',31.00,639.70,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-02',0,'Administracion'),
 (385,0,0,27,'AP',20.00,1,0,'Dolares',20.00,652.97,4000.00,NULL,'15.00','2026-10-04 15:17:54','2026-07-03',0,'Administracion'),
 (386,341,0,0,'P',20.00,1,0,'Dolares',20.00,652.97,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-03',0,'Administracion'),
 (387,341,0,0,'P',2.00,15,0,'PTO VENTA BNC',1305.94,652.97,4000.00,'Tc: 652.97','0.00','2026-10-04 15:17:54','2026-07-03',0,'Administracion'),
 (388,342,0,0,'P',44.97,13,0,'transferencia bnc',30000.00,667.05,4000.00,'Tc: 667.05','0.00','2026-10-04 15:17:54','2026-07-04',0,'Administracion'),
 (389,342,0,0,'P',2.39,15,0,'PTO VENTA BNC',1591.49,667.05,4000.00,'Tc: 667.05','0.00','2026-10-04 15:17:54','2026-07-04',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (390,343,0,0,'P',7.10,13,0,'transferencia bnc',4736.05,667.05,4000.00,'Tc: 667.05','0.00','2026-10-04 15:17:54','2026-07-04',0,'Administracion'),
 (391,344,0,0,'P',26.05,13,0,'transferencia bnc',17376.65,667.05,4000.00,'Tc: 667.05','0.00','2026-10-04 15:17:54','2026-07-06',0,'Administracion'),
 (392,0,0,27,'AP',15.00,1,0,'Dolares',15.00,674.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-07',0,'Administracion'),
 (393,346,0,0,'P',50.89,15,0,'PTO VENTA BNC',34347.19,674.93,4000.00,'Tc: 674.93','0.00','2026-10-04 15:17:54','2026-07-07',0,'Administracion'),
 (394,322,0,0,'A',15.00,1,0,'Dolares',15.00,685.94,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-08',0,'Administracion'),
 (395,347,0,0,'P',58.00,1,0,'Dolares',58.00,685.94,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-08',0,'Administracion'),
 (396,348,0,0,'P',62.00,1,0,'Dolares',62.00,685.94,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-08',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (397,349,0,0,'P',25.00,1,0,'Dolares',25.00,700.22,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-09',0,'Administracion'),
 (398,350,0,0,'P',30.00,1,0,'Dolares',30.00,709.69,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-10',0,'Administracion'),
 (399,351,0,0,'P',42.94,13,0,'transferencia bnc',30474.09,709.69,4000.00,'Tc: 709.69','0.00','2026-10-04 15:17:54','2026-07-10',0,'Administracion'),
 (400,352,0,0,'P',11.61,15,0,'PTO VENTA BNC',8239.50,709.69,4000.00,'Tc: 709.69','0.00','2026-10-04 15:17:54','2026-07-10',0,'Administracion'),
 (401,353,0,0,'P',24.00,1,0,'Dolares',24.00,721.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-11',0,'Administracion'),
 (402,354,0,0,'P',23.00,1,0,'Dolares',23.00,721.35,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-13',0,'Administracion'),
 (403,0,0,26,'AP',7.00,15,0,'PTO VENTA BNC',5740.00,721.35,4000.00,'Tc: 820','0.00','2026-10-04 15:17:54','2026-07-13',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (404,0,0,1,'AP',33.00,1,0,'Dolares',33.00,724.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-14',0,'Administracion'),
 (405,0,0,1,'AP',3.00,16,0,'DESC. FACT.',3.00,724.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-14',0,'Administracion'),
 (406,357,0,0,'P',20.00,1,0,'Dolares',20.00,725.75,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-15',0,'Administracion'),
 (407,358,0,0,'P',18.00,1,0,'Dolares',18.00,725.75,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-15',0,'Administracion'),
 (408,0,0,28,'AP',5.00,1,0,'Dolares',5.00,725.75,4000.00,NULL,'15.00','2026-10-04 15:17:54','2026-07-15',0,'Administracion'),
 (409,359,0,0,'P',27.44,15,0,'PTO VENTA BNC',20099.25,732.48,4000.00,'Tc: 732.48','0.00','2026-10-04 15:17:54','2026-07-17',0,'Administracion'),
 (410,99,0,0,'A',150.00,13,0,'transferencia bnc',127650.00,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-07-17',0,'Administracion'),
 (411,200,0,0,'A',39.00,13,0,'transferencia bnc',33189.00,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-07-17',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (412,202,0,0,'A',15.00,13,0,'transferencia bnc',12765.00,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-07-17',0,'Administracion'),
 (413,207,0,0,'A',30.00,13,0,'transferencia bnc',25530.00,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-07-17',0,'Administracion'),
 (414,251,0,0,'A',23.00,13,0,'transferencia bnc',19573.00,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-07-17',0,'Administracion'),
 (415,323,0,0,'A',93.00,13,0,'transferencia bnc',79143.00,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-07-17',0,'Administracion'),
 (416,360,0,0,'A',72.00,13,0,'transferencia bnc',61272.00,0.00,0.00,'Pago Multiple','0','2026-10-04 15:17:54','2026-07-17',0,'Administracion'),
 (417,328,0,0,'A',18.00,13,0,'transferencia bnc',14940.00,732.48,4000.00,'Tc: 830','0.00','2026-10-04 15:17:54','2026-07-18',0,'Administracion'),
 (418,361,0,0,'A',7.50,13,0,'transferencia bnc',6225.00,732.48,4000.00,'Tc: 830','7.50','2026-10-04 15:17:54','2026-07-11',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (419,361,0,0,'A',7.50,13,0,'transferencia bnc',6300.00,732.48,4000.00,'Tc: 840','0.00','2026-10-04 15:17:54','2026-07-17',0,'Administracion'),
 (420,362,0,0,'P',4.00,1,0,'Dolares',4.00,736.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-18',0,'Administracion'),
 (421,0,0,28,'AP',15.00,1,0,'Dolares',15.00,736.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-18',0,'Administracion'),
 (422,364,0,0,'P',25.00,1,0,'Dolares',25.00,736.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-18',0,'Administracion'),
 (423,365,0,0,'P',7.00,1,0,'Dolares',7.00,736.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-18',0,'Administracion'),
 (424,367,0,0,'P',30.00,1,0,'Dolares',30.00,736.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-18',0,'Administracion'),
 (425,368,0,0,'P',100.00,1,0,'Dolares',100.00,736.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-18',0,'Administracion'),
 (426,369,0,0,'P',6.78,15,0,'PTO VENTA BNC',4996.39,736.93,4000.00,'Tc: 736.93','0.00','2026-10-04 15:17:54','2026-07-19',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (427,370,0,0,'P',11.30,13,0,'transferencia bnc',8327.31,736.93,4000.00,'Tc: 736.93','0.00','2026-10-04 15:17:54','2026-07-19',0,'Administracion'),
 (428,372,0,0,'P',50.00,1,0,'Dolares',50.00,736.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-19',0,'Administracion'),
 (429,373,0,0,'P',5.64,15,0,'PTO VENTA BNC',4156.29,736.93,4000.00,'Tc: 736.93','0.00','2026-10-04 15:17:54','2026-07-19',0,'Administracion'),
 (430,374,0,0,'A',32.00,1,0,'Dolares',32.00,736.93,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-20',0,'Administracion'),
 (431,379,0,0,'P',20.00,1,0,'Dolares',20.00,737.23,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-21',0,'Administracion'),
 (432,380,0,0,'P',21.00,1,0,'Dolares',21.00,737.88,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-23',0,'Administracion'),
 (433,381,0,0,'P',25.00,1,0,'Dolares',25.00,742.23,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-24',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (434,383,0,0,'P',22.61,13,0,'transferencia bnc',16794.93,742.81,4000.00,'Tc: 742.81','0.00','2026-10-04 15:17:54','2026-07-28',0,'Administracion'),
 (435,385,0,0,'P',30.00,1,0,'Dolares',30.00,742.81,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-28',0,'Administracion'),
 (436,386,0,0,'P',10.00,1,0,'Dolares',10.00,742.81,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-28',0,'Administracion'),
 (437,387,0,0,'P',33.68,13,0,'transferencia bnc',25065.67,744.23,4000.00,'Tc: 744.23','0.00','2026-10-04 15:17:54','2026-07-29',0,'Administracion'),
 (438,388,0,0,'P',27.00,15,0,'PTO VENTA BNC',20094.21,744.23,4000.00,'Tc: 744.23','0.00','2026-10-04 15:17:54','2026-07-29',0,'Administracion'),
 (439,389,0,0,'P',20.00,1,0,'Dolares',20.00,744.23,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-30',0,'Administracion'),
 (440,390,0,0,'P',7.00,13,0,'transferencia bnc',5219.48,745.64,4000.00,'Tc: 745.64','0.00','2026-10-04 15:17:54','2026-07-30',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (441,391,0,0,'P',15.00,15,0,'PTO VENTA BNC',11184.60,745.64,4000.00,'Tc: 745.64','0.00','2026-10-04 15:17:54','2026-07-30',0,'Administracion'),
 (442,392,0,0,'P',38.00,1,0,'Dolares',38.00,746.63,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-07-31',0,'Administracion'),
 (443,393,0,0,'P',44.72,15,0,'PTO VENTA BNC',33485.89,748.79,4000.00,'Tc: 748.79','0.00','2026-10-04 15:17:54','2026-08-01',0,'Administracion'),
 (444,0,0,29,'AP',13.35,13,0,'transferencia bnc',10000.00,748.79,4000.00,NULL,'9.65','2026-10-04 15:17:54','2026-08-01',0,'Administracion'),
 (445,319,0,0,'A',8.00,15,0,'PTO VENTA BNC',6800.00,748.79,4000.00,'Tc: 850','0.00','2026-10-04 15:17:54','2026-08-01',0,'Administracion'),
 (446,394,0,0,'P',17.00,15,0,'PTO VENTA BNC',12729.43,748.79,4000.00,'Tc: 748.79','0.00','2026-10-04 15:17:54','2026-08-01',0,'Administracion'),
 (447,382,0,0,'A',50.00,1,0,'Dolares',50.00,748.79,4000.00,NULL,'4.00','2026-10-04 15:17:54','2026-08-01',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (448,396,0,0,'P',10.00,1,0,'Dolares',10.00,748.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-01',0,'Administracion'),
 (449,397,0,0,'P',11.21,15,0,'PTO VENTA BNC',8393.94,748.79,4000.00,'Tc: 748.79','0.00','2026-10-04 15:17:54','2026-08-01',0,'Administracion'),
 (450,398,0,0,'P',17.00,13,0,'transferencia bnc',12729.43,748.79,4000.00,'Tc: 748.79','0.00','2026-10-04 15:17:54','2026-08-03',0,'Administracion'),
 (451,156,0,0,'A',75.00,13,0,'transferencia bnc',63750.00,748.79,4000.00,NULL,'45.00','2026-10-04 15:17:54','2026-08-03',0,'Administracion'),
 (452,399,0,0,'P',17.00,1,0,'Dolares',17.00,748.79,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-03',0,'Administracion'),
 (453,400,0,0,'P',33.14,15,0,'PTO VENTA BNC',24924.26,752.09,4000.00,'Tc: 752.09','0.00','2026-10-04 15:17:54','2026-08-04',0,'Administracion'),
 (454,401,0,0,'P',0.00,1,0,'Dolares',0.00,752.09,4000.00,'Anulado ->20','0.00','2026-10-04 15:17:54','2026-08-08',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (455,402,0,0,'P',27.62,13,0,'transferencia bnc',20772.73,752.09,4000.00,'Tc: 752.09','0.00','2026-10-04 15:17:54','2026-08-04',0,'Administracion'),
 (456,403,0,0,'P',22.00,1,0,'Dolares',22.00,752.09,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-04',0,'Administracion'),
 (457,0,0,30,'AP',10.05,13,0,'transferencia bnc',7600.00,755.90,4000.00,'Tc: 755.9','9.95','2026-10-04 15:17:54','2026-08-06',0,'Administracion'),
 (458,0,0,29,'AP',9.65,13,0,'transferencia bnc',7294.44,755.90,4000.00,'Tc: 755.9','0.00','2026-10-04 15:17:54','2026-08-06',0,'Administracion'),
 (459,404,0,0,'P',13.00,13,0,'transferencia bnc',9826.70,755.90,4000.00,'Tc: 755.9','0.00','2026-10-04 15:17:54','2026-08-06',0,'Administracion'),
 (460,405,0,0,'P',15.00,1,0,'Dolares',15.00,756.71,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-07',0,'Administracion'),
 (461,406,0,0,'P',20.00,1,0,'Dolares',20.00,756.71,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-08',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (462,376,0,0,'A',40.00,1,0,'Dolares',40.00,756.71,4000.00,NULL,'35.00','2026-10-04 15:17:54','2026-08-10',0,'Administracion'),
 (463,366,0,0,'A',20.00,1,0,'Dolares',20.00,756.71,4000.00,NULL,'9.00','2026-10-04 15:17:54','2026-08-10',0,'Administracion'),
 (464,0,0,32,'AP',15.00,1,0,'Dolares',15.00,761.22,4000.00,NULL,'35.00','2026-10-04 15:17:54','2026-08-12',0,'Administracion'),
 (465,384,0,0,'A',25.00,13,0,'transferencia bnc',21875.00,761.22,4000.00,'Tc: 875','0.00','2026-10-04 15:17:54','2026-08-12',0,'Administracion'),
 (466,407,0,0,'P',10.00,1,0,'Dolares',10.00,761.22,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-12',0,'Administracion'),
 (467,408,0,0,'P',24.00,13,0,'transferencia bnc',18404.64,766.86,4000.00,'Tc: 766.86','0.00','2026-10-04 15:17:54','2026-08-13',0,'Administracion'),
 (468,127,0,0,'A',0.00,13,0,'transferencia bnc',0.00,0.00,0.00,'Anulado ->20.54','0','2026-10-04 15:17:54','2026-08-14',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (469,127,0,0,'A',18.00,13,0,'transferencia bnc',15840.00,771.07,4000.00,'Tc: 880','8.00','2026-10-04 15:17:54','2026-08-13',0,'Administracion'),
 (470,0,0,32,'AP',35.00,13,0,'transferencia bnc',30800.00,772.54,4000.00,'Tc: 880','0.00','2026-10-04 15:17:54','2026-08-15',0,'Administracion'),
 (471,410,0,0,'P',23.51,15,0,'PTO VENTA BNC',18162.42,772.54,4000.00,'Tc: 772.54','0.00','2026-10-04 15:17:54','2026-08-15',0,'Administracion'),
 (472,411,0,0,'P',60.00,1,0,'Dolares',60.00,772.54,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-15',0,'Administracion'),
 (473,411,0,0,'P',2.00,13,0,'transferencia bnc',1660.00,772.54,4000.00,'Tc: 830','0.00','2026-10-04 15:17:54','2026-08-15',0,'Administracion'),
 (474,413,0,0,'P',16.00,1,0,'Dolares',16.00,773.31,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-18',0,'Administracion'),
 (475,375,0,0,'A',12.00,1,0,'Dolares',12.00,773.31,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-19',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (476,377,0,0,'A',3.00,1,0,'Dolares',3.00,773.31,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-19',0,'Administracion'),
 (477,414,0,0,'P',43.00,1,0,'Dolares',43.00,777.42,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-20',0,'Administracion'),
 (478,415,0,0,'A',12.00,1,0,'Dolares',12.00,777.42,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-20',0,'Administracion'),
 (479,416,0,0,'P',61.00,1,0,'Dolares',61.00,777.42,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-21',0,'Administracion'),
 (480,419,0,0,'P',17.41,15,0,'PTO VENTA BNC',13660.93,784.66,4000.00,'Tc: 784.66','0.00','2026-10-04 15:17:54','2026-08-22',0,'Administracion'),
 (481,420,0,0,'P',35.00,1,0,'Dolares',35.00,784.66,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-22',0,'Administracion'),
 (482,0,0,30,'AP',9.95,13,0,'transferencia bnc',8557.00,784.66,4000.00,'Tc: 860','0.00','2026-10-04 15:17:54','2026-08-24',0,'Administracion'),
 (483,156,0,0,'A',17.00,1,0,'Dolares',17.00,784.66,4000.00,NULL,'28.00','2026-10-04 15:17:54','2026-08-24',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (484,421,0,0,'P',20.00,1,0,'Dolares',20.00,791.32,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-08-27',0,'Administracion'),
 (485,422,0,0,'P',5.00,13,0,'transferencia bnc',4650.00,791.32,4000.00,'Tc: 930','0.00','2026-10-04 15:17:54','2026-08-29',0,'Administracion'),
 (486,423,0,0,'P',25.00,13,0,'transferencia bnc',19874.75,794.99,4000.00,'Tc: 794.99','0.00','2026-10-04 15:17:54','2026-08-29',0,'Administracion'),
 (487,418,0,0,'A',22.00,1,0,'Dolares',22.00,798.33,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-01',0,'Administracion'),
 (488,424,0,0,'P',39.00,15,0,'PTO VENTA BNC',31134.87,798.33,4000.00,'Tc: 798.33','0.00','2026-10-04 15:17:54','2026-09-01',0,'Administracion'),
 (489,425,0,0,'P',48.00,1,0,'Dolares',48.00,798.33,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-01',0,'Administracion'),
 (490,426,0,0,'P',20.00,1,0,'Dolares',20.00,798.33,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-01',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (491,426,0,0,'P',3.00,13,0,'transferencia bnc',2394.99,798.33,4000.00,'Tc: 798.33','0.00','2026-10-04 15:17:54','2026-09-01',0,'Administracion'),
 (492,427,0,0,'P',8.00,1,0,'Dolares',8.00,804.81,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-03',0,'Administracion'),
 (493,428,0,0,'P',23.00,1,0,'Dolares',23.00,804.81,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-03',0,'Administracion'),
 (494,429,0,0,'P',25.00,1,0,'Dolares',25.00,807.39,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-04',0,'Administracion'),
 (495,430,0,0,'P',21.00,13,0,'transferencia bnc',17088.54,813.74,4000.00,'Tc: 813.74','0.00','2026-10-04 15:17:54','2026-09-05',0,'Administracion'),
 (496,431,0,0,'P',18.00,1,0,'Dolares',18.00,813.74,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-05',0,'Administracion'),
 (497,376,0,0,'A',35.00,1,0,'Dolares',35.00,813.74,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-05',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (498,432,0,0,'P',20.00,1,0,'Dolares',20.00,980.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-08',0,'Administracion'),
 (499,432,0,0,'P',10.00,13,0,'transferencia bnc',9800.00,980.00,4000.00,'Tc: 980','0.00','2026-10-04 15:17:54','2026-09-08',0,'Administracion'),
 (500,433,0,0,'P',20.00,1,0,'Dolares',20.00,827.74,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-10',0,'Administracion'),
 (501,434,0,0,'P',21.00,13,0,'transferencia bnc',17382.54,827.74,4000.00,'Tc: 827.74','0.00','2026-10-04 15:17:54','2026-09-10',0,'Administracion'),
 (502,435,0,0,'P',15.00,1,0,'Dolares',15.00,827.74,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-10',0,'Administracion'),
 (503,366,0,0,'A',9.00,1,0,'Dolares',9.00,842.21,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-12',0,'Administracion'),
 (504,437,0,0,'P',12.00,13,0,'transferencia bnc',10106.52,842.21,4000.00,'Tc: 842.21','0.00','2026-10-04 15:17:54','2026-09-14',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (505,438,0,0,'P',11.00,13,0,'transferencia bnc',9264.31,842.21,4000.00,'Tc: 842.21','0.00','2026-10-04 15:17:54','2026-09-14',0,'Administracion'),
 (506,439,0,0,'P',12.00,1,0,'Dolares',12.00,842.21,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-16',0,'Administracion'),
 (507,440,0,0,'P',5.00,1,0,'Dolares',5.00,980.00,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-16',0,'Administracion'),
 (508,441,0,0,'P',6.00,13,0,'transferencia bnc',5880.00,846.51,4000.00,'Tc: 980','0.00','2026-10-04 15:17:54','2026-09-17',0,'Administracion'),
 (509,442,0,0,'P',24.34,15,0,'PTO VENTA BNC',20626.69,847.44,4000.00,'Tc: 847.44','0.00','2026-10-04 15:17:54','2026-09-17',0,'Administracion'),
 (510,443,0,0,'P',25.00,1,0,'Dolares',25.00,848.55,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-18',0,'Administracion'),
 (511,444,0,0,'P',14.21,13,0,'transferencia bnc',12072.25,849.56,4000.00,'Tc: 849.56','0.00','2026-10-04 15:17:54','2026-09-19',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (512,445,0,0,'P',16.00,1,0,'Dolares',16.00,849.56,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-21',0,'Administracion'),
 (513,446,0,0,'P',44.00,1,0,'Dolares',44.00,852.42,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-22',0,'Administracion'),
 (514,447,0,0,'P',27.79,15,0,'PTO VENTA BNC',23688.75,852.42,4000.00,'Tc: 852.42','0.00','2026-10-04 15:17:54','2026-09-22',0,'Administracion'),
 (515,448,0,0,'P',15.23,13,0,'transferencia bnc',12980.00,852.42,4000.00,'Tc: 852.42','0.00','2026-10-04 15:17:54','2026-09-22',0,'Administracion'),
 (516,448,0,0,'P',10.00,1,0,'Dolares',10.00,852.42,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-22',0,'Administracion'),
 (517,448,0,0,'P',0.34,16,0,'DESC. FACT.',0.34,852.42,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-22',0,'Administracion'),
 (518,450,0,0,'P',15.00,1,0,'Dolares',15.00,852.42,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-23',0,'Administracion');
INSERT INTO `recibos` (`idrecibo`,`idventa`,`idnota`,`idapartado`,`tiporecibo`,`monto`,`idpago`,`id_banco`,`idbanco`,`recibido`,`tasab`,`tasap`,`referencia`,`aux`,`fecha`,`fecharecibo`,`idcomsion`,`usuario`) VALUES 
 (519,451,0,0,'A',5.00,13,0,'transferencia bnc',4900.00,852.42,4000.00,'Tc: 980','10.00','2026-10-04 15:17:54','2026-09-24',0,'Administracion'),
 (520,436,0,0,'A',5.00,1,0,'Dolares',5.00,852.42,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-09-25',0,'Administracion'),
 (521,0,0,33,'AP',9.99,13,0,'transferencia bnc',8544.60,855.62,4000.00,NULL,'10.01','2026-10-04 15:17:54','2026-09-25',0,'Administracion'),
 (522,453,0,0,'P',20.00,1,0,'Dolares',20.00,860.01,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-10-01',0,'Administracion'),
 (523,0,0,33,'AP',10.01,13,0,'transferencia bnc',12026.81,860.01,4000.00,'Tc: 1201.48','0.00','2026-10-04 15:17:54','2026-10-01',0,'Administracion'),
 (524,451,0,0,'A',10.00,1,0,'Dolares',10.00,866.56,4000.00,NULL,'0.00','2026-10-04 15:17:54','2026-10-02',0,'Administracion');
/*!40000 ALTER TABLE `recibos` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`reciboscomision`
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
-- Dumping data for table `svwebkids`.`reciboscomision`
--

/*!40000 ALTER TABLE `reciboscomision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reciboscomision` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`relacionnc`
--

DROP TABLE IF EXISTS `relacionnc`;
CREATE TABLE `relacionnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmov` int(11) DEFAULT NULL,
  `idnota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`relacionnc`
--

/*!40000 ALTER TABLE `relacionnc` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacionnc` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`relacionncp`
--

DROP TABLE IF EXISTS `relacionncp`;
CREATE TABLE `relacionncp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmov` int(11) DEFAULT NULL,
  `idnota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`relacionncp`
--

/*!40000 ALTER TABLE `relacionncp` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacionncp` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`retenc`
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
-- Dumping data for table `svwebkids`.`retenc`
--

/*!40000 ALTER TABLE `retenc` DISABLE KEYS */;
/*!40000 ALTER TABLE `retenc` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`retenciones`
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
-- Dumping data for table `svwebkids`.`retenciones`
--

/*!40000 ALTER TABLE `retenciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `retenciones` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`retencionventas`
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
-- Dumping data for table `svwebkids`.`retencionventas`
--

/*!40000 ALTER TABLE `retencionventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `retencionventas` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`roles`
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
  `editcompra` int(5) DEFAULT '0',
  `anularrc` int(5) DEFAULT '0',
  `importarne` int(11) DEFAULT '0',
  `editserial` int(11) DEFAULT '0',
  `printcertificado` int(11) DEFAULT '0',
  `crearventa` int(11) DEFAULT '0',
  `crearnotadm` int(5) DEFAULT '0',
  `anularnotadm` int(5) DEFAULT '0',
  `cargarapida` int(5) DEFAULT '0',
  `factsinexis` int(5) DEFAULT '0',
  `anularventa` int(11) DEFAULT '0',
  `anularrv` int(5) DEFAULT '0',
  `cambiarprecioventa` int(11) DEFAULT '0',
  `aplidescuento` int(5) DEFAULT '0',
  `editfecha` int(11) DEFAULT '0',
  `crearpedido` int(11) DEFAULT '0',
  `editpedido` int(11) DEFAULT '0',
  `anularpedido` int(11) DEFAULT '0',
  `importarpedido` int(11) DEFAULT '0',
  `revisionpedido` int(5) DEFAULT '0',
  `crearajuste` int(11) DEFAULT '0',
  `crearajustesal` int(5) DEFAULT '0',
  `anularaj` int(5) DEFAULT '0',
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
  `rvencicobro` int(5) DEFAULT '0',
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
  `rvdivisas` int(11) DEFAULT '0',
  `rcorrelativo` int(11) DEFAULT '0',
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editcompra`,`anularrc`,`importarne`,`editserial`,`printcertificado`,`crearventa`,`crearnotadm`,`anularnotadm`,`cargarapida`,`factsinexis`,`anularventa`,`anularrv`,`cambiarprecioventa`,`aplidescuento`,`editfecha`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`revisionpedido`,`crearajuste`,`crearajustesal`,`anularaj`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rvencicobro`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rvdivisas`,`rcorrelativo`) VALUES 
 (1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1);
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editcompra`,`anularrc`,`importarne`,`editserial`,`printcertificado`,`crearventa`,`crearnotadm`,`anularnotadm`,`cargarapida`,`factsinexis`,`anularventa`,`anularrv`,`cambiarprecioventa`,`aplidescuento`,`editfecha`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`revisionpedido`,`crearajuste`,`crearajustesal`,`anularaj`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rvencicobro`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rvdivisas`,`rcorrelativo`) VALUES 
 (2,2,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,1,1,1,1,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1);
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editcompra`,`anularrc`,`importarne`,`editserial`,`printcertificado`,`crearventa`,`crearnotadm`,`anularnotadm`,`cargarapida`,`factsinexis`,`anularventa`,`anularrv`,`cambiarprecioventa`,`aplidescuento`,`editfecha`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`revisionpedido`,`crearajuste`,`crearajustesal`,`anularaj`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rvencicobro`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rvdivisas`,`rcorrelativo`) VALUES 
 (3,3,1,1,1,1,1,1,1,1,1,1,1,1,0,0,1,1,1,1,0,0,0,0,1,0,1,0,1,1,1,1,1,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1);
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editcompra`,`anularrc`,`importarne`,`editserial`,`printcertificado`,`crearventa`,`crearnotadm`,`anularnotadm`,`cargarapida`,`factsinexis`,`anularventa`,`anularrv`,`cambiarprecioventa`,`aplidescuento`,`editfecha`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`revisionpedido`,`crearajuste`,`crearajustesal`,`anularaj`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rvencicobro`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rvdivisas`,`rcorrelativo`) VALUES 
 (4,4,0,0,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editcompra`,`anularrc`,`importarne`,`editserial`,`printcertificado`,`crearventa`,`crearnotadm`,`anularnotadm`,`cargarapida`,`factsinexis`,`anularventa`,`anularrv`,`cambiarprecioventa`,`aplidescuento`,`editfecha`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`revisionpedido`,`crearajuste`,`crearajustesal`,`anularaj`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rvencicobro`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rvdivisas`,`rcorrelativo`) VALUES 
 (5,5,0,0,0,0,0,1,0,0,1,1,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
INSERT INTO `roles` (`idrol`,`iduser`,`newproveedor`,`editproveedor`,`edoctaproveedor`,`newvendedor`,`editvendedor`,`newcliente`,`editcliente`,`edoctacliente`,`newarticulo`,`editarticulo`,`crearcompra`,`anularcompra`,`editcompra`,`anularrc`,`importarne`,`editserial`,`printcertificado`,`crearventa`,`crearnotadm`,`anularnotadm`,`cargarapida`,`factsinexis`,`anularventa`,`anularrv`,`cambiarprecioventa`,`aplidescuento`,`editfecha`,`crearpedido`,`editpedido`,`anularpedido`,`importarpedido`,`revisionpedido`,`crearajuste`,`crearajustesal`,`anularaj`,`abonarcxc`,`creargasto`,`anulargasto`,`abonarcxp`,`abonargasto`,`newapartado`,`anularapartado`,`abonarapartado`,`comisiones`,`newmoneda`,`editmoneda`,`acttasa`,`actroles`,`rventas`,`ccaja`,`rdetallei`,`rcxc`,`rcompras`,`rdetallec`,`rcxp`,`rarti`,`rlistap`,`rgerencial`,`ranalisisc`,`rutilventa`,`rventasarti`,`rvencicobro`,`rgastos`,`retenciones`,`editret`,`anularret`,`rcompraarti`,`web`,`updatepass`,`newbanco`,`editbanco`,`accesobanco`,`newndbanco`,`newncbanco`,`transferenciabanco`,`anularopbanco`,`resumenbanco`,`rlcompras`,`rlventas`,`rlvalorizado`,`rvdivisas`,`rcorrelativo`) VALUES 
 (6,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`rutas`
--

DROP TABLE IF EXISTS `rutas`;
CREATE TABLE `rutas` (
  `idruta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idruta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`rutas`
--

/*!40000 ALTER TABLE `rutas` DISABLE KEYS */;
INSERT INTO `rutas` (`idruta`,`nombre`,`descripcion`) VALUES 
 (3,'SANTA CRUZ','santa cruz');
/*!40000 ALTER TABLE `rutas` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`seriales`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`seriales`
--

/*!40000 ALTER TABLE `seriales` DISABLE KEYS */;
/*!40000 ALTER TABLE `seriales` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`sistema`
--

DROP TABLE IF EXISTS `sistema`;
CREATE TABLE `sistema` (
  `idempresa` int(11) DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechavence` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`sistema`
--

/*!40000 ALTER TABLE `sistema` DISABLE KEYS */;
INSERT INTO `sistema` (`idempresa`,`fechainicio`,`fechavence`) VALUES 
 (1,'2025-11-10','2026-11-10');
/*!40000 ALTER TABLE `sistema` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`tasassistema`
--

DROP TABLE IF EXISTS `tasassistema`;
CREATE TABLE `tasassistema` (
  `fecha` date DEFAULT NULL,
  `tasadolar` double(15,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`tasassistema`
--

/*!40000 ALTER TABLE `tasassistema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasassistema` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`tipo_gasto`
--

DROP TABLE IF EXISTS `tipo_gasto`;
CREATE TABLE `tipo_gasto` (
  `idgasto` int(11) NOT NULL AUTO_INCREMENT,
  `idclasi` int(11) DEFAULT NULL,
  `nombregasto` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idgasto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`tipo_gasto`
--

/*!40000 ALTER TABLE `tipo_gasto` DISABLE KEYS */;
INSERT INTO `tipo_gasto` (`idgasto`,`idclasi`,`nombregasto`) VALUES 
 (1,1,'Otros Gastos'),
 (2,1,'Servicios Públicos'),
 (3,1,'Nómina y Beneficios'),
 (4,1,'Mantenimiento y Seguridad'),
 (5,2,'Inventario y Materia Prima'),
 (6,2,'Logística y Transporte'),
 (7,2,'Marketing y Publicidad'),
 (8,3,'Impuestos'),
 (9,3,'Asesoria'),
 (10,1,'Alquileres');
/*!40000 ALTER TABLE `tipo_gasto` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nivel` varchar(1) CHARACTER SET utf8mb4 DEFAULT 'L',
  `img` varchar(20) CHARACTER SET utf8mb4 DEFAULT 'avatar5.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `svwebkids`.`users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`nivel`,`img`) VALUES 
 (1,'Nks','Nks@gmail.com',NULL,'$2y$10$mnhllx62RCScWrHnJSacbe8AVrRHlWbbyMXMI7CC2p8o2L6Uvt9aC',NULL,'2023-03-11 04:04:38','2023-03-11 04:04:38','A','puerta.jpg'),
 (2,'gerencia','gerencia@gmail.com',NULL,'$2y$10$Y2IClMhPGc97utbx4eFP8.lv9ftNP8jBfR4Zf8rlAplFXuJsMpoqu',NULL,'2023-03-30 19:11:50','2025-09-29 11:47:26','A','avatar.png'),
 (3,'Administracion','Administracion@gmail.com',NULL,'$2y$10$hBno6ZTHbGhmZ4MFSeQ3GONmAXB4xc6zQW1gY1g36vMxIP7bdbkPm','YlfVnxO6DVHyknTr5EfAZ3E2B5s0ZwHNCFYcsZfTF4aTtlUjOs3AvlZoIqgX','2023-04-24 13:09:31','2023-04-24 13:09:31','A','avatar5.png'),
 (4,'caja3','caja3@gmail.com',NULL,'$2y$10$RwLfyxIUk8GJ7XowCc8dh.fi6HoY8kRJwtNyRIZekIJ3d87.LUGcu',NULL,'2023-04-24 13:23:40','2023-04-24 13:23:40','L','avatar5.png'),
 (5,'caja2','caja2@gmail.com',NULL,'$2y$10$nug8TJoG3o.f35ahugyHx.GhhDFlf2trUuP8qtSST15OjIQntNaPe',NULL,'2023-04-04 19:42:24','2023-04-04 19:42:24','L','avatar3.png'),
 (6,'caja','caja@gmail.com',NULL,'$2y$10$gh5DDTtXNo6U4yHteP3tz.YZc/8QlymPFFrSBotcRWXkSeK1nK2ke',NULL,'2023-04-04 19:21:34','2024-10-02 02:51:21','L','avatar2.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`vendedores`
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
  `activo` int(2) DEFAULT '1',
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`vendedores`
--

/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` (`id_vendedor`,`nombre`,`telefono`,`direccion`,`comision`,`cedula`,`tipo`,`activo`) VALUES 
 (3,'LISETH CONTRERAS','(424) 710-3096','santa cruz de mora',0,'30685899','V',1),
 (4,'ANDREA MARQUEZ','(414) 177-3830','santa cruz de mora',0,'31917028','V',1),
 (5,'GABRIELA MOLINA','(424) 739-4371','SANTA CRUZ DE MORA',0,'21156934','V',1),
 (6,'GENESIS MANRIQUE','(424) 156-3854','SANTA CRUZ DE MORA',0,'22547639','V',1);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;


--
-- Table structure for table `svwebkids`.`venta`
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
  `base` float(12,3) DEFAULT NULL,
  `total_iva` float(9,3) DEFAULT '0.000',
  `texe` float(12,3) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `svwebkids`.`venta`
--

/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (1,1,4,'FAC','A',1,0,'00-',203.740,2.00,0.000,0.000,407.480,0.000,0.000,'2025-11-13 17:50:25','2025-11-13',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (2,1,4,'FAC','A',2,0,'00-',203.740,4.00,0.000,0.000,814.960,0.000,0.000,'2025-11-13 18:01:38','2025-11-13',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (3,3,5,'FAC','A',3,0,'00-',203.740,2.00,0.000,0.000,407.480,0.000,0.000,'2025-11-15 13:34:17','2025-11-15',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (4,244,3,'FAC','A',4,0,'00-',236.840,12.75,0.000,0.000,3019.710,0.000,0.000,'2025-11-25 12:52:11','2025-11-25',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (5,236,3,'FAC','A',5,0,'00-',236.840,47.00,0.000,0.000,11131.480,0.000,0.000,'2025-12-05 19:04:41','2025-12-05',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (6,112,3,'FAC','A',6,0,'00-',0.000,25.00,0.000,0.000,0.000,0.000,0.000,'2025-12-06 16:59:57','2025-12-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (7,251,4,'FAC','A',7,0,'00-',0.000,34.00,0.000,0.000,0.000,0.000,0.000,'2025-12-06 17:34:12','2025-12-06',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (8,112,4,'FAC','A',8,0,'00-',0.000,186.50,0.000,0.000,0.000,0.000,0.000,'2025-12-06 17:38:57','2025-12-06',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (9,4,3,'FAC','A',9,0,'00-',0.000,31.00,0.000,0.000,0.000,0.000,0.000,'2025-12-06 17:46:01','2025-12-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (10,4,3,'FAC','A',10,0,'00-',0.000,185.00,0.000,0.000,0.000,0.000,0.000,'2025-12-06 17:49:36','2025-12-06',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (11,4,3,'FAC','A',11,0,'00-',0.000,13.50,0.000,0.000,0.000,0.000,0.000,'2025-12-06 17:50:56','2025-12-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (12,87,4,'FAC','A',12,0,'00-',0.000,20.00,0.000,0.000,0.000,0.000,0.000,'2025-12-06 17:54:23','2025-12-06',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (13,252,4,'FAC','A',13,0,'00-',0.000,80.00,0.000,0.000,0.000,0.000,0.000,'2025-12-06 17:59:09','2025-12-06',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (14,253,4,'FAC','A',14,0,'00-',0.000,34.00,0.000,0.000,0.000,0.000,0.000,'2025-12-06 18:03:23','2025-12-06',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (15,253,4,'FAC','A',15,0,'00-',0.000,8.50,0.000,0.000,0.000,0.000,0.000,'2025-12-06 18:05:39','2025-12-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (16,161,3,'FAC','A',16,0,'00-',0.000,4.00,0.000,0.000,0.000,0.000,0.000,'2025-12-06 18:26:43','2025-12-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (17,241,3,'FAC','A',17,0,'00-',0.000,80.98,0.000,0.000,0.000,0.000,0.000,'2025-12-06 18:43:52','2025-12-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (18,4,3,'FAC','A',18,0,'00-',0.000,23.00,0.000,0.000,0.000,0.000,0.000,'2025-12-08 10:23:05','2025-12-08',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (19,35,3,'FAC','A',19,0,'00-',0.000,71.00,0.000,0.000,0.000,0.000,0.000,'2025-12-08 16:10:52','2025-12-08',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (20,4,4,'FAC','A',20,0,'00-',257.930,31.00,0.000,0.000,7995.830,0.000,0.000,'2025-12-09 13:38:21','2025-12-09',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (21,4,3,'FAC','A',21,0,'00-',257.930,31.00,0.000,0.000,7995.830,0.000,0.000,'2025-12-09 13:50:26','2025-12-09',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (22,4,4,'FAC','A',22,0,'00-',257.930,58.00,0.000,0.000,14959.940,0.000,0.000,'2025-12-09 14:05:28','2025-12-09',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (23,4,3,'FAC','A',23,0,'00-',257.930,111.50,0.000,0.000,28759.180,0.000,0.000,'2025-12-09 15:54:41','2025-12-09',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (24,156,3,'FAC','A',24,0,'00-',257.930,125.50,0.000,0.000,32370.211,0.000,0.000,'2025-12-09 16:40:18','2025-12-09',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (25,255,4,'FAC','A',25,0,'00-',262.100,163.87,0.000,0.000,42950.301,0.000,0.000,'2025-12-10 14:00:01','2025-12-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (26,252,4,'FAC','A',26,0,'00-',262.100,124.40,0.000,0.000,32605.240,0.000,0.000,'2025-12-10 14:14:57','2025-12-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (27,4,4,'FAC','A',27,0,'00-',262.100,137.00,0.000,0.000,35907.699,0.000,0.000,'2025-12-10 15:27:51','2025-12-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (28,236,3,'FAC','A',28,0,'00-',262.100,35.00,0.000,0.000,9173.500,0.000,0.000,'2025-12-10 18:43:02','2025-12-10',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (29,236,3,'FAC','A',29,0,'00-',262.100,15.00,0.000,0.000,3931.500,0.000,0.000,'2025-12-11 09:28:16','2025-12-11',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (30,250,3,'FAC','A',30,0,'00-',262.100,15.00,0.000,0.000,3931.500,0.000,0.000,'2025-12-11 09:29:50','2025-12-11',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (31,4,4,'FAC','A',31,0,'00-',265.070,32.00,0.000,0.000,8482.240,0.000,0.000,'2025-12-11 14:11:00','2025-12-11',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (32,95,3,'FAC','A',32,0,'00-',267.750,13.00,0.000,0.000,3480.750,0.000,0.000,'2025-12-12 09:21:43','2025-12-12',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (33,4,3,'FAC','A',33,0,'00-',267.750,28.00,0.000,0.000,7497.000,0.000,0.000,'2025-12-12 10:09:16','2025-12-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (34,4,3,'FAC','A',34,0,'00-',267.750,32.00,0.000,0.000,8568.000,0.000,0.000,'2025-12-12 10:35:12','2025-12-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (35,4,3,'FAC','A',35,0,'00-',267.750,36.00,0.000,0.000,9639.000,0.000,0.000,'2025-12-12 11:19:35','2025-12-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (36,257,4,'FAC','A',36,0,'00-',267.750,74.00,0.000,0.000,19813.500,0.000,0.000,'2025-12-12 12:07:51','2025-12-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (37,254,4,'FAC','A',37,0,'00-',270.790,5.00,0.000,0.000,1353.950,0.000,0.000,'2025-12-13 16:46:05','2025-12-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (38,4,4,'FAC','A',38,0,'00-',270.790,6.50,0.000,0.000,1760.130,0.000,0.000,'2025-12-14 10:36:04','2025-12-14',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (39,254,4,'FAC','A',39,0,'00-',270.790,10.00,0.000,0.000,2707.900,0.000,0.000,'2025-12-14 11:07:15','2025-12-14',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (40,259,4,'FAC','A',40,0,'00-',270.790,30.00,0.000,0.000,8123.700,0.000,0.000,'2025-12-14 12:20:50','2025-12-14',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (41,261,4,'FAC','A',41,0,'00-',270.790,25.00,0.000,0.000,6769.750,0.000,0.000,'2025-12-15 13:26:12','2025-12-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (42,262,4,'FAC','A',42,0,'00-',270.790,30.00,0.000,0.000,8123.700,0.000,0.000,'2025-12-15 14:42:37','2025-12-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (43,263,4,'FAC','A',43,0,'00-',270.790,56.00,0.000,0.000,15164.240,0.000,0.000,'2025-12-15 16:38:53','2025-12-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (44,238,3,'FAC','A',44,0,'00-',276.580,29.00,0.000,0.000,8020.820,0.000,0.000,'2025-12-16 17:45:59','2025-12-16',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (45,238,3,'FAC','A',45,0,'00-',276.580,20.00,0.000,0.000,5531.590,0.000,0.000,'2025-12-16 18:03:12','2025-12-16',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (46,238,3,'FAC','A',46,0,'00-',276.580,27.00,0.000,0.000,7467.660,0.000,0.000,'2025-12-16 18:08:09','2025-12-16',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (47,265,4,'FAC','A',47,0,'00-',276.580,40.00,0.000,0.000,11063.200,0.000,0.000,'2025-12-16 18:14:55','2025-12-16',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (48,198,4,'FAC','A',48,0,'00-',276.580,20.00,0.000,0.000,5531.590,0.000,0.000,'2025-12-17 15:33:22','2025-12-17',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (49,266,4,'FAC','A',49,0,'00-',276.580,15.00,0.000,0.000,4148.700,0.000,0.000,'2025-12-17 16:26:41','2025-12-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (50,262,4,'FAC','A',50,0,'00-',276.580,30.00,0.000,0.000,8297.400,0.000,0.000,'2025-12-17 17:41:46','2025-12-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (51,87,4,'FAC','A',51,0,'00-',276.580,27.00,0.000,0.000,7467.660,0.000,0.000,'2025-12-17 18:27:15','2025-12-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (52,267,3,'FAC','A',52,0,'00-',276.580,79.00,0.000,0.000,21849.801,0.000,0.000,'2025-12-17 18:34:10','2025-12-17',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (53,267,3,'FAC','A',53,0,'00-',276.580,101.00,0.000,0.000,27934.580,0.000,0.000,'2025-12-18 10:17:33','2025-12-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (54,268,4,'FAC','A',54,0,'00-',279.560,45.00,0.000,0.000,12580.200,0.000,0.000,'2025-12-18 11:59:57','2025-12-18',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (55,269,4,'FAC','A',55,0,'00-',279.560,56.00,0.000,0.000,15655.360,0.000,0.000,'2025-12-18 12:51:39','2025-12-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (56,270,4,'FAC','A',56,0,'00-',279.560,25.00,0.000,0.000,6989.000,0.000,0.000,'2025-12-18 14:33:57','2025-12-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (57,271,3,'FAC','A',57,0,'00-',279.560,16.00,0.000,0.000,4472.960,0.000,0.000,'2025-12-18 16:03:07','2025-12-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (58,265,4,'FAC','A',58,0,'00-',279.560,75.00,0.000,0.000,20967.000,0.000,0.000,'2025-12-18 16:45:06','2025-12-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (59,272,4,'FAC','A',59,0,'00-',282.510,15.00,0.000,0.000,4237.650,0.000,0.000,'2025-12-19 15:20:21','2025-12-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (60,20,3,'FAC','A',60,0,'00-',282.510,63.00,0.000,0.000,17798.119,0.000,0.000,'2025-12-19 15:30:08','2025-12-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (61,273,3,'FAC','A',61,0,'00-',285.400,81.00,0.000,0.000,23117.391,0.000,0.000,'2025-12-19 17:46:56','2025-12-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (62,236,4,'FAC','A',62,0,'00-',285.400,7.00,0.000,0.000,1997.790,0.000,0.000,'2025-12-20 15:43:16','2025-12-20',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (63,4,4,'FAC','A',63,0,'00-',285.400,8.00,0.000,0.000,2283.200,0.000,0.000,'2025-12-20 15:50:53','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (64,4,4,'FAC','A',64,0,'00-',285.400,38.50,0.000,0.000,10987.900,0.000,0.000,'2025-12-20 15:53:16','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (65,4,4,'FAC','A',65,0,'00-',285.400,12.00,0.000,0.000,3424.800,0.000,0.000,'2025-12-20 16:35:43','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (66,4,4,'FAC','A',66,0,'00-',285.400,20.00,0.000,0.000,5708.000,0.000,0.000,'2025-12-20 16:51:41','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (67,4,4,'FAC','A',67,0,'00-',285.400,30.00,0.000,0.000,8562.000,0.000,0.000,'2025-12-20 17:21:59','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (68,4,4,'FAC','A',68,0,'00-',285.400,40.00,0.000,0.000,11416.000,0.000,0.000,'2025-12-20 17:42:22','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (69,4,4,'FAC','A',69,0,'00-',285.400,6.50,0.000,0.000,1855.100,0.000,0.000,'2025-12-20 18:18:28','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (70,274,4,'FAC','A',70,0,'00-',285.400,20.00,0.000,0.000,5708.000,0.000,0.000,'2025-12-20 18:24:50','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (71,4,3,'FAC','A',71,0,'00-',285.400,110.00,0.000,0.000,31393.980,0.000,0.000,'2025-12-20 18:32:02','2025-12-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (72,236,3,'FAC','A',72,0,'00-',285.400,4.00,0.000,0.000,1141.600,0.000,0.000,'2025-12-20 18:42:16','2025-12-20',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (73,131,3,'FAC','A',73,0,'00-',285.400,40.00,0.000,0.000,11416.000,0.000,0.000,'2025-12-21 10:37:41','2025-12-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (74,4,4,'FAC','A',74,0,'00-',285.400,15.00,0.000,0.000,4281.000,0.000,0.000,'2025-12-21 10:43:50','2025-12-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (75,238,3,'FAC','A',75,0,'00-',285.400,15.00,0.000,0.000,4281.000,0.000,0.000,'2025-12-21 10:57:57','2025-12-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (76,275,4,'FAC','A',76,0,'00-',285.400,13.00,0.000,0.000,3710.200,0.000,0.000,'2025-12-21 11:11:31','2025-12-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (77,238,3,'FAC','A',77,0,'00-',285.400,48.00,0.000,0.000,13699.190,0.000,0.000,'2025-12-21 11:26:29','2025-12-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (78,238,3,'FAC','A',78,0,'00-',285.400,15.00,0.000,0.000,4281.000,0.000,0.000,'2025-12-21 11:29:09','2025-12-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (79,270,4,'FAC','A',79,0,'00-',285.400,15.00,0.000,0.000,4281.000,0.000,0.000,'2025-12-21 12:27:58','2025-12-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (80,68,3,'FAC','A',80,0,'00-',285.400,110.00,0.000,0.000,31393.980,0.000,0.000,'2025-12-22 12:28:06','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (81,268,4,'FAC','A',81,0,'00-',285.400,44.50,0.000,0.000,12700.280,0.000,0.000,'2025-12-22 13:28:05','2025-12-22',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (82,276,4,'FAC','A',82,0,'00-',285.400,67.00,0.000,0.000,19121.779,0.000,0.000,'2025-12-22 14:58:19','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (83,277,4,'FAC','A',83,0,'00-',285.400,90.00,0.000,0.000,25685.980,0.000,0.000,'2025-12-22 15:34:36','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (84,271,3,'FAC','A',84,0,'00-',285.400,10.00,0.000,0.000,2854.000,0.000,0.000,'2025-12-22 16:01:41','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (85,57,3,'FAC','A',85,0,'00-',285.400,48.00,0.000,0.000,13699.190,0.000,0.000,'2025-12-22 16:33:01','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (86,278,3,'FAC','A',86,0,'00-',285.400,145.00,0.000,0.000,41382.969,0.000,0.000,'2025-12-22 16:44:13','2025-12-22',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (87,273,3,'FAC','A',87,0,'00-',285.400,140.00,0.000,0.000,39956.000,0.000,0.000,'2025-12-22 16:46:54','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (88,13,3,'FAC','A',88,0,'00-',285.400,64.00,0.000,0.000,18265.580,0.000,0.000,'2025-12-22 16:51:08','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (89,236,3,'FAC','A',89,0,'00-',285.400,4.00,0.000,0.000,1141.600,0.000,0.000,'2025-12-22 16:51:50','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (90,279,4,'FAC','A',90,0,'00-',288.450,105.00,0.000,0.000,30287.250,0.000,0.000,'2025-12-22 17:15:39','2025-12-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (91,112,4,'FAC','A',91,0,'00-',288.450,100.00,0.000,0.000,28845.000,0.000,0.000,'2025-12-23 11:06:53','2025-12-23',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (92,280,4,'FAC','A',92,0,'00-',288.450,25.00,0.000,0.000,7211.250,0.000,0.000,'2025-12-23 11:48:27','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (93,281,4,'FAC','A',93,0,'00-',288.450,64.00,0.000,0.000,18460.801,0.000,0.000,'2025-12-23 13:00:01','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (94,276,4,'FAC','A',94,0,'00-',288.450,20.00,0.000,0.000,5769.000,0.000,0.000,'2025-12-23 13:15:56','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (95,68,4,'FAC','A',95,0,'00-',288.450,20.00,0.000,0.000,5769.000,0.000,0.000,'2025-12-23 15:30:52','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (96,275,4,'FAC','A',96,0,'00-',288.450,7.00,0.000,0.000,2019.140,0.000,0.000,'2025-12-23 15:54:09','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (97,275,4,'FAC','A',97,0,'00-',288.450,1.00,0.000,0.000,288.450,0.000,0.000,'2025-12-23 15:55:20','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (98,277,4,'FAC','A',98,0,'00-',288.450,4.00,0.000,0.000,1153.800,0.000,0.000,'2025-12-23 16:16:54','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (99,240,3,'FAC','A',99,0,'00-',288.450,150.00,0.000,0.000,43267.500,0.000,0.000,'2025-12-23 17:03:58','2025-12-23',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (100,197,4,'FAC','A',100,0,'00-',288.450,13.00,0.000,0.000,3749.850,0.000,0.000,'2025-12-23 18:08:41','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (101,13,4,'FAC','A',101,0,'00-',288.450,30.00,0.000,0.000,8653.500,0.000,0.000,'2025-12-23 18:38:10','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (102,5,4,'FAC','A',102,0,'00-',288.450,20.00,0.000,0.000,5769.000,0.000,0.000,'2025-12-23 19:11:39','2025-12-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (103,275,4,'FAC','A',103,0,'00-',291.350,4.00,0.000,0.000,1165.400,0.000,0.000,'2025-12-24 10:10:12','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (104,237,3,'FAC','A',104,0,'00-',291.350,124.00,0.000,0.000,36127.398,0.000,0.000,'2025-12-24 10:25:07','2025-12-24',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (105,237,3,'FAC','A',105,0,'00-',291.350,17.00,0.000,0.000,4952.950,0.000,0.000,'2025-12-24 10:27:01','2025-12-24',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (106,221,3,'FAC','A',106,0,'00-',291.350,80.00,0.000,0.000,23308.000,0.000,0.000,'2025-12-24 10:39:59','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (107,279,4,'FAC','A',107,0,'00-',291.350,20.00,0.000,0.000,5827.000,0.000,0.000,'2025-12-24 10:42:28','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (108,112,4,'FAC','A',108,0,'00-',291.350,195.00,0.000,0.000,56813.250,0.000,0.000,'2025-12-24 10:53:48','2025-12-24',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (109,276,4,'FAC','A',109,0,'00-',291.350,55.00,0.000,0.000,16024.250,0.000,0.000,'2025-12-24 11:12:20','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (110,10,3,'FAC','A',110,0,'00-',291.350,10.00,0.000,0.000,2913.500,0.000,0.000,'2025-12-24 11:20:21','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (111,63,3,'FAC','A',111,0,'00-',291.350,10.00,0.000,0.000,2913.500,0.000,0.000,'2025-12-24 11:21:37','2025-12-24',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (112,275,4,'FAC','A',112,0,'00-',291.350,12.00,0.000,0.000,3496.200,0.000,0.000,'2025-12-24 11:35:08','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (113,275,4,'FAC','A',113,0,'00-',291.350,40.00,0.000,0.000,11654.000,0.000,0.000,'2025-12-24 13:00:57','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (114,237,3,'FAC','A',114,0,'00-',291.350,20.00,0.000,0.000,5827.000,0.000,0.000,'2025-12-24 13:03:52','2025-12-24',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (115,279,4,'FAC','A',115,0,'00-',291.350,30.00,0.000,0.000,8740.500,0.000,0.000,'2025-12-24 13:18:21','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (116,276,4,'FAC','A',116,0,'00-',291.350,15.00,0.000,0.000,4370.250,0.000,0.000,'2025-12-24 13:29:43','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (117,279,4,'FAC','A',117,0,'00-',291.350,40.00,0.000,0.000,11654.000,0.000,0.000,'2025-12-24 13:32:24','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (118,16,4,'FAC','A',118,0,'00-',291.350,15.00,0.000,0.000,4370.250,0.000,0.000,'2025-12-24 13:39:59','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (119,277,4,'FAC','A',119,0,'00-',291.350,1.00,0.000,0.000,291.350,0.000,0.000,'2025-12-24 13:52:08','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (120,137,3,'FAC','A',120,0,'00-',291.350,56.00,0.000,0.000,16315.600,0.000,0.000,'2025-12-24 14:20:35','2025-12-24',16,56.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (121,276,4,'FAC','A',121,0,'00-',291.350,25.00,0.000,0.000,7283.750,0.000,0.000,'2025-12-24 14:43:33','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (122,275,4,'FAC','A',122,0,'00-',291.350,30.00,0.000,0.000,8740.500,0.000,0.000,'2025-12-24 14:56:20','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (123,277,4,'FAC','A',123,0,'00-',291.350,30.00,0.000,0.000,8740.500,0.000,0.000,'2025-12-24 15:13:10','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (124,275,4,'FAC','A',124,0,'00-',291.350,52.00,0.000,0.000,15150.200,0.000,0.000,'2025-12-24 16:22:31','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (125,276,4,'FAC','A',125,0,'00-',291.350,12.00,0.000,0.000,3496.200,0.000,0.000,'2025-12-24 16:25:35','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (126,92,3,'FAC','A',126,0,'00-',291.350,6.00,0.000,0.000,1748.100,0.000,0.000,'2025-12-24 17:45:49','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (127,237,3,'FAC','A',127,0,'00-',291.350,123.00,0.000,0.000,35836.051,0.000,0.000,'2025-12-24 17:52:01','2025-12-24',16,8.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (128,276,4,'FAC','A',128,0,'00-',291.350,65.00,0.000,0.000,18937.750,0.000,0.000,'2025-12-24 18:32:32','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (129,10,4,'FAC','A',129,0,'00-',291.350,35.00,0.000,0.000,10197.250,0.000,0.000,'2025-12-24 19:20:39','2025-12-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (130,279,4,'FAC','A',130,0,'00-',291.350,4.00,0.000,0.000,1165.400,0.000,0.000,'2025-12-26 10:13:25','2025-12-26',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (131,276,4,'FAC','A',131,0,'00-',291.350,4.00,0.000,0.000,1165.400,0.000,0.000,'2025-12-26 12:16:43','2025-12-26',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (132,134,4,'FAC','A',132,0,'00-',291.350,56.00,0.000,0.000,16315.600,0.000,0.000,'2025-12-26 14:05:02','2025-12-26',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (133,282,4,'FAC','A',133,0,'00-',291.350,50.40,0.000,0.000,14684.040,0.000,0.000,'2025-12-26 16:31:36','2025-12-26',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (134,282,4,'FAC','A',134,0,'00-',291.350,22.00,0.000,0.000,6409.700,0.000,0.000,'2025-12-26 16:38:50','2025-12-26',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (135,89,4,'FAC','A',135,0,'00-',294.960,7.00,0.000,0.000,2064.720,0.000,0.000,'2025-12-27 12:32:48','2025-12-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (136,83,3,'FAC','A',136,0,'00-',294.960,35.00,0.000,0.000,10323.600,0.000,0.000,'2025-12-27 15:56:38','2025-12-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (137,280,4,'FAC','A',137,0,'00-',294.960,20.00,0.000,0.000,5899.200,0.000,0.000,'2025-12-27 18:21:22','2025-12-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (138,151,4,'FAC','A',138,0,'00-',294.960,36.00,0.000,0.000,10618.560,0.000,0.000,'2025-12-28 09:40:59','2025-12-28',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (139,247,4,'FAC','A',139,0,'00-',294.960,13.00,0.000,0.000,3834.470,0.000,0.000,'2025-12-28 14:17:24','2025-12-28',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (140,33,3,'FAC','A',140,0,'00-',294.960,18.00,0.000,0.000,5309.280,0.000,0.000,'2025-12-29 11:54:09','2025-12-29',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (141,75,3,'FAC','A',141,0,'00-',294.960,40.00,0.000,0.000,11798.390,0.000,0.000,'2025-12-29 13:54:45','2025-12-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (142,4,3,'FAC','A',142,0,'00-',294.960,20.00,0.000,0.000,5899.200,0.000,0.000,'2025-12-29 14:20:31','2025-12-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (143,4,4,'FAC','A',143,0,'00-',294.960,10.00,0.000,0.000,2949.600,0.000,0.000,'2025-12-29 14:23:44','2025-12-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (144,4,4,'FAC','A',144,0,'00-',294.960,25.00,0.000,0.000,7373.990,0.000,0.000,'2025-12-29 15:20:13','2025-12-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (145,283,4,'FAC','A',145,0,'00-',294.960,50.00,0.000,0.000,14747.980,0.000,0.000,'2025-12-29 15:29:04','2025-12-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (146,4,4,'FAC','A',146,0,'00-',294.960,25.00,0.000,0.000,7374.000,0.000,0.000,'2025-12-29 17:10:31','2025-12-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (147,278,3,'FAC','A',147,0,'00-',294.960,30.00,0.000,0.000,8848.800,0.000,0.000,'2025-12-30 09:42:49','2025-12-30',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (148,284,4,'FAC','A',148,0,'00-',298.140,37.00,0.000,0.000,11031.160,0.000,0.000,'2025-12-30 10:36:06','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (149,278,3,'FAC','A',149,0,'00-',298.140,54.00,0.000,0.000,16099.540,0.000,0.000,'2025-12-30 11:20:54','2025-12-30',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (150,4,3,'FAC','A',150,0,'00-',298.140,28.00,0.000,0.000,8347.920,0.000,0.000,'2025-12-30 12:10:26','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (151,63,3,'FAC','A',151,0,'00-',298.140,30.00,0.000,0.000,8944.190,0.000,0.000,'2025-12-30 12:47:35','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (152,4,3,'FAC','A',152,0,'00-',298.140,25.00,0.000,0.000,7453.500,0.000,0.000,'2025-12-30 13:48:12','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (153,4,3,'FAC','A',153,0,'00-',298.140,10.00,0.000,0.000,2981.390,0.000,0.000,'2025-12-30 15:29:52','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (154,285,4,'FAC','A',154,0,'00-',298.140,67.00,0.000,0.000,19975.359,0.000,0.000,'2025-12-30 16:08:38','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (155,156,3,'FAC','A',155,0,'00-',298.140,15.00,0.000,0.000,4472.090,0.000,0.000,'2025-12-30 16:25:20','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (156,286,3,'FAC','A',156,0,'00-',298.140,120.00,0.000,0.000,35776.770,0.000,0.000,'2025-12-30 17:44:28','2025-12-30',16,28.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (157,4,4,'FAC','A',157,0,'00-',301.370,30.00,0.000,0.000,9041.100,0.000,0.000,'2025-12-30 18:00:14','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (158,287,4,'FAC','A',158,0,'00-',301.370,30.00,0.000,0.000,9041.100,0.000,0.000,'2025-12-30 19:36:41','2025-12-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (159,282,4,'FAC','A',159,0,'00-',301.370,65.00,0.000,0.000,19589.051,0.000,0.000,'2025-12-30 19:47:29','2025-12-30',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (160,253,4,'FAC','A',160,0,'00-',301.370,30.00,0.000,0.000,9041.100,0.000,0.000,'2025-12-31 09:26:33','2025-12-31',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (161,4,3,'FAC','A',161,0,'00-',301.370,5.00,0.000,0.000,1506.850,0.000,0.000,'2025-12-31 09:30:43','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (162,288,4,'FAC','A',162,0,'00-',301.370,34.00,0.000,0.000,10246.580,0.000,0.000,'2025-12-31 09:55:14','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (163,289,4,'FAC','A',163,0,'00-',301.370,60.00,0.000,0.000,18082.199,0.000,0.000,'2025-12-31 10:21:21','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (164,4,3,'FAC','A',164,0,'00-',301.370,15.00,0.000,0.000,4520.550,0.000,0.000,'2025-12-31 10:22:40','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (165,238,3,'FAC','A',165,0,'00-',301.370,20.00,0.000,0.000,6027.400,0.000,0.000,'2025-12-31 10:27:38','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (166,238,3,'FAC','A',166,0,'00-',301.370,15.00,0.000,0.000,4520.550,0.000,0.000,'2025-12-31 10:29:55','2025-12-31',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (167,282,4,'FAC','A',167,0,'00-',301.370,65.00,0.000,0.000,19589.051,0.000,0.000,'2025-12-31 10:38:24','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (168,125,3,'FAC','A',168,0,'00-',301.370,15.00,0.000,0.000,4520.550,0.000,0.000,'2025-12-31 10:59:18','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (169,238,3,'FAC','A',169,0,'00-',301.370,25.00,0.000,0.000,7534.250,0.000,0.000,'2025-12-31 11:03:44','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (170,238,3,'FAC','A',170,0,'00-',301.370,7.00,0.000,0.000,2109.590,0.000,0.000,'2025-12-31 11:10:15','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (171,238,3,'FAC','A',171,0,'00-',301.370,15.00,0.000,0.000,4520.550,0.000,0.000,'2025-12-31 11:31:35','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (172,238,3,'FAC','A',172,0,'00-',301.370,20.00,0.000,0.000,6027.400,0.000,0.000,'2025-12-31 11:43:31','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (173,238,3,'FAC','A',173,0,'00-',301.370,25.00,0.000,0.000,7534.250,0.000,0.000,'2025-12-31 11:44:49','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (174,238,3,'FAC','A',174,0,'00-',301.370,25.00,0.000,0.000,7534.250,0.000,0.000,'2025-12-31 11:46:27','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (175,238,3,'FAC','A',175,0,'00-',301.370,26.00,0.000,0.000,7835.620,0.000,0.000,'2025-12-31 11:49:40','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (176,238,3,'FAC','A',176,0,'00-',301.370,4.00,0.000,0.000,1205.480,0.000,0.000,'2025-12-31 11:53:20','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (177,238,3,'FAC','A',177,0,'00-',301.370,7.00,0.000,0.000,2109.590,0.000,0.000,'2025-12-31 11:55:14','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (178,287,4,'FAC','A',178,0,'00-',301.370,20.00,0.000,0.000,6027.400,0.000,0.000,'2025-12-31 12:47:55','2025-12-31',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (179,238,3,'FAC','A',179,0,'00-',301.370,30.00,0.000,0.000,9041.100,0.000,0.000,'2025-12-31 12:54:24','2025-12-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (180,287,4,'FAC','A',180,0,'00-',330.370,20.00,0.000,0.000,6607.400,0.000,0.000,'2026-01-13 16:53:58','2026-01-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (181,285,4,'FAC','A',181,0,'00-',330.370,10.00,0.000,0.000,3303.700,0.000,0.000,'2026-01-13 17:01:59','2026-01-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (182,290,4,'FAC','A',182,0,'00-',341.740,25.00,0.000,0.000,8543.500,0.000,0.000,'2026-01-17 14:57:51','2026-01-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (183,4,3,'FAC','A',183,0,'00-',344.510,10.00,0.000,0.000,3445.100,0.000,0.000,'2026-01-18 11:24:38','2026-01-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (184,291,4,'FAC','A',184,0,'00-',347.260,28.80,0.000,0.000,10001.080,0.000,0.000,'2026-01-21 17:09:35','2026-01-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (185,291,4,'FAC','A',185,0,'00-',347.260,42.00,0.000,0.000,14584.920,0.000,0.000,'2026-01-21 17:14:17','2026-01-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (186,292,4,'FAC','A',186,0,'00-',349.930,48.00,0.000,0.000,16796.641,0.000,0.000,'2026-01-22 11:48:58','2026-01-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (187,38,4,'FAC','A',187,0,'00-',349.930,18.00,0.000,0.000,6298.740,0.000,0.000,'2026-01-22 14:49:26','2026-01-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (188,294,4,'FAC','A',188,0,'00-',355.550,20.00,0.000,0.000,7111.000,0.000,0.000,'2026-01-24 09:42:18','2026-01-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (189,287,4,'FAC','A',189,0,'00-',355.550,6.50,0.000,0.000,2311.070,0.000,0.000,'2026-01-24 14:43:14','2026-01-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (190,279,4,'FAC','A',190,0,'00-',355.550,16.00,0.000,0.000,5688.800,0.000,0.000,'2026-01-24 15:16:14','2026-01-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (191,237,4,'FAC','A',191,0,'00-',358.920,15.00,0.000,0.000,5383.800,0.000,0.000,'2026-01-27 10:32:26','2026-01-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (192,4,4,'FAC','A',192,0,'00-',372.100,10.00,0.000,0.000,3721.000,0.000,0.000,'2026-02-03 09:34:07','2026-02-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (193,296,4,'FAC','A',193,0,'00-',372.100,21.00,0.000,0.000,7814.100,0.000,0.000,'2026-02-03 18:03:39','2026-02-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (194,4,4,'FAC','A',194,0,'00-',378.450,69.00,0.000,0.000,26113.039,0.000,0.000,'2026-02-05 11:18:41','2026-02-05',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (195,289,4,'FAC','A',195,0,'00-',378.450,15.00,0.000,0.000,5676.750,0.000,0.000,'2026-02-05 17:33:57','2026-02-05',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (196,292,4,'FAC','A',196,0,'00-',385.270,35.00,0.000,0.000,13484.440,0.000,0.000,'2026-02-10 11:28:11','2026-02-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (197,297,4,'FAC','A',197,0,'00-',390.290,10.00,0.000,0.000,3902.900,0.000,0.000,'2026-02-12 14:44:57','2026-02-12',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (198,298,4,'FAC','A',198,0,'00-',390.290,15.00,0.000,0.000,5854.350,0.000,0.000,'2026-02-12 16:42:18','2026-02-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (199,156,4,'FAC','A',199,0,'00-',530.000,25.00,0.000,0.000,13250.000,0.000,0.000,'2026-02-12 17:53:50','2026-02-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (200,240,3,'FAC','A',200,0,'00-',393.220,39.00,0.000,0.000,15335.580,0.000,0.000,'2026-02-13 18:14:07','2026-02-13',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (201,216,4,'FAC','A',201,0,'00-',396.370,20.00,0.000,0.000,7927.400,0.000,0.000,'2026-02-14 13:04:13','2026-02-14',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (202,240,3,'FAC','A',202,0,'00-',396.370,15.00,0.000,0.000,5945.550,0.000,0.000,'2026-02-18 12:25:39','2026-02-18',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (203,300,4,'FAC','A',203,0,'00-',402.330,10.00,0.000,0.000,4023.290,0.000,0.000,'2026-02-20 15:01:39','2026-02-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (204,16,3,'FAC','A',204,0,'00-',402.330,27.00,0.000,0.000,10862.910,0.000,0.000,'2026-02-20 18:32:31','2026-02-20',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (205,301,4,'FAC','A',205,0,'00-',405.350,25.00,0.000,0.000,10133.750,0.000,0.000,'2026-02-21 11:40:38','2026-02-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (206,302,4,'FAC','A',206,0,'00-',405.350,25.00,0.000,0.000,10133.750,0.000,0.000,'2026-02-21 17:04:42','2026-02-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (207,240,4,'FAC','A',207,0,'00-',414.050,30.00,0.000,0.000,12421.500,0.000,0.000,'2026-02-26 15:20:36','2026-02-26',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (208,5,3,'FAC','A',208,0,'00-',417.360,15.00,0.000,0.000,6260.400,0.000,0.000,'2026-02-27 15:02:43','2026-02-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (209,179,3,'FAC','A',209,0,'00-',421.880,5.00,0.000,0.000,2109.400,0.000,0.000,'2026-03-03 10:35:09','2026-03-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (210,57,4,'FAC','A',210,0,'00-',425.670,2.00,0.000,0.000,851.340,0.000,0.000,'2026-03-04 14:30:41','2026-03-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (211,57,3,'FAC','A',211,0,'00-',433.170,45.00,0.000,0.000,19492.650,0.000,0.000,'2026-03-07 10:31:04','2026-03-07',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (212,303,4,'FAC','A',212,0,'00-',433.170,45.00,0.000,0.000,19492.650,0.000,0.000,'2026-03-07 13:58:43','2026-03-07',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (213,300,4,'FAC','A',213,0,'00-',433.170,32.00,0.000,0.000,13861.440,0.000,0.000,'2026-03-07 14:18:27','2026-03-07',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (214,220,3,'FAC','A',214,0,'00-',433.170,35.00,0.000,0.000,15160.950,0.000,0.000,'2026-03-07 18:34:11','2026-03-07',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (215,236,4,'FAC','A',215,0,'00-',433.170,25.00,0.000,0.000,10829.250,0.000,0.000,'2026-03-08 11:19:00','2026-03-08',16,25.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (216,206,3,'FAC','A',216,0,'00-',436.240,30.00,0.000,0.000,13087.200,0.000,0.000,'2026-03-10 16:01:34','2026-03-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (217,297,3,'FAC','A',217,0,'00-',436.240,60.00,0.000,0.000,26174.400,0.000,0.000,'2026-03-10 16:08:34','2026-03-10',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (218,156,4,'FAC','A',218,0,'00-',440.970,25.00,0.000,0.000,11024.250,0.000,0.000,'2026-03-12 12:10:39','2026-03-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (219,236,4,'FAC','A',219,0,'00-',446.800,45.00,0.000,0.000,20106.000,0.000,0.000,'2026-03-14 09:47:26','2026-03-14',16,45.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (220,304,4,'FAC','A',220,0,'00-',455.250,25.00,0.000,0.000,11381.250,0.000,0.000,'2026-03-19 16:13:33','2026-03-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (221,4,4,'FAC','A',221,0,'00-',455.250,17.59,0.000,0.000,8007.840,0.000,0.000,'2026-03-19 16:36:39','2026-03-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (222,106,4,'FAC','A',222,0,'00-',455.250,34.00,0.000,0.000,15478.500,0.000,0.000,'2026-03-19 16:44:44','2026-03-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (223,216,4,'FAC','A',223,0,'00-',455.250,15.00,0.000,0.000,6828.750,0.000,0.000,'2026-03-19 17:26:54','2026-03-19',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (224,4,4,'FAC','A',224,0,'00-',457.080,12.00,0.000,0.000,5484.960,0.000,0.000,'2026-03-22 11:21:24','2026-03-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (225,305,4,'FAC','A',225,0,'00-',457.080,25.87,0.000,0.000,11824.650,0.000,0.000,'2026-03-22 12:55:26','2026-03-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (226,300,4,'FAC','A',226,0,'00-',462.660,32.00,0.000,0.000,14805.120,0.000,0.000,'2026-03-25 12:31:42','2026-03-25',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (227,306,4,'FAC','A',227,0,'00-',466.600,25.00,0.000,0.000,11665.000,0.000,0.000,'2026-03-26 09:35:25','2026-03-26',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (228,12,4,'FAC','A',228,0,'00-',466.600,30.00,0.000,0.000,13998.000,0.000,0.000,'2026-03-26 15:34:07','2026-03-26',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (229,12,4,'FAC','A',229,0,'00-',466.600,5.00,0.000,0.000,2333.000,0.000,0.000,'2026-03-26 15:43:50','2026-03-26',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (230,236,3,'FAC','A',230,0,'00-',466.600,58.00,0.000,0.000,27062.801,0.000,0.000,'2026-03-26 17:41:35','2026-03-26',16,58.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (231,4,4,'FAC','A',231,0,'00-',468.510,35.00,0.000,0.000,16397.850,0.000,0.000,'2026-03-27 13:55:17','2026-03-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (232,300,4,'FAC','A',232,0,'00-',468.510,33.82,0.000,0.000,15845.000,0.000,0.000,'2026-03-27 16:47:53','2026-03-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (233,252,4,'FAC','A',233,0,'00-',471.700,20.00,0.000,0.000,9434.000,0.000,0.000,'2026-03-29 12:19:38','2026-03-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (234,226,4,'FAC','A',234,0,'00-',473.870,5.00,0.000,0.000,2369.350,0.000,0.000,'2026-03-31 16:34:56','2026-03-31',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (235,307,4,'FAC','A',235,0,'00-',473.920,16.49,0.000,0.000,7814.940,0.000,0.000,'2026-04-01 11:41:51','2026-04-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (236,58,4,'FAC','A',236,0,'00-',473.920,15.00,0.000,0.000,7108.800,0.000,0.000,'2026-04-01 12:06:01','2026-04-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (237,12,4,'FAC','A',237,0,'00-',473.920,12.00,0.000,0.000,5687.040,0.000,0.000,'2026-04-01 17:54:31','2026-04-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (238,308,4,'FAC','A',238,0,'00-',474.060,23.00,0.000,0.000,10903.380,0.000,0.000,'2026-04-04 14:13:36','2026-04-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (239,4,4,'FAC','A',239,0,'00-',475.960,25.00,0.000,0.000,11898.980,0.000,0.000,'2026-04-09 14:30:51','2026-04-09',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (240,38,4,'FAC','A',240,0,'00-',476.430,40.00,0.000,0.000,19057.199,0.000,0.000,'2026-04-10 14:52:54','2026-04-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (241,309,4,'FAC','A',241,0,'00-',477.150,20.00,0.000,0.000,9543.000,0.000,0.000,'2026-04-11 12:24:19','2026-04-11',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (242,310,4,'FAC','A',242,0,'00-',477.630,15.00,0.000,0.000,7164.450,0.000,0.000,'2026-04-14 09:42:47','2026-04-14',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (243,311,4,'FAC','A',243,0,'00-',478.580,67.00,0.000,0.000,32064.859,0.000,0.000,'2026-04-15 11:17:04','2026-04-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (244,312,3,'FAC','A',244,0,'00-',478.580,13.10,0.000,0.000,6269.390,0.000,0.000,'2026-04-15 14:16:12','2026-04-15',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (245,292,4,'FAC','A',245,0,'00-',480.260,25.00,0.000,0.000,12006.500,0.000,0.000,'2026-04-17 11:52:31','2026-04-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (246,292,4,'FAC','A',246,0,'00-',480.260,25.82,0.000,0.000,12400.310,0.000,0.000,'2026-04-17 11:55:55','2026-04-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (247,89,4,'FAC','A',247,0,'00-',481.220,25.00,0.000,0.000,12030.500,0.000,0.000,'2026-04-18 11:23:07','2026-04-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (248,232,3,'FAC','A',248,0,'00-',482.760,20.00,0.000,0.000,9655.200,0.000,0.000,'2026-04-22 16:17:18','2026-04-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (249,38,4,'FAC','A',249,0,'00-',483.870,18.00,0.000,0.000,8709.660,0.000,0.000,'2026-04-24 09:54:23','2026-04-24',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (250,57,6,'FAC','A',250,0,'00-',483.870,5.19,0.000,0.000,2511.280,0.000,0.000,'2026-04-24 11:39:27','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (251,240,3,'FAC','A',251,0,'00-',483.870,23.00,0.000,0.000,11129.010,0.000,0.000,'2026-04-24 15:18:27','2026-04-24',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (252,295,4,'FAC','A',252,0,'00-',483.870,15.00,0.000,0.000,5333.250,0.000,0.000,'2026-04-24 17:41:25','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (253,239,3,'FAC','A',253,0,'00-',483.870,35.00,0.000,0.000,9988.990,0.000,0.000,'2026-04-24 17:41:55','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (254,299,4,'FAC','A',254,0,'00-',483.870,25.00,0.000,0.000,9909.250,0.000,0.000,'2026-04-24 17:42:20','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (255,198,3,'FAC','A',255,0,'00-',483.870,20.00,0.000,0.000,5531.590,0.000,0.000,'2026-04-24 17:42:38','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (256,260,4,'FAC','A',256,0,'00-',483.870,58.00,0.000,0.000,15705.820,0.000,0.000,'2026-04-24 17:43:10','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (257,258,4,'FAC','A',257,0,'00-',483.870,35.00,0.000,0.000,9477.650,0.000,0.000,'2026-04-24 17:43:42','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (258,58,3,'FAC','A',258,0,'00-',483.870,30.00,0.000,0.000,8123.700,0.000,0.000,'2026-04-24 17:44:20','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (259,117,3,'FAC','A',259,0,'00-',483.870,173.00,0.000,0.000,45343.301,0.000,0.000,'2026-04-24 17:44:32','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (260,87,4,'FAC','A',260,0,'00-',483.870,20.00,0.000,0.000,5158.600,0.000,0.000,'2026-04-24 17:44:45','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (261,251,4,'FAC','A',261,0,'00-',483.870,34.00,0.000,0.000,8769.620,0.000,0.000,'2026-04-24 17:44:57','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (262,4,2,'FAC','A',262,0,'00-',483.870,17.50,0.000,0.000,0.000,0.000,0.000,'2026-04-24 17:45:12','2026-04-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (263,232,3,'FAC','A',263,0,'00-',484.740,45.00,0.000,0.000,21813.301,0.000,0.000,'2026-04-25 11:47:37','2026-04-25',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (264,1,4,'FAC','A',264,0,'00-',484.740,6.48,0.000,0.000,3141.110,0.000,0.000,'2026-04-25 11:57:25','2026-04-25',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (265,314,6,'FAC','A',265,0,'00-',484.740,38.00,0.000,0.000,18420.119,0.000,0.000,'2026-04-25 15:57:24','2026-04-25',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (266,212,4,'FAC','A',266,0,'00-',484.740,15.56,0.000,0.000,7542.550,0.000,0.000,'2026-04-25 16:12:13','2026-04-25',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (267,306,4,'FAC','A',267,0,'00-',630.000,25.00,0.000,0.000,15750.000,0.000,0.000,'2026-04-25 16:19:54','2026-04-25',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (268,32,3,'FAC','A',268,0,'00-',484.740,27.00,0.000,0.000,13087.980,0.000,0.000,'2026-04-28 11:11:00','2026-04-28',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (269,133,3,'FAC','A',269,0,'00-',486.200,2.00,0.000,0.000,972.400,0.000,0.000,'2026-04-29 15:05:10','2026-04-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (270,239,4,'FAC','A',270,0,'00-',640.000,15.00,0.000,0.000,7108.050,0.000,0.000,'2026-04-29 17:17:35','2026-04-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (271,278,3,'FAC','A',271,0,'00-',487.120,12.00,0.000,0.000,5845.440,0.000,0.000,'2026-04-30 17:12:36','2026-04-30',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (272,57,3,'FAC','A',272,0,'00-',489.550,6.48,0.000,0.000,3172.280,0.000,0.000,'2026-05-02 17:46:55','2026-05-02',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (273,16,3,'FAC','A',273,0,'00-',489.550,20.00,0.000,0.000,9791.000,0.000,0.000,'2026-05-03 12:04:35','2026-05-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (274,315,6,'FAC','A',274,0,'00-',494.110,12.00,0.000,0.000,5929.320,0.000,0.000,'2026-05-06 09:29:37','2026-05-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (275,315,6,'FAC','A',275,0,'00-',494.110,17.00,0.000,0.000,8399.870,0.000,0.000,'2026-05-06 16:23:18','2026-05-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (276,316,6,'FAC','A',276,0,'00-',494.110,20.00,0.000,0.000,9882.200,0.000,0.000,'2026-05-06 17:54:17','2026-05-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (277,288,3,'FAC','A',277,0,'00-',500.460,55.00,0.000,0.000,27525.279,0.000,0.000,'2026-05-10 11:24:53','2026-05-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (278,237,3,'FAC','A',278,0,'00-',504.910,60.00,0.000,0.000,30294.600,0.000,0.000,'2026-05-12 08:51:02','2026-05-12',16,60.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (279,288,3,'FAC','A',279,0,'00-',504.910,24.00,0.000,0.000,12117.840,0.000,0.000,'2026-05-12 10:39:58','2026-05-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (280,233,3,'FAC','A',280,0,'00-',508.600,4.00,0.000,0.000,2560.000,0.000,0.000,'2026-05-13 11:14:57','2026-05-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (281,233,3,'FAC','A',280,0,'00-',508.600,4.00,0.000,0.000,2560.000,0.000,0.000,'2026-05-13 11:14:57','2026-05-13',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (282,233,3,'FAC','A',282,0,'01',508.600,4.00,0.000,0.000,2560.000,0.000,0.000,'2026-05-13 11:14:58','2026-05-13',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (283,317,6,'FAC','A',283,0,'00-',510.790,25.00,0.000,0.000,12769.750,0.000,0.000,'2026-05-15 15:09:31','2026-05-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (284,318,6,'FAC','A',284,0,'00-',510.790,95.11,0.000,0.000,48581.230,0.000,0.000,'2026-05-15 16:21:41','2026-05-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (285,319,3,'FAC','A',285,0,'00-',517.960,45.00,0.000,0.000,23308.199,0.000,0.000,'2026-05-16 11:46:51','2026-05-16',16,25.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (286,320,6,'FAC','A',286,0,'00-',517.960,30.94,0.000,0.000,16025.680,0.000,0.000,'2026-05-19 15:20:31','2026-05-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (287,125,3,'FAC','A',287,0,'00-',526.870,16.21,0.000,0.000,8540.560,0.000,0.000,'2026-05-22 16:48:19','2026-05-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (288,322,6,'FAC','A',288,0,'00-',530.500,50.00,0.000,0.000,26525.000,0.000,0.000,'2026-05-23 10:07:29','2026-05-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (289,133,3,'FAC','A',289,0,'00-',738.000,4.00,0.000,0.000,2952.000,0.000,0.000,'2026-05-27 16:52:53','2026-05-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (290,323,6,'FAC','A',290,0,'00-',738.000,10.00,0.000,0.000,7380.000,0.000,0.000,'2026-05-27 17:22:51','2026-05-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (291,247,6,'FAC','A',291,0,'00-',738.000,15.00,0.000,0.000,11070.000,0.000,0.000,'2026-05-28 10:25:53','2026-05-28',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (292,321,3,'FAC','A',292,0,'00-',549.370,25.00,0.000,0.000,13022.750,0.000,0.000,'2026-05-29 11:38:22','2026-05-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (293,261,4,'FAC','A',293,0,'00-',557.970,20.00,0.000,0.000,11159.400,0.000,0.000,'2026-06-02 11:14:24','2026-06-02',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (294,298,4,'FAC','A',294,0,'00-',558.640,4.00,0.000,0.000,2234.560,0.000,0.000,'2026-06-03 17:39:05','2026-06-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (295,324,6,'FAC','A',295,0,'00-',560.380,57.00,0.000,0.000,31941.650,0.000,0.000,'2026-06-04 10:56:16','2026-06-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (296,325,3,'FAC','A',296,0,'00-',563.290,19.89,0.000,0.000,11203.830,0.000,0.000,'2026-06-05 18:06:11','2026-06-05',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (297,326,6,'FAC','A',297,0,'00-',563.290,36.00,0.000,0.000,20278.439,0.000,0.000,'2026-06-05 18:29:51','2026-06-05',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (298,327,6,'FAC','A',298,0,'00-',567.680,20.27,0.000,0.000,11506.870,0.000,0.000,'2026-06-06 13:17:01','2026-06-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (299,237,3,'FAC','A',299,0,'00-',567.680,24.00,0.000,0.000,13624.320,0.000,0.000,'2026-06-08 16:04:55','2026-06-08',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (300,38,4,'FAC','A',300,0,'00-',572.680,10.00,0.000,0.000,5726.790,0.000,0.000,'2026-06-10 14:31:46','2026-06-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (301,38,4,'FAC','A',301,0,'00-',577.550,13.87,0.000,0.000,8010.610,0.000,0.000,'2026-06-11 09:40:41','2026-06-11',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (302,2,4,'FAC','A',302,0,'00-33',577.550,10.00,0.000,0.000,5775.500,0.000,0.000,'2026-06-12 13:50:15','2026-06-12',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (303,237,6,'FAC','A',303,0,'00-',587.410,5.00,0.000,0.000,2937.040,0.000,0.000,'2026-06-13 09:01:55','2026-06-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (304,237,3,'FAC','A',304,0,'00-',587.410,18.00,0.000,0.000,10573.380,0.000,0.000,'2026-06-13 09:02:45','2026-06-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (305,322,6,'FAC','A',305,0,'00-',587.410,12.00,0.000,0.000,7048.920,0.000,0.000,'2026-06-13 09:03:32','2026-06-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (306,89,6,'FAC','A',306,0,'00-',587.410,36.00,0.000,0.000,21146.750,0.000,0.000,'2026-06-13 09:04:34','2026-06-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (307,237,6,'FAC','A',307,0,'00-',790.000,10.00,0.000,0.000,7900.000,0.000,0.000,'2026-06-13 09:07:06','2026-06-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (308,237,6,'FAC','A',308,0,'00-',587.410,10.00,0.000,0.000,5874.090,0.000,0.000,'2026-06-13 13:20:38','2026-06-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (309,319,3,'FAC','A',309,0,'00-',587.410,15.00,0.000,0.000,8811.150,0.000,0.000,'2026-06-13 15:06:48','2026-06-13',16,15.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (310,237,3,'FAC','A',310,0,'00-',587.410,20.50,0.000,0.000,12041.900,0.000,0.000,'2026-06-13 15:50:44','2026-06-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (311,328,6,'FAC','A',311,0,'00-',587.410,28.00,0.000,0.000,16447.480,0.000,0.000,'2026-06-15 09:59:01','2026-06-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (312,111,3,'FAC','A',312,0,'00-',587.410,49.00,0.000,0.000,28783.080,0.000,0.000,'2026-06-15 14:00:59','2026-06-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (313,329,6,'FAC','A',313,0,'00-',587.410,38.00,0.000,0.000,22321.570,0.000,0.000,'2026-06-15 16:53:52','2026-06-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (314,161,3,'FAC','A',314,0,'00-',592.520,18.00,0.000,0.000,10665.360,0.000,0.000,'2026-06-17 16:57:30','2026-06-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (315,38,4,'FAC','A',315,0,'00-',602.330,18.00,0.000,0.000,10841.940,0.000,0.000,'2026-06-18 09:15:39','2026-06-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (316,237,3,'FAC','A',316,0,'00-',780.000,12.00,0.000,0.000,9360.000,0.000,0.000,'2026-06-18 10:40:50','2026-06-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (317,237,6,'FAC','A',317,0,'00-',602.330,23.67,0.000,0.000,14257.150,0.000,0.000,'2026-06-18 15:36:18','2026-06-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (318,330,6,'FAC','A',318,0,'00-',607.390,15.00,0.000,0.000,9110.850,0.000,0.000,'2026-06-19 09:43:26','2026-06-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (319,331,3,'FAC','A',319,0,'00-',607.390,18.00,0.000,0.000,10933.020,0.000,0.000,'2026-06-19 11:10:24','2026-06-19',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (320,237,3,'FAC','A',320,0,'00-',607.390,18.00,0.000,0.000,10933.020,0.000,0.000,'2026-06-19 11:11:06','2026-06-19',16,18.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (321,237,3,'FAC','A',321,0,'00-',607.390,18.00,0.000,0.000,10933.020,0.000,0.000,'2026-06-19 11:12:43','2026-06-19',16,18.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (322,244,3,'FAC','A',322,0,'00-',607.390,55.00,0.000,0.000,33406.449,0.000,0.000,'2026-06-19 14:33:19','2026-06-19',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (323,240,3,'FAC','A',323,0,'00-',607.390,93.00,0.000,0.000,56487.270,0.000,0.000,'2026-06-19 15:44:25','2026-06-19',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (324,237,3,'FAC','A',324,0,'00-',607.390,18.00,0.000,0.000,10933.020,0.000,0.000,'2026-06-19 15:45:39','2026-06-19',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion'),
 (325,237,3,'FAC','A',325,0,'00-',612.430,33.18,0.000,0.000,20320.420,0.000,0.000,'2026-06-20 11:07:29','2026-06-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (326,305,4,'FAC','A',326,0,'00-',612.430,18.57,0.000,0.000,11372.810,0.000,0.000,'2026-06-20 14:29:54','2026-06-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (327,333,6,'FAC','A',327,0,'00-',612.430,19.91,0.000,0.000,12193.480,0.000,0.000,'2026-06-20 16:27:29','2026-06-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (328,334,3,'FAC','A',328,0,'00-',612.430,18.00,0.000,0.000,11023.740,0.000,0.000,'2026-06-20 16:47:12','2026-06-20',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (329,38,4,'FAC','A',329,0,'00-',612.430,23.89,0.000,0.000,14630.950,0.000,0.000,'2026-06-22 09:32:15','2026-06-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (330,237,3,'FAC','A',330,0,'00-',617.640,25.00,0.000,0.000,15441.000,0.000,0.000,'2026-06-23 11:25:07','2026-06-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (331,237,3,'FAC','A',331,0,'00-',621.530,20.00,0.000,0.000,12430.590,0.000,0.000,'2026-06-24 09:25:25','2026-06-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (332,237,3,'FAC','A',332,0,'00-',621.530,15.00,0.000,0.000,9322.940,0.000,0.000,'2026-06-24 17:12:24','2026-06-24',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (333,241,3,'FAC','A',333,0,'00-',621.530,20.00,0.000,0.000,12430.580,0.000,0.000,'2026-06-25 15:12:13','2026-06-25',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (334,38,4,'FAC','A',334,0,'00-',623.020,17.00,0.000,0.000,10591.340,0.000,0.000,'2026-06-27 10:58:58','2026-06-27',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion'),
 (335,335,3,'FAC','A',335,0,'00-',623.020,74.78,0.000,0.000,46589.410,0.000,0.000,'2026-06-27 11:30:33','2026-06-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (336,237,3,'FAC','A',336,0,'00-',623.020,17.00,0.000,0.000,10591.340,0.000,0.000,'2026-06-27 11:50:18','2026-06-27',16,0.00,0.000,'Credito',1,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (337,336,3,'FAC','A',337,0,'00-',623.020,15.00,0.000,0.000,9345.300,0.000,0.000,'2026-06-29 10:49:04','2026-06-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (338,337,3,'FAC','A',338,0,'00-',623.020,18.70,0.000,0.000,11650.470,0.000,0.000,'2026-06-29 17:11:52','2026-06-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (339,237,3,'FAC','A',339,0,'00-',623.020,51.00,0.000,0.000,31774.020,0.000,0.000,'2026-06-30 11:11:55','2026-06-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (340,338,3,'FAC','A',340,0,'00-',639.700,31.00,0.000,0.000,19830.699,0.000,0.000,'2026-07-02 11:40:06','2026-07-02',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (341,237,3,'FAC','A',341,0,'00-',652.970,22.00,0.000,0.000,14365.340,0.000,0.000,'2026-07-03 10:53:05','2026-07-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (342,38,4,'FAC','A',342,0,'00-',667.050,47.36,0.000,0.000,31591.480,0.000,0.000,'2026-07-04 12:09:44','2026-07-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (343,237,3,'FAC','A',343,0,'00-',667.050,7.10,0.000,0.000,4736.040,0.000,0.000,'2026-07-04 17:45:17','2026-07-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (344,237,3,'FAC','A',344,0,'00-',667.050,26.05,0.000,0.000,17376.650,0.000,0.000,'2026-07-06 09:08:06','2026-07-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (345,329,6,'FAC','A',345,0,'00-',674.930,35.00,0.000,0.000,22853.949,0.000,0.000,'2026-07-07 15:20:01','2026-07-07',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (346,329,6,'FAC','A',346,0,'00-',674.930,50.89,0.000,0.000,34347.180,0.000,0.000,'2026-07-07 15:41:09','2026-07-07',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (347,237,3,'FAC','A',347,0,'00-',685.940,58.00,0.000,0.000,39784.520,0.000,0.000,'2026-07-08 15:36:55','2026-07-08',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (348,237,3,'FAC','A',348,0,'00-',685.940,62.00,0.000,0.000,42528.281,0.000,0.000,'2026-07-08 18:12:36','2026-07-08',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (349,339,6,'FAC','A',349,0,'00-',700.220,25.00,0.000,0.000,17505.500,0.000,0.000,'2026-07-09 09:46:07','2026-07-09',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (350,340,3,'FAC','A',350,0,'00-',709.690,30.00,0.000,0.000,21290.699,0.000,0.000,'2026-07-10 14:48:29','2026-07-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (351,292,4,'FAC','A',351,0,'00-',709.690,42.94,0.000,0.000,30474.080,0.000,0.000,'2026-07-10 15:54:44','2026-07-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (352,38,4,'FAC','A',352,0,'00-',709.690,11.61,0.000,0.000,8239.500,0.000,0.000,'2026-07-10 18:12:18','2026-07-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (353,237,3,'FAC','A',353,0,'00-',721.350,24.00,0.000,0.000,17312.400,0.000,0.000,'2026-07-11 14:26:24','2026-07-11',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (354,38,4,'FAC','A',354,0,'00-',721.350,23.00,0.000,0.000,16591.051,0.000,0.000,'2026-07-13 09:41:38','2026-07-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (355,38,4,'FAC','A',355,0,'00-',721.350,12.00,0.000,0.000,7227.960,0.000,0.000,'2026-07-13 09:44:09','2026-07-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (356,254,4,'FAC','A',356,0,'00-',724.000,36.00,0.000,0.000,0.000,0.000,0.000,'2026-07-14 15:57:31','2026-07-14',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (357,38,4,'FAC','A',357,0,'00-',725.750,20.00,0.000,0.000,14515.000,0.000,0.000,'2026-07-15 17:15:17','2026-07-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (358,38,4,'FAC','A',358,0,'00-',725.750,18.00,0.000,0.000,13063.500,0.000,0.000,'2026-07-15 17:16:37','2026-07-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (359,125,3,'FAC','A',359,0,'00-',732.480,27.44,0.000,0.000,20099.250,0.000,0.000,'2026-07-17 11:17:28','2026-07-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (360,240,3,'FAC','A',360,0,'00-',732.480,72.00,0.000,0.000,52738.559,0.000,0.000,'2026-07-17 17:21:07','2026-07-17',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (361,134,3,'FAC','A',361,0,'00-',732.480,15.00,0.000,0.000,10987.200,0.000,0.000,'2026-07-18 10:02:47','2026-07-11',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (362,237,3,'FAC','A',362,0,'00-',736.930,4.00,0.000,0.000,2947.720,0.000,0.000,'2026-07-18 10:19:48','2026-07-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (363,341,3,'FAC','A',363,0,'00-',736.930,20.00,0.000,0.000,14515.000,0.000,0.000,'2026-07-18 10:54:32','2026-07-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (364,342,3,'FAC','A',364,0,'00-',736.930,25.00,0.000,0.000,18423.250,0.000,0.000,'2026-07-18 14:42:40','2026-07-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (365,38,4,'FAC','A',365,0,'00-',736.930,7.00,0.000,0.000,5158.500,0.000,0.000,'2026-07-18 14:49:39','2026-07-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (366,244,3,'FAC','A',366,0,'00-',736.930,29.00,0.000,0.000,21370.930,0.000,0.000,'2026-07-18 15:23:18','2026-07-18',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (367,89,3,'FAC','A',367,0,'00-',736.930,30.00,0.000,0.000,22107.881,0.000,0.000,'2026-07-18 16:08:08','2026-07-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (368,344,3,'FAC','A',368,0,'00-',736.930,100.00,0.000,0.000,73692.938,0.000,0.000,'2026-07-18 17:41:37','2026-07-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (369,38,4,'FAC','A',369,0,'00-',736.930,6.78,0.000,0.000,4996.380,0.000,0.000,'2026-07-19 10:29:01','2026-07-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (370,38,4,'FAC','A',370,0,'00-',736.930,11.30,0.000,0.000,8327.300,0.000,0.000,'2026-07-19 10:33:44','2026-07-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (371,236,3,'FAC','A',371,0,'00-',736.930,24.00,0.000,0.000,17686.320,0.000,0.000,'2026-07-19 11:05:23','2026-07-19',16,24.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (372,345,3,'FAC','A',372,0,'00-',736.930,50.00,0.000,0.000,36846.480,0.000,0.000,'2026-07-19 11:37:50','2026-07-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (373,185,3,'FAC','A',373,0,'00-',736.930,5.64,0.000,0.000,4156.280,0.000,0.000,'2026-07-19 12:02:01','2026-07-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (374,213,3,'FAC','A',374,0,'00-',736.930,32.00,0.000,0.000,23581.750,0.000,0.000,'2026-07-19 12:26:49','2026-07-19',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (375,343,3,'FAC','A',375,0,'00-',736.930,12.00,0.000,0.000,8843.160,0.000,0.000,'2026-07-19 12:27:30','2026-07-19',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (376,95,3,'FAC','A',376,0,'00-',736.930,75.00,0.000,0.000,55269.730,0.000,0.000,'2026-07-19 12:28:36','2026-07-19',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (377,343,3,'FAC','A',377,0,'00-',736.930,3.00,0.000,0.000,2210.790,0.000,0.000,'2026-07-20 14:56:19','2026-07-20',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (378,297,3,'FAC','A',378,0,'00-',736.930,23.00,0.000,0.000,16949.381,0.000,0.000,'2026-07-20 17:30:51','2026-07-20',16,23.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (379,38,4,'FAC','A',379,0,'00-',737.230,20.00,0.000,0.000,14744.600,0.000,0.000,'2026-07-21 17:56:25','2026-07-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (380,38,4,'FAC','A',380,0,'00-',737.880,21.00,0.000,0.000,15495.480,0.000,0.000,'2026-07-23 11:44:53','2026-07-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (381,38,4,'FAC','A',381,0,'00-',742.230,25.00,0.000,0.000,18555.750,0.000,0.000,'2026-07-24 14:42:16','2026-07-24',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (382,237,3,'FAC','A',382,0,'00-',742.230,54.00,0.000,0.000,40080.422,0.000,0.000,'2026-07-27 13:14:15','2026-07-27',16,4.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (383,125,3,'FAC','A',383,0,'00-',742.810,22.61,0.000,0.000,16794.930,0.000,0.000,'2026-07-28 09:08:01','2026-07-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (384,346,3,'FAC','A',384,0,'00-',742.810,25.00,0.000,0.000,18570.240,0.000,0.000,'2026-07-28 14:48:10','2026-07-28',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (385,237,3,'FAC','A',385,0,'00-',742.810,30.00,0.000,0.000,22284.301,0.000,0.000,'2026-07-28 16:38:51','2026-07-28',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (386,237,3,'FAC','A',386,0,'00-',742.810,10.00,0.000,0.000,7428.090,0.000,0.000,'2026-07-28 17:01:38','2026-07-28',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (387,237,3,'FAC','A',387,0,'00-',744.230,33.68,0.000,0.000,25065.660,0.000,0.000,'2026-07-29 10:10:57','2026-07-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (388,237,3,'FAC','A',388,0,'00-',744.230,27.00,0.000,0.000,20094.211,0.000,0.000,'2026-07-29 11:21:54','2026-07-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (389,38,4,'FAC','A',389,0,'00-',744.230,20.00,0.000,0.000,14884.600,0.000,0.000,'2026-07-30 09:38:46','2026-07-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (390,237,3,'FAC','A',390,0,'00-',745.640,7.00,0.000,0.000,5219.480,0.000,0.000,'2026-07-30 11:18:55','2026-07-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (391,237,3,'FAC','A',391,0,'00-',745.640,15.00,0.000,0.000,11184.600,0.000,0.000,'2026-07-30 14:40:59','2026-07-30',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (392,57,3,'FAC','A',392,0,'00-',746.630,38.00,0.000,0.000,28371.939,0.000,0.000,'2026-07-31 17:03:12','2026-07-31',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (393,38,4,'FAC','A',393,0,'00-',748.790,44.72,0.000,0.000,33485.879,0.000,0.000,'2026-08-01 10:09:27','2026-08-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (394,237,3,'FAC','A',394,0,'00-',748.790,17.00,0.000,0.000,12729.430,0.000,0.000,'2026-08-01 11:58:01','2026-08-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (395,226,3,'FAC','A',395,0,'00-',748.790,28.00,0.000,0.000,20966.119,0.000,0.000,'2026-08-01 12:02:03','2026-08-01',16,28.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (396,237,3,'FAC','A',396,0,'00-',748.790,10.00,0.000,0.000,7487.900,0.000,0.000,'2026-08-01 16:48:31','2026-08-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (397,237,3,'FAC','A',397,0,'00-',748.790,11.21,0.000,0.000,8393.930,0.000,0.000,'2026-08-01 16:52:03','2026-08-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (398,237,3,'FAC','A',398,0,'00-',748.790,17.00,0.000,0.000,12729.430,0.000,0.000,'2026-08-03 13:47:22','2026-08-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (399,237,3,'FAC','A',399,0,'00-',748.790,17.00,0.000,0.000,12729.430,0.000,0.000,'2026-08-03 16:44:56','2026-08-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (400,345,3,'FAC','A',400,0,'00-',752.090,33.14,0.000,0.000,24924.260,0.000,0.000,'2026-08-04 13:46:11','2026-08-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (401,341,3,'FAC','A',401,0,'00-',752.090,20.00,0.000,0.000,15041.800,0.000,0.000,'2026-08-04 14:26:13','2026-08-04',16,0.00,0.000,'Contado',1,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (402,237,3,'FAC','A',402,0,'00-',752.090,27.62,0.000,0.000,20772.721,0.000,0.000,'2026-08-04 16:42:09','2026-08-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (403,38,4,'FAC','A',403,0,'00-',752.090,22.00,0.000,0.000,16545.980,0.000,0.000,'2026-08-04 17:55:32','2026-08-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (404,38,4,'FAC','A',404,0,'00-',755.900,13.00,0.000,0.000,9826.690,0.000,0.000,'2026-08-06 14:56:43','2026-08-06',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (405,237,3,'FAC','A',405,0,'00-',756.710,15.00,0.000,0.000,11350.650,0.000,0.000,'2026-08-07 17:45:08','2026-08-07',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (406,341,3,'FAC','A',406,0,'00-',756.710,20.00,0.000,0.000,15134.200,0.000,0.000,'2026-08-08 10:30:59','2026-08-08',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (407,343,3,'FAC','A',407,0,'00-',761.220,10.00,0.000,0.000,7612.200,0.000,0.000,'2026-08-12 15:06:05','2026-08-12',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (408,343,3,'FAC','A',408,0,'00-',766.860,24.00,0.000,0.000,18404.641,0.000,0.000,'2026-08-13 14:02:13','2026-08-13',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (409,348,3,'FAC','A',409,0,'00-',772.540,50.00,0.000,0.000,38061.000,0.000,0.000,'2026-08-15 10:12:37','2026-08-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (410,348,3,'FAC','A',410,0,'00-',772.540,23.51,0.000,0.000,18162.410,0.000,0.000,'2026-08-15 15:27:15','2026-08-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (411,349,3,'FAC','A',411,0,'00-',772.540,62.00,0.000,0.000,47897.480,0.000,0.000,'2026-08-15 18:03:18','2026-08-15',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (412,240,3,'FAC','A',412,0,'00-',773.310,50.00,0.000,0.000,38665.488,0.000,0.000,'2026-08-18 10:28:13','2026-08-18',16,50.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (413,343,3,'FAC','A',413,0,'00-',773.310,16.00,0.000,0.000,12372.960,0.000,0.000,'2026-08-18 15:46:01','2026-08-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (414,350,3,'FAC','A',414,0,'00-',777.420,43.00,0.000,0.000,33429.051,0.000,0.000,'2026-08-20 13:45:45','2026-08-20',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (415,343,3,'FAC','A',415,0,'00-',777.420,12.00,0.000,0.000,9329.030,0.000,0.000,'2026-08-20 17:53:13','2026-08-20',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (416,200,3,'FAC','A',416,0,'00-',777.420,61.00,0.000,0.000,47422.621,0.000,0.000,'2026-08-21 10:25:01','2026-08-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (417,112,4,'FAC','A',417,0,'00-',777.420,15.00,0.000,0.000,11661.300,0.000,0.000,'2026-08-21 14:45:31','2026-08-21',16,15.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (418,351,3,'FAC','A',418,0,'00-',777.420,22.00,0.000,0.000,17103.230,0.000,0.000,'2026-08-21 14:46:52','2026-08-21',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (419,38,4,'FAC','A',419,0,'00-',784.660,17.41,0.000,0.000,13660.930,0.000,0.000,'2026-08-22 10:50:53','2026-08-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (420,71,3,'FAC','A',420,0,'00-',784.660,35.00,0.000,0.000,27463.090,0.000,0.000,'2026-08-22 16:49:13','2026-08-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (421,343,3,'FAC','A',421,0,'00-',791.320,20.00,0.000,0.000,15826.400,0.000,0.000,'2026-08-27 11:46:50','2026-08-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (422,330,6,'FAC','A',422,0,'00-',791.320,5.00,0.000,0.000,3956.600,0.000,0.000,'2026-08-29 08:47:09','2026-08-27',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (423,343,3,'FAC','A',423,0,'00-',794.990,25.00,0.000,0.000,19874.750,0.000,0.000,'2026-08-29 12:24:08','2026-08-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (424,343,3,'FAC','A',424,0,'00-',798.330,39.00,0.000,0.000,31134.869,0.000,0.000,'2026-09-01 14:51:00','2026-09-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (425,352,3,'FAC','A',425,0,'00-',798.330,48.00,0.000,0.000,38319.840,0.000,0.000,'2026-09-01 16:00:29','2026-09-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (426,161,3,'FAC','A',426,0,'00-',798.330,23.00,0.000,0.000,18361.590,0.000,0.000,'2026-09-01 17:53:54','2026-09-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (427,38,4,'FAC','A',427,0,'00-',804.810,8.00,0.000,0.000,6438.480,0.000,0.000,'2026-09-03 15:00:32','2026-09-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (428,126,3,'FAC','A',428,0,'00-',804.810,23.00,0.000,0.000,18510.619,0.000,0.000,'2026-09-03 15:06:50','2026-09-03',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (429,38,4,'FAC','A',429,0,'00-',807.390,25.00,0.000,0.000,20184.750,0.000,0.000,'2026-09-04 16:53:56','2026-09-04',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (430,38,4,'FAC','A',430,0,'00-',813.740,21.00,0.000,0.000,17088.539,0.000,0.000,'2026-09-05 11:41:58','2026-09-05',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (431,280,4,'FAC','A',431,0,'00-',813.740,18.00,0.000,0.000,14647.320,0.000,0.000,'2026-09-05 16:34:30','2026-09-05',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (432,38,4,'FAC','A',432,0,'00-',980.000,30.00,0.000,0.000,29400.000,0.000,0.000,'2026-09-08 16:25:26','2026-09-08',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (433,38,4,'FAC','A',433,0,'00-',827.740,20.00,0.000,0.000,16554.801,0.000,0.000,'2026-09-10 11:21:09','2026-09-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (434,38,4,'FAC','A',434,0,'00-',827.740,21.00,0.000,0.000,17382.539,0.000,0.000,'2026-09-10 14:00:44','2026-09-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (435,38,4,'FAC','A',435,0,'00-',827.740,15.00,0.000,0.000,12416.100,0.000,0.000,'2026-09-10 14:37:07','2026-09-10',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (436,244,3,'FAC','A',436,0,'00-',842.210,5.00,0.000,0.000,4211.050,0.000,0.000,'2026-09-12 16:12:22','2026-09-12',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (437,38,4,'FAC','A',437,0,'00-',842.210,12.00,0.000,0.000,10106.520,0.000,0.000,'2026-09-14 15:42:59','2026-09-14',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (438,38,4,'FAC','A',438,0,'00-',842.210,11.00,0.000,0.000,9264.310,0.000,0.000,'2026-09-14 15:46:05','2026-09-14',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (439,38,4,'FAC','A',439,0,'00-',842.210,12.00,0.000,0.000,10106.520,0.000,0.000,'2026-09-16 09:15:04','2026-09-16',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (440,329,6,'FAC','A',440,0,'00-',980.000,5.00,0.000,0.000,4900.000,0.000,0.000,'2026-09-16 15:13:45','2026-09-16',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (441,346,3,'FAC','A',441,0,'00-',846.510,6.00,0.000,0.000,5079.050,0.000,0.000,'2026-09-17 16:57:37','2026-09-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (442,7,3,'FAC','A',442,0,'00-',847.440,24.34,0.000,0.000,20626.680,0.000,0.000,'2026-09-17 17:59:44','2026-09-17',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (443,38,4,'FAC','A',443,0,'00-',848.550,25.00,0.000,0.000,21213.750,0.000,0.000,'2026-09-18 14:42:36','2026-09-18',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (444,38,4,'FAC','A',444,0,'00-',849.560,14.21,0.000,0.000,12072.240,0.000,0.000,'2026-09-19 09:38:32','2026-09-19',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (445,350,3,'FAC','A',445,0,'00-',849.560,16.00,0.000,0.000,13592.960,0.000,0.000,'2026-09-21 15:31:07','2026-09-21',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (446,38,4,'FAC','A',446,0,'00-',852.420,44.00,0.000,0.000,37506.461,0.000,0.000,'2026-09-22 13:21:58','2026-09-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (447,38,4,'FAC','A',447,0,'00-',852.420,27.79,0.000,0.000,23688.740,0.000,0.000,'2026-09-22 14:55:21','2026-09-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (448,133,3,'FAC','A',448,0,'00-',852.420,25.57,0.000,0.000,21796.369,0.000,0.000,'2026-09-22 15:28:41','2026-09-22',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (449,237,3,'FAC','A',449,0,'00-',852.420,45.00,0.000,0.000,38358.898,0.000,0.000,'2026-09-22 15:53:18','2026-09-22',16,45.00,0.000,'Credito',0,0.000,0.000,0,'Administracion'),
 (450,38,4,'FAC','A',450,0,'00-',852.420,15.00,0.000,0.000,12786.300,0.000,0.000,'2026-09-23 13:16:03','2026-09-23',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (451,216,3,'FAC','A',451,0,'00-',852.420,15.00,0.000,0.000,12786.300,0.000,0.000,'2026-09-24 16:54:36','2026-09-24',16,0.00,0.000,'Credito',0,0.000,0.000,0,'Administracion');
INSERT INTO `venta` (`idventa`,`idcliente`,`idvendedor`,`tipo_comprobante`,`serie_comprobante`,`num_comprobante`,`flibre`,`control`,`tasa`,`total_venta`,`base`,`total_iva`,`texe`,`descuento`,`total_pagar`,`fecha_hora`,`fecha_emi`,`impuesto`,`saldo`,`mret`,`estado`,`devolu`,`comision`,`montocomision`,`idcomision`,`user`) VALUES 
 (452,347,3,'FAC','A',452,0,'00-',857.010,20.00,0.000,0.000,15118.000,0.000,0.000,'2026-09-29 16:41:58','2026-09-29',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (453,173,3,'FAC','A',453,0,'00-',860.010,20.00,0.000,0.000,17200.199,0.000,0.000,'2026-10-01 15:19:57','2026-10-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion'),
 (454,224,3,'FAC','A',454,0,'00-',860.010,20.00,0.000,0.000,17112.400,0.000,0.000,'2026-10-01 16:38:42','2026-10-01',16,0.00,0.000,'Contado',0,0.000,0.000,0,'Administracion');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
