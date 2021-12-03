-- Crear una base de datos llamada películas.
DROP DATABASE Peliculas;
CREATE DATABASE Peliculas;
\c peliculas
-- Creando tablas de peliculas y reparto
    CREATE TABLE peliculas (
        id INT PRIMARY KEY,
        pelicula VARCHAR(255),
        ano_estreno VARCHAR(10),
        director VARCHAR (255)
    );

    CREATE TABLE reparto (
        id_pelicula INT,
        actores VARCHAR(255),
        FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id)
    );

-- Cargar ambos archivos a su tabla correspondiente.
COPY peliculas FROM 'peliculas.csv' csv HEADER;
COPY reparto FROM 'reparto.csv' csv HEADER;

-- Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- Listar a todos los actores que aparecen en la película "Titanic".
SELECT actores FROM reparto WHERE id_pelicula = 2;

-- Consultar en cuántas películas del top 100 participa Harrison Ford
SELECT COUNT(actores) FROM reparto WHERE actores ='Harrison Ford';

-- Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT pelicula, ano_estreno FROM peliculas WHERE ano_estreno BETWEEN '1990' AND '1999' ORDER BY ano_estreno ASC;

-- Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”
SELECT pelicula, LENGTH(pelicula) AS "longitud_titulo" FROM peliculas;

-- Consultar cual es la longitud más grande entre todos los títulos de las películas.
SELECT pelicula, LENGTH(pelicula) AS "Pelicula_Con_titulo_mas_largo" FROM peliculas WHERE LENGTH(pelicula) = (SELECT MAX(LENGTH(pelicula)) FROM peliculas)