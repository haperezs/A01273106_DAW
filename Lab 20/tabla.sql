CREATE TABLE `proveedor` (
 `idProveedor` int(5) NOT NULL AUTO_INCREMENT,
 `rfc` char(12) NOT NULL,
 `nombre` varchar(50) NOT NULL,
 `empresa` varchar(50) NOT NULL,
 `telefono` varchar(10) NOT NULL,
 `direccion` varchar(100) NOT NULL,
 `ciudad` varchar(50) NOT NULL,
 `email` varchar(50) NOT NULL,
 PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1