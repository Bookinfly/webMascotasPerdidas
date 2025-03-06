import dotenv from 'dotenv';
import express from 'express';
import cors from 'cors';
import path from 'path';
import { fileURLToPath } from 'url';
import mascotaRoutes from './routes/mascotas.mjs';

dotenv.config(); 


const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

app.use(cors());
app.use(express.json());

app.use(express.static(path.join(__dirname, 'public')));

app.use('/api', mascotaRoutes);


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'index.html'));    
});


const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server corriendo🏃en http://localhost:${PORT}`);
});
