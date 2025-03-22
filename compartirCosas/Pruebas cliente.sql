Use proyecto2;

insert into pais (nombre)
	values ("Honduras"),
		   ("Mexico"),
           ("USA");

insert into ciudad (nombre, id_pais)
	values ("Ciudad de Mexico", 2);

insert into domicilio (direccion, id_ciudad)
	values ("AV. Reforma 200", 2);

INSERT INTO cliente 
(nombre, apellido, organizacion, cargo, numPasaporte, 
fechaNacimiento, nacionalidad, telefono, fax, email, id_domicilio) 
	VALUES 
	(	'Carlos', 
		'González', 
		'Empresa A', 
		'Gerente', 
		'X123456', 
		'1985-05-10', 
		'Mexicano', 
		'555-1234', 
		'555-5678', 
		'carlos@email.com', 
		2);
        
        select * from proyecto2.cliente;
