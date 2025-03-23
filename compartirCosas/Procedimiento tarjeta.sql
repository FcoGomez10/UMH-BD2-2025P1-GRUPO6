/* Procedmientos con error*/

/*drop procedure proyecto2.sp_tarjeta_upd;*/

Delimiter //
create procedure proyecto2.sp_tarjeta_upd (
	in p_id_tarjeta INT,
    in p_id_cliente INT,
    in p_tipoTarjeta INT,
	in p_numTarjeta VARCHAR (45),
    in p_fechaVencimiento DATE,
    in p_nombreTitular VARCHAR (45)
    )
    
    BEGIN
    declare v_id_tarjeta INT;
    declare v_id_cliente INT;
    declare v_tipoTarjeta INT;
    declare v_numTarjeta VARCHAR (45);
    declare v_fechaVencimiento DATE;
    declare v_nombreTitular VARCHAR (45);
    declare v_idExiste INT; 
    
    set p_id_tarjeta = v_id_tarjeta;
    set p_id_cliente = v_id_cliente;
    set p_tipoTarjeta = v_tipoTarjeta;
    set p_numTarjeta = v_numTarjeta;
    set p_fechaVencimiento = v_fechaVencimiento;
    set p_nombreTitular = v_nombreTitular;
    
    select count(*) into v_idExiste from tarjeta
		where id_tarjeta = p_id_tarjeta;
        
	#Condicion para realizar el update de la tabla tarjeta
	if v_idExiste > 0 then
		update tarjeta
			set numTarjeta = v_numTarjeta,
				fechaVencimiento = v_fechaVencimiento,
                nombreTitular = v_nombreTitular,
                id_cliente = v_id_cliente,
                id_tipoTarjeta = v_id_tipoTarjeta
					where id_tarjeta = v_id_tarjeta;
            
    	else select "No se puede realizar el proceso" as Resultado;
            
            
	end if;
    end;
    
   
    call proyecto2.sp_tarjeta_upd (1, 1, 1, '8888-8888-8888-8888', '2025/02/24', 'Carlos Gonzales');
    
    select * from tarjeta;

--------           Procedimiento correcto        ------------------------------------
    DELIMITER //

CREATE PROCEDURE proyecto2.sp_tarjeta_upd (
    IN p_id_tarjeta INT,
    IN p_id_cliente INT,
    IN p_tipoTarjeta INT,
    IN p_numTarjeta VARCHAR(45),
    IN p_fechaVencimiento DATE,
    IN p_nombreTitular VARCHAR(45)
)
BEGIN
    DECLARE v_idExiste INT;
    
    # Verifica si la tarjeta existe
    SELECT COUNT(*) INTO v_idExiste
    FROM tarjeta
    WHERE id_tarjeta = p_id_tarjeta;
    
    # Condición para realizar el update de la tabla tarjeta
    IF v_idExiste > 0 THEN
        UPDATE tarjeta
        SET numTarjeta = p_numTarjeta,
            fechaVencimiento = p_fechaVencimiento,
            nombreTitular = p_nombreTitular,
            id_cliente = p_id_cliente,
            id_tipoTarjeta = p_tipoTarjeta
        WHERE id_tarjeta = p_id_tarjeta;
    ELSE
        SELECT 'No se puede realizar el proceso' AS Resultado;
    END IF;
END;


#procedimiento para actualizar habitacion

delimiter //
drop procedure sp_habitacion_upd;

DELIMITER //
CREATE PROCEDURE proyecto2.sp_habitacion_upd (
    IN p_id_habitacion INT,
    IN p_precio decimal (10, 2),
    IN p_id_hotel INT,
    IN p_id_tipoHabitacion int,
    IN p_id_acomodacion int
)
BEGIN
    DECLARE v_idExiste INT;
    
    # Verifica si la tarjeta existe
    SELECT COUNT(*) INTO v_idExiste
    FROM habitacion
    WHERE id_habitacion = p_id_habitacion;
    
    # Condición para realizar el update de la tabla habitacion
    IF v_idExiste > 0 THEN
        UPDATE habitacion
        SET precio = p_precio,
            id_hotel = p_id_hotel,
            id_tipoHabitacion = p_id_tipoHabitacion,
            id_acomodacion = p_id_acomodacion
        WHERE id_habitacion = p_id_habitacion;
    ELSE
        SELECT 'No se puede realizar el proceso' AS Resultado;
    END IF;
END;


call sp_habitacion_upd(1, 190.00, 3, 2, 2);

select * from habitacion;

