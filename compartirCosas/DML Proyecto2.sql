#PROYECTO FORMULARIO DE HOTEL

ALTER SCHEMA `proyecto2`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `proyecto2`.`cliente` 
DROP FOREIGN KEY `fk_participante_domicilio1`;

ALTER TABLE `proyecto2`.`reserva` 
DROP FOREIGN KEY `fk_reserva_participante1`,
DROP FOREIGN KEY `fk_reserva_tarjeta1`;

ALTER TABLE `proyecto2`.`tarjeta` 
DROP FOREIGN KEY `fk_tarjeta_participante1`,
DROP FOREIGN KEY `fk_tarjeta_tipoTarjeta1`;

ALTER TABLE `proyecto2`.`personaContacto` 
DROP FOREIGN KEY `fk_contacto_hotel`;

ALTER TABLE `proyecto2`.`domicilio` 
DROP FOREIGN KEY `fk_domicilio_ciudad1`;

ALTER TABLE `proyecto2`.`habitacion` 
DROP FOREIGN KEY `fk_Habitacion_hotel1`,
DROP FOREIGN KEY `fk_habitacion_tipoHabitacion1`;

ALTER TABLE `proyecto2`.`ciudad` 
DROP FOREIGN KEY `fk_ciudad_pais1`;

ALTER TABLE `proyecto2`.`cliente` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`hotel` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`reserva` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`tarjeta` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`personaContacto` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`domicilio` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`habitacion` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `id_acomodacion` INT(11) NOT NULL AFTER `id_tipoHabitacion`,
CHANGE COLUMN `precio` `precio` DECIMAL NULL DEFAULT NULL ,
ADD INDEX `fk_habitacion_acomodacion1_idx` (`id_acomodacion` ASC) VISIBLE;
;

ALTER TABLE `proyecto2`.`tipoTarjeta` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`ciudad` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`pais` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `proyecto2`.`tipoHabitacion` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `proyecto2`.`acomodacion` (
  `id_acomodacion` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_acomodacion`))

ALTER TABLE `proyecto2`.`cliente` 
ADD CONSTRAINT `fk_participante_domicilio1`
  FOREIGN KEY (`id_domicilio`)
  REFERENCES `proyecto2`.`domicilio` (`id_domicilio`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `proyecto2`.`reserva` 
DROP FOREIGN KEY `fk_reserva_habitacion1`;

ALTER TABLE `proyecto2`.`reserva` ADD CONSTRAINT `fk_reserva_participante1`
  FOREIGN KEY (`id_cliente`)
  REFERENCES `proyecto2`.`cliente` (`id_cliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_reserva_tarjeta1`
  FOREIGN KEY (`id_tarjeta`)
  REFERENCES `proyecto2`.`tarjeta` (`id_tarjeta`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_reserva_habitacion1`
  FOREIGN KEY (`id_habitacion`)
  REFERENCES `proyecto2`.`habitacion` (`id_habitacion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `proyecto2`.`tarjeta` 
ADD CONSTRAINT `fk_tarjeta_participante1`
  FOREIGN KEY (`id_cliente`)
  REFERENCES `proyecto2`.`cliente` (`id_cliente`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tarjeta_tipoTarjeta1`
  FOREIGN KEY (`id_tipoTarjeta`)
  REFERENCES `proyecto2`.`tipoTarjeta` (`id_tipoTarjeta`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `proyecto2`.`personaContacto` 
ADD CONSTRAINT `fk_contacto_hotel`
  FOREIGN KEY (`id_hotel`)
  REFERENCES `proyecto2`.`hotel` (`id_hotel`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `proyecto2`.`domicilio` 
ADD CONSTRAINT `fk_domicilio_ciudad1`
  FOREIGN KEY (`id_ciudad`)
  REFERENCES `proyecto2`.`ciudad` (`id_ciudad`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `proyecto2`.`habitacion` 
ADD CONSTRAINT `fk_Habitacion_hotel1`
  FOREIGN KEY (`id_hotel`)
  REFERENCES `proyecto2`.`hotel` (`id_hotel`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_habitacion_tipoHabitacion1`
  FOREIGN KEY (`id_tipoHabitacion`)
  REFERENCES `proyecto2`.`tipoHabitacion` (`id_tipoHabitacion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_habitacion_acomodacion1`
  FOREIGN KEY (`id_acomodacion`)
  REFERENCES `proyecto2`.`acomodacion` (`id_acomodacion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `proyecto2`.`ciudad` 
ADD CONSTRAINT `fk_ciudad_pais1`
  FOREIGN KEY (`id_pais`)
  REFERENCES `proyecto2`.`pais` (`id_pais`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


USE `proyecto2`;
DROP procedure IF EXISTS `proyecto2`.`sp_tarjeta_upd`;

USE `proyecto2`;
DROP procedure IF EXISTS `proyecto2`.`sp_cliente_upd`;
