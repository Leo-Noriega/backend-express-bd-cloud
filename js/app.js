import express from "express";
import cors from "cors";
import {
  getPaises,
  getPais,
  getEstados,
  getEstado,
  getMunicipios,
  getMunicipio,
} from "./database.js";

const app = express();
app.use(cors());

app.get("/paises", async (req, res) => {
  const paises = await getPaises();
  res.json(paises);
});

app.get("/paises/:id", async (req, res) => {
  const pais = await getPais(req.params.id);
  res.json(pais);
});

app.get("/paises/:id/estados", async (req, res) => {
  const estados = await getEstados(req.params.id);
  res.json(estados);
});

app.get("/estados/:id", async (req, res) => {
  const estado = await getEstado(req.params.id);
  res.json(estado);
});

app.get("/estados/:id/municipios", async (req, res) => {
  const municipios = await getMunicipios(req.params.id);
  res.json(municipios);
});

app.get("/municipios/:id", async (req, res) => {
  const municipio = await getMunicipio(req.params.id);
  res.json(municipio);
});

app.listen(3000, () => {
  console.log("Server running on port 3000");
});
