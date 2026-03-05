const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'escuela_api'
});

db.connect(err => {
    if (err) {
        console.error("Error conectando a BD:", err);
        return;
    }
    console.log("Base de datos conectada");
});
// 🔥 OBTENER TODOS LOS ALUMNOS
app.get('/alumnos', (req, res) => {
    db.query('SELECT * FROM alumnos', (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: 'Error en servidor' });
        }
        res.json(results);
    });
});

// OBTENER ALUMNO POR ID
app.get('/alumnos/:id', (req, res) => {
    const id = req.params.id;

    db.query(
        'SELECT * FROM alumnos WHERE id = ?',
        [id],
        (err, results) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: 'Error en servidor' });
            }

            if (results.length === 0) {
                return res.status(404).json({ mensaje: 'Alumno no encontrado' });
            }

            res.json(results[0]); // 👈 devolvemos SOLO un objeto
        }
    );
});;

// AGREGAR ALUMNO
app.post('/alumnos', (req, res) => {
    const { matricula, nombre, salon_id } = req.body;

    db.query(
        'INSERT INTO alumnos (matricula, nombre, salon_id) VALUES (?, ?, ?)',
        [matricula, nombre, salon_id],
        (err, result) => {
            if (err) return res.status(500).json(err);

            res.status(201).json({
                id: result.insertId,
                matricula: matricula,
                nombre: nombre,
                salon_id: salon_id
            });
        }
    );
});

// ACTUALIZAR
app.put('/alumnos/:id', (req, res) => {
    const { matricula, nombre, salon_id } = req.body;
    const id = req.params.id;

    db.query(
        'UPDATE alumnos SET matricula=?, nombre=?, salon_id=? WHERE id=?',
        [matricula, nombre, salon_id, id],
        (err, result) => {
            if (err) return res.status(500).json(err);
            res.json({ mensaje: "Alumno actualizado" });
        }
    );
});

// ELIMINAR
app.delete('/alumnos/:id', (req, res) => {
    db.query('DELETE FROM alumnos WHERE id=?', [req.params.id], (err, result) => {
        if (err) return res.status(500).json(err);
        res.json({ mensaje: "Alumno eliminado" });
    });
});

app.listen(3000, () => {
    console.log("Servidor corriendo en puerto 3000");
});