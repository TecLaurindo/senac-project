import express from "express";
import mysql from "mysql2/promise";
import bodyParser from "body-parser";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = 3000;

app.use(express.static(path.join(__dirname, 'public')));
// Configuração para receber JSON
app.use(bodyParser.json());

// Conexão com o banco
const pool = mysql.createPool({
  host: "localhost",     // endereço do banco
  user: "root",          // usuário
  password: "senac142500", // senha
  database: "senacaprendizagem", // nome do banco
});
 
// Rota de cadastro
app.post("/api/register", async (req, res) => {
  try {
    const { name, cpf, email, phone, password } = req.body;

    if (!name || !cpf || !email || !phone || !password) {
      return res.status(400).json({ message: "Campos obrigatórios faltando." });
    }

    const sql = `
      INSERT INTO usuario (nome, CPF, email, TELEFONE, senha)
      VALUES (?, ?, ?, ?, ?)
    `;

    const [result] = await pool.execute(sql, [
      name,
      cpf,
      email,
      phone,
      password, // ⚠️ Em produção use hash com bcrypt!
    ]);

    res.status(201).json({ message: "Cadastro realizado com sucesso!", id: result.insertId });
  } catch (err) {
    console.error("Erro ao cadastrar:", err);
    res.status(500).json({ message: "Erro no servidor." });
  }
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${3000}`);
});
