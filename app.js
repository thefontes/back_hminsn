var express = require('express');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require("cors")
const { Pool } = require('pg');

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
let isAuth = false;
function authMiddleware(req, res, next){
    if (isAuth){
        next()
    }
    else {
        res.status(401).json({
            error:'Usuario nao autorizado'
        })
    }
}
app.get('/login', (req, res)=>{
    const {user, password } = req.query
    if (user == 'David' && password == 'senhafraca'){
        isAuth = true;
        res.json({
            message:'usuario autenticado'
        })
    }
    res.json({
        message:'usuario senha invalida'
    })
})
//app.use(authMiddleware)
app.get('/internacoes', async (req, res)=>{
    const result = await pool.query('select * from internacoes;')
    console.log(result)
    res.json(result.rows)
});
app.get('/tipodeparto', async (req, res)=>{
    const result = await pool.query('select * from tipodeparto;')
    console.log(result)
    res.json(result.rows)
})

app.get('/readmissoes', async (req, res)=>{
    const result = await pool.query('select count(*) numero, motivo from readmissao group by motivo;')
    console.log(result)
    res.json(result.rows)
})
app.get('/complicacoes', async (req, res)=>{
    const result = await pool.query('select count(*) numero, descricao from complicacoes\n' +
        '    left join partos p on p.id = complicacoes.id_parto group by descricao;')
    console.log(result)
    res.json(result.rows)
})
app.listen(3002, ()=>{console.log("http://localhost:3002")})
