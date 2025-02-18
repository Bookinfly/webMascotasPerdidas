import dotenv from 'dotenv';
dotenv.config(); 
import express from 'express';
import cors from 'cors';
import { dirname } from 'path';
import { fileURLToPath } from 'url';
import mascotaRoutes from './routes/mascotas.mjs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
const app = express();

app.use(cors());

app.use(express.json());


app.get('/', (req, res) => {
    res.send('API funcionando');
});

app.get('/home', (req, res) => {
    res.sendFile(__dirname + 'routes/index.html');
});

app.use('/api', mascotaRoutes);


const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server corriendo🏃en http://localhost:${PORT}`);
});
