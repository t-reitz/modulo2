const express = require('express');
const bodyParser = require('body-parser');
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const sqlite3 = require('sqlite3').verbose();
const path = require('path');

// Caminho para arquivo db
const DBPATH = './db_CV.db';

const app = express();

app.use(express.json());
app.use(express.static(path.join(__dirname, '..', 'FrontEnd')));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '..', 'FrontEnd', 'index.html'));
});

// [READ] Mostrar registros da tabela
app.get('/showPessoa', (req, res) => {
    res.statusCode = 200;
    res.setHeader('Access-Control-Allow-Origin', '*');
    var db = new sqlite3.Database(DBPATH); // Open db
    var sql = 'SELECT * FROM pessoa'; // SQL Querry para selecionar todos da tabela pessoa
    db.all(sql, [], (err, rows) => {
      if (err) {
        throw err;
      }
      res.json(rows);
    });
    db.close(); // Fechar db
});

// [CREATE] Criar registro de pessoa
app.post('/inserePessoa', urlencodedParser, (req, res) => {
	res.statusCode = 200;
	res.setHeader('Access-Control-Allow-Origin', '*'); 
	var db = new sqlite3.Database(DBPATH); // Open db
	sql = "INSERT INTO pessoa (Nome, Idade, Email, Telefone, Endereco, Descricao) VALUES ('" + req.body.Nome + "', '" + req.body.Idade + "', '" + req.body.Email + "', '" + req.body.Telefone + "', '" + req.body.Endereco + "', '" + req.body.Descricao + "')";
	console.log(sql);
	db.run(sql, [],  err => {
		if (err) {
		    throw err;
		}	
	});
	res.write('<p>USUARIO INSERIDO COM SUCESSO!</p><a href="/">VOLTAR</a>');
	db.close(); // Fechar db
	res.end();
});

// [UPDATE] Editar pessoa
app.post('/updatePessoa', urlencodedParser, (req, res) => {
  res.statusCode = 200;
  res.setHeader('Access-Control-Allow-Origin', '*');
  var db = new sqlite3.Database(DBPATH); // Open db

  // SQL query para atualizar uma certa pessoa do banco de dados
  var sql = "UPDATE pessoa SET Nome = '" + req.body.Nome + "', Idade = '" + req.body.Idade + "', Email = '" + req.body.Email + "', Telefone = '" + req.body.Telefone + "', Endereco = '" + req.body.Endereco + "', Descricao = '" + req.body.Descricao + "' WHERE ID_Pessoa = " + req.body.ID_Pessoa;

  console.log(sql);
  db.run(sql, [], err => {
      if (err) {
          throw err;
      }
  });
    res.send("Success"); 
    db.close(); // Fechar o db
    res.end();
});

// [DELETE] Deletar pessoa
app.post('/deletePessoa', urlencodedParser, (req, res) => {
  res.statusCode = 200;
  res.setHeader('Access-Control-Allow-Origin', '*');
  var db = new sqlite3.Database(DBPATH); // Open db

  // SQL query para deletar uma certa pessoa do banco de dados
  var sql = "DELETE FROM pessoa WHERE ID_Pessoa = " + req.body.ID_Pessoa;

  console.log(sql);
  db.run(sql, [], err => {
      if (err) {
          throw err;
      }
  });
  
  res.send("Success");
  db.close(); // Fechar o db
  res.end();
});


  // Liseten no port 3000
app.listen(3000, () => {
  console.log('Servidor rodando em http://localhost:3000/');
});