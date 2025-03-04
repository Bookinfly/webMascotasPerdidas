import pool from'../config/db.mjs';

export default class Mascota {
    // Propiedad estática para las columnas de la tabla
    static COLUMNAS = 'nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotos';

    static async create(req, res) {
        try {
            console.log("intentando post")

            const { nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotos } = req.body;

            let fotosToString = JSON.stringify(fotos);

            // console.log([nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotosToString])


            const query = `
                INSERT INTO animales (${Mascota.COLUMNAS})
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            `;

            
            // console.log(pool.format(query, [
            //     nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotosToString
            // ]));
            

            const [result] = await pool.query(query, [
                nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotosToString
            ]);

            res.status(201).json({
                id_animal: result.insertId,
                nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotosToString
            });
        } catch (error) {
            console.error('🚨 Error en create:', error);
            res.status(500).json({ error: 'Error interno del servidor' });
        }
    }

    static async getAll(req, res) {
        try {
            console.log('📥 Entrando a Mascota.getAll');
            const [rows] = await pool.query(`SELECT ${Mascota.COLUMNAS} FROM animales`);
            console.log('📋 Datos obtenidos:', rows);
            res.json(rows);
            console.log('📋 Datos obtenidos de la base de datos:', rows);
        } catch (error) {
            console.error('🚨 Error en getAll:', error);
            res.status(500).json({ error: 'Error interno del servidor' });
        }
    }

    static async getById(req, res) {
        try {
            const { id } = req.params;
            const [rows] = await pool.query('SELECT * FROM animales WHERE id_animal = ?', [id]);
            if (rows.length === 0) {
                return res.status(404).json({ error: 'Mascota no encontrada' });
            }
            res.json(rows[0]);
        } catch (error) {
            console.error('🚨 Error en getById:', error);
            res.status(500).json({ error: 'Error interno del servidor' });
        }
    }

    static async update(req, res) {
        try {
            const { id } = req.params;
            const { nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotos } = req.body;

            let fotosToString = JSON.stringify(fotos);

            // Construimos la consulta SQL usando un template string
            const query = `
                UPDATE animales
                SET nombre = ?, tipo = ?, tamaño = ?, edad = ?, raza = ?, color = ?, pelo = ?, amistoso = ?, estado = ?, chip = ?, collar = ?, chapita = ?, castrado = ?, vacunado = ?, fotos = ?
                WHERE id_animal = ?
            `;

            // Ejecutamos la consulta
            const [result] = await pool.query(query, [
                nombre, tipo, tamaño, edad, raza, color, pelo, amistoso, estado, chip, collar, chapita, castrado, vacunado, fotosToString, id
            ]);

            // Verificamos si se actualizó algún registro
            if (result.affectedRows === 0) {
                return res.status(404).json({ error: 'Mascota no encontrada' });
            }

            // Enviamos la respuesta
            res.json({ message: 'Mascota actualizada' });
        } catch (error) {
            console.error('🚨 Error en update:', error);
            res.status(500).json({ error: 'Error interno del servidor' });
        }
    }

    static async delete(req, res) {
        try {
            const { id } = req.params;
            const [result] = await pool.query('DELETE FROM animales WHERE id_animal = ?', [id]);

            // Verificamos si se eliminó algún registro
            if (result.affectedRows === 0) {
                return res.status(404).json({ error: 'Mascota no encontrada' });
            }

            // Enviamos la respuesta
            res.json({ message: 'Mascota eliminada' });
        } catch (error) {
            console.error('🚨 Error en delete:', error);
            res.status(500).json({ error: 'Error interno del servidor' });
        }
    }
}