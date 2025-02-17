// Importamos dotenv para manejar variables de entorno
import dotenv from 'dotenv';
dotenv.config(); // Carga las variables de entorno desde el archivo .env

// Importamos Express, que es el framework para crear el servidor
import express from 'express';

// Importamos CORS para permitir solicitudes desde otros dominios
import cors from 'cors';

// Importamos funciones de path y url para manejar rutas de archivos
import { dirname } from 'path';
import { fileURLToPath } from 'url';

// Obtenemos la ubicación actual del archivo para poder usar rutas relativas
const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Creamos una nueva aplicación Express
const app = express();

// Middleware para habilitar CORS, lo que permite que otras aplicaciones puedan consumir tu API
app.use(cors());

// Middleware para parsear JSON en las solicitudes
app.use(express.json());

// Ruta principal para verificar que el servidor esté funcionando
app.get('/', (req, res) => {
    res.send('API funcionando');
});

// Ruta para enviar un archivo HTML como respuesta
app.get('/home', (req, res) => {
    res.sendFile(__dirname + 'routes/index.html/index.html');
});

// Definimos el puerto, usando el de las variables de entorno o el 3000 como fallback
const PORT = process.env.PORT || 3000;

// Iniciamos el servidor y mostramos un mensaje cuando esté corriendo
app.listen(PORT, () => {
    console.log(`Server corriendo🏃en http://localhost:${PORT}`);
});
