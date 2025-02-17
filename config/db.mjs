// Importamos la librería mysql2 en su versión para promesas
import mysql from 'mysql2/promise';
// Importamos dotenv para manejar las variables de entorno
import dotenv from 'dotenv';

// Cargamos las variables de entorno desde el archivo .env
dotenv.config();

// Creamos un pool de conexiones con la configuración obtenida desde las variables de entorno
const pool = mysql.createPool({
    host: process.env.DB_HOST,       // Dirección del servidor MySQL (localhost, por ejemplo)
    user: process.env.DB_USER,       // Usuario de la base de datos
    password: process.env.DB_PASS,   // Contraseña del usuario
    database: process.env.DB_NAME,   // Nombre de la base de datos
    waitForConnections: true,        // Esperar si todas las conexiones están en uso
    connectionLimit: 10,             // Número máximo de conexiones simultáneas
    queueLimit: 0                    // Número máximo de solicitudes en espera (0 significa sin límite)
});

// Exportamos el pool para poder usarlo en otras partes del proyecto
export default pool;
