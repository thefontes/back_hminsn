--Banco de dados em postgres

create table pacientes
(
    id       serial
        primary key,
    nome     varchar(100) not null,
    idade    integer      not null,
    endereco varchar(200),
    telefone varchar(20)
);

alter table pacientes
    owner to postgres;

create table partos
(
    id              serial
        primary key,
    data_parto      date        not null,
    tipo_parto      varchar(50) not null,
    indicacao_parto varchar(100),
    id_paciente     integer     not null
        references pacientes
);

alter table partos
    owner to postgres;

create table complicacoes
(
    id        serial
        primary key,
    descricao varchar(100) not null,
    id_parto  integer      not null
        references partos
);

alter table complicacoes
    owner to postgres;

create table amamentacao
(
    id                  serial
        primary key,
    id_parto            integer not null
        references partos,
    inicio_amamentacao  date    not null,
    duracao_amamentacao integer
);

alter table amamentacao
    owner to postgres;

create table readmissao
(
    id              serial
        primary key,
    id_paciente     integer not null
        references pacientes,
    data_readmissao date    not null,
    motivo          varchar(200)
);

alter table readmissao
    owner to postgres;

create table users
(
    username varchar,
    password varchar
);

alter table users
    owner to postgres;