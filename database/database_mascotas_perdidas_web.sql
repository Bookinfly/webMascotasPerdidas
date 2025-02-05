USE busqueda_mascotas;

CREATE TABLE usuarios (
	id_usuarios INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NULL,
    telefono VARCHAR(20) NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE usuarios;
CREATE TABLE animales (
	id_animal INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NULL,
    nombre VARCHAR(100),
    tipo ENUM('Perro', 'Gato', 'Huron', 'Erizo', 'Tortuga', 'Otro') NOT NULL,
    tamaño ENUM('Pequeño', 'Mediano', 'Grande') NOT NULL ,
    edad VARCHAR(50) NULL,
	raza ENUM('Sin raza', 'Gato Común Europeo', 'Gato Americano de Pelo Corto','Labrador Retriever', 'Pastor Alemán', 'Bulldog Francés', 'Caniche', 'Golden Retriever', 'Beagle', 'Boxer', 'Yorkshire Terrier', 'Dachshund', 'Siamés', 'Persa', 'Bengala', 'Maine Coon', 'Sphynx', 'Ragdoll', 'Rottweiler', 'Chihuahua', 'Pug', 'Border Collie', 'Husky Siberiano', 'Shih Tzu', 'Boston Terrier', 'Devon Rex', 'Savannah', 'Angora', 'Abisinio', 'Otro') NULL,
    color ENUM('Negro', 'Blanco', 'Marrón Claro', 'Marrón Oscuro', 'Gris', 'Atigrado', 'Bicolor', 'Tricolor', 'Blanco y Negro', 'Blanco y Marrón', 'Blanco y Gris', 'Negro y Marrón', 'Gris y Blanco', 'Gris y Negro', 'Naranja', 'Naranja y Blanco', 'Naranja y Negro', 'Naranja Atigrado') NOT NULL,
    pelo ENUM('Corto', 'Medio', 'Largo') NULL,
    amistoso ENUM('Sí', 'No', 'Sí, pero tener cuidado', 'No, pero es manso', 'Desconocido') DEFAULT 'Desconocido',
    estado ENUM('En casa', 'Perdido', 'Alojado mientras buscamos a su familia', 'En tránsito') DEFAULT 'En casa',
    chip BOOLEAN DEFAULT FALSE,
    collar BOOLEAN DEFAULT FALSE,
    chapita BOOLEAN DEFAULT FALSE,
    castrado BOOLEAN DEFAULT FALSE,
    vacunado BOOLEAN DEFAULT FALSE,
    fotos JSON NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE SET NULL
);

ALTER TABLE usuarios CHANGE id_usuarios id_usuario INT;
ALTER TABLE usuarios MODIFY COLUMN id_usuario int auto_increment;

DESCRIBE animales;

INSERT INTO usuarios (nombre, email, password_hash, telefono)
VALUES ('Jon Arbuckle', 'jon.arbuckle@example.com', 'hashed_password_here', '123456789');


INSERT INTO animales (id_usuario, nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotos)
VALUES (1, 'Garfield', 'Gato', 'Mediano', '6 años', 'Gato Común Europeo', 'Naranja', 'Corto', 'Sí', 'En casa', FALSE, TRUE, TRUE, TRUE, TRUE, '{"imagenes": ["garfield1.jpg", "garfield2.jpg"]}');

SHOW TABLES;


SELECT * FROM usuarios;

CREATE TABLE anuncios (
	id_anuncio INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    tipo ENUM('Buscado', 'Encontrado', 'Avistado', 'En Tránsito', 'En Adopción') NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ubicacion VARCHAR(255) NOT NULL,
    comentarios TEXT NULL,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE anuncios_animales (
	id_anuncio INT NOT NULL,
    id_animal INT NOT NULL,
    PRIMARY KEY (id_anuncio, id_animal),
    FOREIGN KEY (id_anuncio) REFERENCES anuncios(id_anuncio) ON DELETE CASCADE,
	FOREIGN KEY (id_animal) REFERENCES animales(id_animal) ON DELETE CASCADE
);

DESCRIBE anuncios;
DESCRIBE anuncios_animales;

INSERT INTO anuncios (id_usuario, tipo, ubicacion, comentarios)
VALUES (1, 'Buscado', 'Villa Devoto', 'Garfield se escapó, responde a su nombre y es amistoso.');

INSERT INTO anuncios_animales (id_anuncio, id_animal)
VALUES (1, 1);


SELECT * FROM anuncios;
SELECT * FROM anuncios_animales;

SELECT a.id_anuncio, a.tipo, a.ubicacion, a.comentarios,
	an.nombre AS nombre_animal, an.tipo AS tipo_animal, an.color
FROM anuncios a
JOIN anuncios_animales aa ON a.id_anuncio = aa.id_anuncio
JOIN animales an ON aa.id_animal = an.id_animal;
