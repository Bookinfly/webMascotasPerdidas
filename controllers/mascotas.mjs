import pool from'../config/db.mjs';

//revisar si no va en modelo

export default class Mascota {
    static async getAll() {
        const [rows] = await pool.query('SELECT * FROM animales');
        return rows;
    }

    static async getById(id) {
        const [rows] = await pool.query('SELECT * FROM animales WHERE id = ?', [id]);
        return rows[0]
    }

    static async create(data) {
        const { nombre, tipo, descripcion } = data;
        const [result] = await pool.query('INSERT INTO animales (nombre, tipo, descripcion) VALUES (?, ?, ?)', [nombre, tipo, descripcion]);
        return result.insertId;
    }

    static async update(id, data) {
        const { nombre, tipo, descripcion} = data;
        const [result] = await pool.query('UPDATE animales SET nombre = ?, tipo = ?, descripcion = ? WHERE id = ?', [nombre, tipo, descripcion]);
        return result.affectedRows;
    }

    static async delete(id) {
        const [result] = await pool.query('DELETE FROM animales WHERE id = ?', [id]);
        return result.affectedRows;
    }
}

