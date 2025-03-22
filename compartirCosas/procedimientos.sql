 #consulta para verificar si la cuenta existe
    select count(*) into v_idExiste from tarjetas 
		where v_id_tarjeta = p_id_tarjeta;
        
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
	
