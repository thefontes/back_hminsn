var express = require('express');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require("cors")
const { Pool } = require('pg');

// Configurações de conexão com o banco de dados
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'indicadoresmaternos',
    password: 'databaseuserman',
    port: 5432,
});

var app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(cors())

app.get('/internacoes', async (req, res)=>{
    const result = await pool.query('select * from internacoes;')
    console.log(result)
    res.json(result.rows)
})
app.listen(3002, ()=>{console.log("http://localhost:3002")})
