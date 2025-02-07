import pool from './config/db.mjs';

async function  testDB() {
    try {
        const [rows] = await pool.query('SELECT 1');
        console.log('✅ Conectado a la base de datos');
    } catch (error) {
        console.error('❌ Error al conectar la base de datos:', error);
    }
}

testDB();