import express from 'express';
import Mascota from '../controllers/mascotas.mjs';
import { validarMascota, validarId } from '../middlewares/mascotaValidator.mjs';


const router = express.Router();

router.get('/mascotas', Mascota.getAll);
router.post('/mascotas', validarMascota ,Mascota.create);
router.put('/mascotas/:id', validarId, Mascota.update);
router.delete('/mascotas/:id', validarId , Mascota.delete);

export default router;
