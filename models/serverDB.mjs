// Importamos el pool de conexiones desde el archivo db.mjs donde configuramos la conexión con MySQL
import pool from '../config/db.mjs';

// Función asincrónica para probar la conexión a la base de datos
async function testDB() {
    try {
        // Realizamos una consulta simple 'SELECT 1' que no tiene otro propósito más que comprobar que la conexión funciona
        const [rows] = await pool.query('SELECT 1');
        console.log('✅ Conectado a la base de datos');  // Si todo sale bien, mostramos un mensaje de éxito
    } catch (error) {
        // Si ocurre un error, lo capturamos aquí y lo mostramos en la consola
        console.error('❌ Error al conectar la base de datos:', error);
    }
}

// Llamamos a la función para que se ejecute al iniciar el archivo
testDB();
