-- Borra antes la base si existe

DROP TABLE IF EXISTS amigos;
/* Comentario para varias líneas */

CREATE TABLE amigos (
    nombre VARCHAR, 
    edad INT, 
    email VARCHAR
);

-- Comillas simples para texto en postgresql

INSERT INTO amigos
VALUES ('Juan Arevalo',
        35,
        'juan@gmail.com'
);