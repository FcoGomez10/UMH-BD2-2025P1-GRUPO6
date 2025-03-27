#activar base de datos
use proyecto2;

# -------------- Inserciones Cliente ------------------------

# Inserción de países
INSERT INTO pais (nombre)
VALUES 
    ("Honduras"),
    ("Mexico"),
    ("USA");

# Inserción de ciudades
INSERT INTO ciudad (nombre, id_pais)
VALUES 
    ("Ciudad de Mexico", 1), ("Tegucigalpa", 2), ("USA", 3);
    

# Inserción de domicilios
INSERT INTO domicilio (direccion, id_ciudad)
VALUES 
    ("AV. Reforma 200", 1), ("Col. Kennedy 2da entrada", 2), ("Washington, DC 20500", 3) ;

# Inserción de clientes
INSERT INTO cliente 
    (nombre, apellido, organizacion, cargo, numPasaporte, 
     fechaNacimiento, nacionalidad, telefono, fax, email, id_domicilio) 
VALUES 
    ('Carlos', 'González', 'Empresa A', 'Gerente', 'X123456', '1985-05-10', 'Mexicano', '555-1234', 
     '555-5678', 'carlos@email.com', 1),
    ('Felipe', 'Hernandez', 'Empresa B', 'Jefe', 'Z654321', '1990-08-23', 'Hondureño', '9887-4321', 
     '2240-5824', 'felipe@email.com', 2),
    ('John', 'Donovan', 'Empresa 3', 'SubGerente', 'U741963', '1976-12-06', 'Americano', '7443-8526', 
     '7443-9517', 'john@email.com', 3);

# Consulta para verificar la inserción de clientes
SELECT * FROM proyecto2.cliente;
truncate table cliente;

# ------------------------ Inserciones Hotel ------------------------------------------

# Inserción de hoteles
INSERT INTO hotel (nombre)
VALUES 
    ("Plaza San Francisco"), 
    ("Caesar Business Santiago"), 
    ("Sheraton Santiago"), 
    ("San Cristobal Tower");

# Inserción de tipos de habitación
INSERT INTO tipoHabitacion (tipoHabitacion)
VALUES
    ("Standard"), 
    ("Classic"), 
    ("Grand Deluxe");

# Inserción de tipos de acomodación
INSERT INTO acomodacion (tipo)
VALUES 
    ("single"), 
    ("doble"), 
    ("twin");

# Inserción de habitaciones
INSERT INTO habitacion (id_hotel, id_tipoHabitacion, id_acomodacion, precio)
VALUES 
    (1, 1, 1, 125.00),
    (2, 1, 3, 120.00),
    (4, 3, 2, 190.00);

# Consulta para verificar la inserción de habitaciones
SELECT * FROM habitacion;

# --------------------------- Inserciones Tarjeta ---------------------------------------

# Inserción de tipos de tarjeta
INSERT INTO tipoTarjeta (tipo)
VALUES 
    ('AMEX'), 
    ('VISA'), 
    ('MasterCard'), 
    ('Diners');

# Inserción de tarjetas
INSERT INTO tarjeta (numTarjeta, fechaVencimiento, nombreTitular, id_cliente, id_tipoTarjeta)
VALUES 
    ('9999-9999-9999-9999', '2025/01/15', 'Carlos Gonzales', 1, 1),
    ('8888-8888-8888-8888', '2028/03/29', 'Felipe Hernandez', 2, 3),
    ('9999-8888-9999-8888', '2030/10/17', 'Jhon Donovan', 3, 2);

# Consulta para verificar la inserción de tarjetas
SELECT * FROM proyecto2.tarjeta;
