import mysql from "mysql2";

import dotenv from "dotenv";

dotenv.config();

const pool = mysql
  .createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
  })
  .promise();

async function getPaises() {
  const [rows] = await pool.query("SELECT * FROM paises");
  return rows;
}

async function getPais(id) {
  const [rows] = await pool.query(`SELECT * FROM paises WHERE id = ?`, [id]);
  return rows[0];
}

async function getEstados(id) {
  const [rows] = await pool.query(`SELECT * FROM estados WHERE pais_id = ?`, [
    id,
  ]);
  return rows;
}

async function getEstado(id) {
  const [rows] = await pool.query(`SELECT * FROM estados WHERE id = ?`, [id]);
  return rows[0];
}

async function getMunicipios(id) {
  const [rows] = await pool.query(
    `SELECT * FROM municipios WHERE estado_id = ?`,
    [id]
  );
  return rows;
}

async function getMunicipio(id) {
  const [rows] = await pool.query(`SELECT * FROM municipios WHERE id = ?`, [
    id,
  ]);
  return rows[0];
}

export {
  getPaises,
  getPais,
  getEstados,
  getEstado,
  getMunicipios,
  getMunicipio,
};
