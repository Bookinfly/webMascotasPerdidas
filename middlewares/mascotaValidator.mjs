import { body, param, validationResult} from 'express-validator';

// Validar datos al crear o actualizar una mascota

export const validarMascota = [
    body('nombre').notEmpty().withMessage('El nombre es obligatorio'),
    body('tipo').notEmpty().withMessage('El tipo es obligatorio'),
    body('raza').notEmpty().withMessage('La raza es obligatoria'),
    body('estado').isIn(['En casa', 'Perdido', 'Alojado mientras buscamos a su familia', 'En tránsito']).withMessage('El estado no es válido'),
    (req, res, next) => {
        const errors = validationResult(req);
        if(!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }
        next();
    }
];

// Validar el ID en rutas que lo necesiten
export const validarId = [
    param('id').isNumeric().withMessage('El ID debe ser un número válido'),
    (req, res, next) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            return res.status(400).json({ errors: errors.array() });
        }
        next();
    }
];