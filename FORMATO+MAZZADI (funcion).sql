DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_sucursal`(p_id_sucursal INT) RETURNS char(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
declare resultado char (255);
set resultado= (Select provincia_sucursal from sucursales where id_sucursal=p_id_sucursal);
RETURN resultado;
END$$
DELIMITER ;



select get_sucursal (1) Ubicación_Sucursal;

USE `freres`;
DROP function IF EXISTS `tipo_precio`;

DELIMITER $$
USE `freres`$$
CREATE FUNCTION `tipo_precio` (art INT)returns varchar (255) 
deterministic
BEGIN
DECLARE var varchar(255);

SELECT IF (precio >= 8000, "Caro", "Economico") as valor_estimado_prenda into var
from articulos where id_articulo=art;
RETURN var;
END$$

DELIMITER ;

Select tipo_precio(16) AS VALOR_DEL_ARTICULO 





