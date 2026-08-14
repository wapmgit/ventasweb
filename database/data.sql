-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para svweb
CREATE DATABASE IF NOT EXISTS `svweb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `svweb`;

-- Volcando estructura para tabla svweb.agrupados
CREATE TABLE IF NOT EXISTS `agrupados` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.ajustes
CREATE TABLE IF NOT EXISTS `ajustes` (
  `idajuste` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(80) NOT NULL,
  `responsable` varchar(30) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `monto` float(11,2) NOT NULL,
  `estatus` int(11) DEFAULT '0',
  PRIMARY KEY (`idajuste`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.apartado
CREATE TABLE IF NOT EXISTS `apartado` (
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.artcnt
CREATE TABLE IF NOT EXISTS `artcnt` (
  `codigo` varchar(50) DEFAULT NULL,
  `cnt` float(9,3) DEFAULT NULL,
  `idart` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.articulos
CREATE TABLE IF NOT EXISTS `articulos` (
  `idarticulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codweb` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` double(9,3) NOT NULL,
  `apartado` float(9,3) DEFAULT '0.000',
  `descripcion` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etiquetas` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unidad` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cntxund` int(11) DEFAULT '1',
  `cntgrupo` float(9,3) DEFAULT '1.000',
  `usagrupo` int(11) DEFAULT '0',
  `fraccion` float(9,3) NOT NULL DEFAULT '1.000',
  `comi` int(11) DEFAULT '0',
  `pcomision` float(5,2) DEFAULT '0.00',
  `volumen` float(9,3) DEFAULT '0.000',
  `grados` float(9,3) DEFAULT '0.000',
  `peso` float(9,3) DEFAULT '0.000',
  `minimo` float(9,3) DEFAULT NULL,
  `vence` date DEFAULT NULL,
  `showlista` int(11) DEFAULT '1',
  `oferta` int(11) DEFAULT '0',
  `imagen` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ninguna.jpg',
  `estado` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idarticulo`)
) ENGINE=InnoDB AUTO_INCREMENT=1595 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.bancos
CREATE TABLE IF NOT EXISTS `bancos` (
  `idbanco` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `cuentaban` varchar(25) DEFAULT NULL,
  `tipocta` varchar(20) DEFAULT NULL,
  `titular` varchar(50) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idbanco`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `condicion` int(11) NOT NULL,
  `licor` int(11) DEFAULT '0',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.categoriaclientes
CREATE TABLE IF NOT EXISTS `categoriaclientes` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecategoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.clasi_gasto
CREATE TABLE IF NOT EXISTS `clasi_gasto` (
  `idclasi` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idclasi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `rif` varchar(20) DEFAULT NULL,
  `codpais` varchar(4) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `licencia` varchar(10) DEFAULT NULL,
  `catcomercial` varchar(50) DEFAULT '1',
  `status` varchar(3) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `casa` varchar(50) DEFAULT NULL,
  `avenida` varchar(50) DEFAULT NULL,
  `barrio` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `municipio` varchar(50) DEFAULT NULL,
  `entidad` varchar(50) DEFAULT NULL,
  `codpostal` varchar(50) DEFAULT NULL,
  `latitud` decimal(10,8) DEFAULT '0.00000000',
  `longitud` decimal(10,8) DEFAULT '0.00000000',
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
) ENGINE=InnoDB AUTO_INCREMENT=2435 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.comisiones
CREATE TABLE IF NOT EXISTS `comisiones` (
  `id_comision` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendedor` int(11) DEFAULT NULL,
  `montoventas` float(9,3) DEFAULT NULL,
  `montocomision` float(9,3) DEFAULT NULL,
  `pendiente` float(9,3) DEFAULT '0.000',
  `fecha` date DEFAULT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_comision`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.compras
CREATE TABLE IF NOT EXISTS `compras` (
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
  `diascre` int(11) DEFAULT '0',
  `nota` varchar(200) DEFAULT NULL,
  `estatus` varchar(15) NOT NULL DEFAULT '0',
  `tasa` float(9,3) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idcompra`)
) ENGINE=InnoDB AUTO_INCREMENT=874 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.comprobante
CREATE TABLE IF NOT EXISTS `comprobante` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1585 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.ctascon
CREATE TABLE IF NOT EXISTS `ctascon` (
  `idcod` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) CHARACTER SET utf8 NOT NULL,
  `descrip` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `tipo` double(2,0) NOT NULL DEFAULT '0',
  `inactiva` double(1,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `idcod` (`idcod`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.cxcclientes
CREATE TABLE IF NOT EXISTS `cxcclientes` (
  `codcliente` varchar(50) DEFAULT NULL,
  `tipoodoc` varchar(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `cxc` float(9,3) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.datacsv
CREATE TABLE IF NOT EXISTS `datacsv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idarticulo` int(11) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `costo` float(9,3) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.detalle_ajustes
CREATE TABLE IF NOT EXISTS `detalle_ajustes` (
  `iddetalle_ajuste` int(11) NOT NULL AUTO_INCREMENT,
  `idajuste` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `tipo_ajuste` varchar(15) NOT NULL,
  `cantidad` float(9,3) NOT NULL,
  `costo` float(11,2) NOT NULL,
  `valorizado` float(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_ajuste`)
) ENGINE=InnoDB AUTO_INCREMENT=914 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.detalle_apartado
CREATE TABLE IF NOT EXISTS `detalle_apartado` (
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.detalle_compras
CREATE TABLE IF NOT EXISTS `detalle_compras` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4591 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.detalle_devolucion
CREATE TABLE IF NOT EXISTS `detalle_devolucion` (
  `iddetalle_devolucion` int(11) NOT NULL AUTO_INCREMENT,
  `iddevolucion` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` float(11,2) NOT NULL,
  `descuento` float(11,2) NOT NULL,
  PRIMARY KEY (`iddetalle_devolucion`)
) ENGINE=InnoDB AUTO_INCREMENT=2333 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.detalle_devolucioncompras
CREATE TABLE IF NOT EXISTS `detalle_devolucioncompras` (
  `iddetalle` int(11) NOT NULL AUTO_INCREMENT,
  `iddevolucion` int(11) NOT NULL,
  `codarticulo` int(11) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`iddetalle`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.detalle_pedido
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
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
  `cntgrp` float(7,2) DEFAULT '1.00',
  PRIMARY KEY (`iddetalle_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=69782 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `costoarticulo` float(9,3) DEFAULT NULL,
  `iva` int(11) DEFAULT '0',
  `precioriginal` float(11,3) DEFAULT '0.000',
  `cantidad` float(7,3) DEFAULT NULL,
  `precio_venta` float(11,3) NOT NULL,
  `descuento` float(7,2) NOT NULL,
  `precio` float(9,3) DEFAULT NULL,
  `pcomiarti` float(9,3) DEFAULT '0.000',
  `mcomiarti` float(9,3) DEFAULT '0.000',
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_emi` date DEFAULT NULL,
  `unidad` varchar(15) DEFAULT 'UND',
  `cntgrp` int(11) DEFAULT '1',
  PRIMARY KEY (`iddetalle_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=92820 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.devolucion
CREATE TABLE IF NOT EXISTS `devolucion` (
  `iddevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `comprobante` varchar(15) NOT NULL,
  `fecha_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(20) NOT NULL,
  PRIMARY KEY (`iddevolucion`)
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.devolucioncompras
CREATE TABLE IF NOT EXISTS `devolucioncompras` (
  `iddevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `idcompra` int(11) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`iddevolucion`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
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
  `calc_comi` int(11) DEFAULT '0',
  `web` int(11) DEFAULT '0',
  `tikect` int(11) DEFAULT '0',
  `nlineas` int(11) DEFAULT '0',
  `orderart` int(11) DEFAULT '0',
  `caracteres` int(11) DEFAULT '34',
  `facfiscalcredito` int(11) DEFAULT '0',
  `relapedido` int(11) DEFAULT '0',
  `formatofac` varchar(20) DEFAULT NULL,
  `printimgfact` int(11) DEFAULT '0',
  `formatolp` varchar(20) DEFAULT 'listaprecio',
  `formatoeti` varchar(20) DEFAULT 'etiquetas',
  `precioeti` varchar(20) DEFAULT 'precio1',
  `bordefac` int(11) DEFAULT '0',
  `printpeso` int(11) DEFAULT '0',
  `lastact` date DEFAULT NULL,
  `relaprecios` int(11) DEFAULT '0',
  `difpre` float(9,3) DEFAULT '0.000',
  `claveauto` varchar(50) DEFAULT '00000',
  `utilpre1` int(11) DEFAULT '0',
  `codart` varchar(20) DEFAULT 'codigo',
  `mp2` int(11) DEFAULT '0',
  `mp3` int(11) DEFAULT '0',
  PRIMARY KEY (`idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.formalibre
CREATE TABLE IF NOT EXISTS `formalibre` (
  `idforma` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) DEFAULT NULL,
  `nrocontrol` int(11) DEFAULT NULL,
  `anulado` int(11) DEFAULT '0',
  PRIMARY KEY (`idforma`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.gastos
CREATE TABLE IF NOT EXISTS `gastos` (
  `idgasto` int(11) NOT NULL AUTO_INCREMENT,
  `idpersona` int(11) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `tipogasto` int(11) DEFAULT '1',
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.kardex
CREATE TABLE IF NOT EXISTS `kardex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `idarticulo` int(11) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL,
  `costo` float(9,3) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101420 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.kardexrepetido
CREATE TABLE IF NOT EXISTS `kardexrepetido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(50) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `idarticulo` int(11) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL,
  `costo` float(9,3) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20768 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.kardexrepetido_soloventas
CREATE TABLE IF NOT EXISTS `kardexrepetido_soloventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` varchar(50) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `idarticulo` int(11) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL,
  `costo` float(9,3) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20738 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.kardex_updatestock
CREATE TABLE IF NOT EXISTS `kardex_updatestock` (
  `idarticulo` int(11) DEFAULT NULL,
  `cantidad` float(9,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.monedas
CREATE TABLE IF NOT EXISTS `monedas` (
  `idmoneda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `tipom` varchar(2) DEFAULT 'N',
  `tipo` int(11) DEFAULT NULL,
  `simbolo` char(3) DEFAULT 'sm',
  `valor` float(9,3) DEFAULT '0.000',
  `idbanco` int(11) DEFAULT '0',
  `sumcaja` int(11) DEFAULT '1',
  PRIMARY KEY (`idmoneda`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.mov_ban
CREATE TABLE IF NOT EXISTS `mov_ban` (
  `id_mov` int(11) NOT NULL AUTO_INCREMENT,
  `idbanco` int(11) DEFAULT NULL,
  `clasificador` int(11) DEFAULT NULL,
  `tipodoc` char(4) DEFAULT '0',
  `docrelacion` int(11) DEFAULT '0',
  `iddocumento` int(11) DEFAULT '0',
  `tipo_mov` text,
  `numero` varchar(20) DEFAULT NULL,
  `moneda` varchar(50) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=19264 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.mov_notas
CREATE TABLE IF NOT EXISTS `mov_notas` (
  `id_mov` int(11) NOT NULL AUTO_INCREMENT,
  `tipodoc` varchar(5) DEFAULT NULL,
  `iddoc` int(11) DEFAULT NULL,
  `monto` float(9,3) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `referencia` varchar(20) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_mov`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.mov_notasp
CREATE TABLE IF NOT EXISTS `mov_notasp` (
  `id_mov` int(11) NOT NULL AUTO_INCREMENT,
  `tipodoc` varchar(5) DEFAULT NULL,
  `iddoc` int(11) DEFAULT NULL,
  `monto` float(9,3) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `referencia` varchar(20) DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_mov`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.notasadm
CREATE TABLE IF NOT EXISTS `notasadm` (
  `idnota` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `ndocumento` int(11) DEFAULT '0',
  `idcliente` int(11) DEFAULT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `monto` float(9,3) NOT NULL,
  `fecha` date DEFAULT NULL,
  `pendiente` float(9,3) NOT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `pordevolucion` int(11) DEFAULT '0',
  `iddocnc` int(11) DEFAULT '0',
  `movban` int(11) DEFAULT '0',
  PRIMARY KEY (`idnota`)
) ENGINE=InnoDB AUTO_INCREMENT=633 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.notasadmp
CREATE TABLE IF NOT EXISTS `notasadmp` (
  `idnota` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) DEFAULT NULL,
  `ndocumento` int(11) DEFAULT '0',
  `idproveedor` int(11) DEFAULT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `monto` float(9,3) NOT NULL,
  `fecha` date DEFAULT NULL,
  `pendiente` float(9,3) NOT NULL,
  `movban` int(11) DEFAULT '0',
  `usuario` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idnota`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7317 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.recibos
CREATE TABLE IF NOT EXISTS `recibos` (
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
  `idmovban` int(11) DEFAULT '0',
  `tasab` float(11,2) DEFAULT NULL,
  `tasap` float(11,2) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `aux` varchar(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fecharecibo` date DEFAULT NULL,
  `idcomision` int(11) DEFAULT '0',
  `usuario` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idrecibo`)
) ENGINE=InnoDB AUTO_INCREMENT=19593 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.reciboscomision
CREATE TABLE IF NOT EXISTS `reciboscomision` (
  `id_recibo` int(11) NOT NULL AUTO_INCREMENT,
  `id_comision` int(11) DEFAULT NULL,
  `monto` float(9,3) DEFAULT NULL,
  `observacion` varchar(80) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `user` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_recibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.relacionnc
CREATE TABLE IF NOT EXISTS `relacionnc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmov` int(11) DEFAULT NULL,
  `idnota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=696 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.relacionncp
CREATE TABLE IF NOT EXISTS `relacionncp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idmov` int(11) DEFAULT NULL,
  `idnota` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.retenc
CREATE TABLE IF NOT EXISTS `retenc` (
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.retenciones
CREATE TABLE IF NOT EXISTS `retenciones` (
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.retencionventas
CREATE TABLE IF NOT EXISTS `retencionventas` (
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.roles
CREATE TABLE IF NOT EXISTS `roles` (
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
  `editcompra` int(11) DEFAULT '0',
  `anularrc` int(11) DEFAULT '0',
  `importarne` int(11) DEFAULT '0',
  `editserial` int(11) DEFAULT '0',
  `printcertificado` int(11) DEFAULT '0',
  `crearventa` int(11) DEFAULT '0',
  `cargarapida` int(11) DEFAULT '0',
  `factsinexis` int(11) DEFAULT '0',
  `anularventa` int(11) DEFAULT '0',
  `anularrv` int(11) DEFAULT '0',
  `cambiarprecioventa` int(11) DEFAULT '0',
  `editfecha` int(11) DEFAULT '0',
  `crearpedido` int(11) DEFAULT '0',
  `editpedido` int(11) DEFAULT '0',
  `anularpedido` int(11) DEFAULT '0',
  `importarpedido` int(11) DEFAULT '0',
  `crearajuste` int(11) DEFAULT '0',
  `anularaj` int(11) DEFAULT '0',
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
  `rvencicobro` int(11) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.rutas
CREATE TABLE IF NOT EXISTS `rutas` (
  `idruta` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idruta`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.seriales
CREATE TABLE IF NOT EXISTS `seriales` (
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

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.sistema
CREATE TABLE IF NOT EXISTS `sistema` (
  `idempresa` int(11) DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechavence` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.tasassistema
CREATE TABLE IF NOT EXISTS `tasassistema` (
  `fecha` date DEFAULT NULL,
  `tasadolar` double(15,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.tipo_gasto
CREATE TABLE IF NOT EXISTS `tipo_gasto` (
  `idgasto` int(11) NOT NULL AUTO_INCREMENT,
  `idclasi` int(11) DEFAULT NULL,
  `nombregasto` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idgasto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.users
CREATE TABLE IF NOT EXISTS `users` (
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.vendedores
CREATE TABLE IF NOT EXISTS `vendedores` (
  `id_vendedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `comision` int(11) DEFAULT '0',
  `cedula` varchar(20) DEFAULT NULL,
  `tipo` varchar(2) DEFAULT 'V',
  PRIMARY KEY (`id_vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla svweb.venta
CREATE TABLE IF NOT EXISTS `venta` (
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
) ENGINE=InnoDB AUTO_INCREMENT=14176 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
