import mysql from 'mysql2';
import dotenv from 'dotenv';

dotenv.config();


const connection = mysql.createConnection({
    host: process.env.DB_HOST, 
    user: process.env.DB_USER, 
    password: process.env.DB_PASS, 
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

// connection.query('SHOW TABLES', (err, results) => {
//   if (err) {
//     console.error('Error al obtener las tablas:', err);
//     return;
//   }
//   console.log('Tablas en la base de datos:', results);
// });

connection.query('SELECT * FROM animales', (err, results) => {
    if (err) {
      console.error('Error al consultar animales:', err);
      return;
    }
    console.log('Animales:', results);
  });

connection.end();
