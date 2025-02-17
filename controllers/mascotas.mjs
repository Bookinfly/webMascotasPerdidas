import pool from'../config/db';

export default class Mascota {
    static async getAll() {
        cont [rows] = await pool.query('SELECT * FROM mascotas');
        return rows;
    }

    static async getById(id) {
        const [rows] = await pool.query('SELECT * FROM mascotas WHERE id = ?', [id]);
        return rows[0]
    }

    static async create(data) {
        const { nombre, tipo, descripcion } = data;
        const [result] = await pool.query('INSERT INTO mascotas (nombre, tipo, descripcion) VALUES (?, ?, ?)', [nombre, tipo, descripcion]);
        return result.insertId;
    }

    static async update(id, data) {
        const { nombre, tipo, descripcion} = data;
        const [result] = await pool.query('UPDATE mascotas SET nombre = ?, tipo = ?, descripcion = ? WHERE id = ?', [nombre, tipo, descripcion]);
        return result.affectedRows;
    }

    static async delete(id) {
        const [result] = await pool.query('DELETE FROM mascotas WHERE id = ?', [id]);
        return result.affectedRows;
    }
}

