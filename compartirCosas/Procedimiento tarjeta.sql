/* Procedmientos*/

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
