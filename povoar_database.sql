--Script com dados ficticios para popular o banco

INSERT INTO pacientes (nome, idade, endereco, telefone)
VALUES
    ('Ana Silva', 32, 'Rua das Flores, 123', '(11) 1234-5678'),
    ('Beatriz Santos', 25, 'Av. São Paulo, 456', '(21) 9876-5432'),
    ('Carla Mendes', 40, 'Praça da Liberdade, 789', '(31) 2468-1357'),
    ('Débora Oliveira', 28, 'Rua das Palmeiras, 987', '(41) 3698-7531'),
    ('Elisa Pereira', 37, 'Travessa das Rosas, 1010', '(51) 5647-8910'),
    ('Fernanda Almeida', 22, 'Avenida das Acácias, 2222', '(61) 3210-9876');

INSERT INTO partos (data_parto, tipo_parto, indicacao_parto, id_paciente)
VALUES
    ('2023-01-15', 'Normal', NULL, 1),
    ('2023-02-10', 'Cesárea', 'Indicado por problemas de saúde', 2),
    ('2023-03-20', 'Cesárea', 'Gêmeos', 3),
    ('2023-04-05', 'Normal', NULL, 4),
    ('2023-05-12', 'Cesárea', 'Gestação de risco', 5),
    ('2023-06-08', 'Normal', NULL, 6);

INSERT INTO complicacoes (descricao, id_parto)
VALUES
    ('Hemorragia pós-parto', 2),
    ('Infecção no local da incisão', 3),
    ('Nenhuma complicação', 1),
    ('Hipertensão', 4),
    ('Descolamento de placenta', 5),
    ('Nenhuma complicação', 6);

INSERT INTO amamentacao (id_parto, inicio_amamentacao, duracao_amamentacao)
VALUES
    (1, '2023-01-16', 6),
    (2, '2023-02-11', 4),
    (3, '2023-03-21', 8),
    (4, '2023-04-06', NULL),
    (5, '2023-05-13', 12),
    (6, '2023-06-09', 3);


INSERT INTO readmissao (id_paciente, data_readmissao, motivo)
VALUES
    (1, '2023-02-25', 'Febre persistente'),
    (2, '2023-03-05', 'Dor abdominal'),
    (3, '2023-03-22', 'Problemas com a cicatrização'),
    (4, '2023-04-12', 'Acompanhamento pós-parto'),
    (5, '2023-05-18', 'Complicações com a amamentação'),
    (6, '2023-06-15', 'Infecção pós-operatória');


