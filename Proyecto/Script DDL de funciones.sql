use proyecto2;

------------------ Funcion Total a pagar ----------------------------------

/*delimiter //
drop function fn_get_producto;*/

delimiter //
create function proyecto2.fn_get_total ( p_precio double, p_numNoches double)
returns double deterministic 
begin 
	declare total double; 
    
	set total = p_precio * p_numNoches; 
	return total;
end;

select fn_get_total (142, 3) as Total;

---------------------- Funcion Cantidad de Reservaciones -------------------

DELIMITER //
CREATE FUNCTION proyecto2.fn_get_reservaciones (p_id_cliente INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_count INT;
    
    -- Contar las reservas del cliente
    SELECT COUNT(*) INTO v_count FROM reserva WHERE id_cliente = p_id_cliente;
    
    RETURN v_count;
END;

SELECT fn_get_reservaciones (1) as Reservaciones;


---------------------- Funcion confirmacion de Reservaciones -------------------

delimiter //
drop function proyecto2.fn_confirmacion;

delimiter //
create function fn_confirmacion (id_cliente int, id_hotel int)
returns varchar(200) deterministic
begin
	declare cliente varchar(45);
    declare hotel varchar(45);
    
    set cliente = (select concat(nombre, " ", apellido) from cliente
		where id_cliente= id_cliente);
        
	set hotel =(select nombre from hotel where id_hotel=id_hotel limit 1);
    
    if hotel is not null then
		return concat(cliente, " gracias por su reservacion en el hotel ", hotel);
	
    else  return concat(cliente, " No tiene hotel");
    
    end if;
        
end;

select fn_confirmacion(1, 1) as Confirmacion;