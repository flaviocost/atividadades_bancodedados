CREATE TABLE Aluno (
    id_aluno        INTEGER NOT NULL,
    nome            VARCHAR(150) NOT NULL,
    cpf             VARCHAR(11)  NOT NULL,
    email           VARCHAR(255),
    data_nascimento DATE,
    telefone        VARCHAR(11),
    PRIMARY KEY (id_aluno)
);
 
CREATE TABLE Curso (
    id_curso          INTEGER NOT NULL,
    nome              VARCHAR(155) NOT NULL,
    carga_horaria     INTEGER NOT NULL,
    valor_mensalidade REAL NOT NULL,
    PRIMARY KEY (id_curso)
);
 
CREATE TABLE Professor (
    id_professor  INTEGER NOT NULL,
    nome          VARCHAR(155) NOT NULL,
    cpf           VARCHAR(11)  NOT NULL,
    email         VARCHAR(255),
    especialidade VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_professor)
);
 

CREATE TABLE Matricula (
    id_matricula   INTEGER NOT NULL,
    id_aluno       INTEGER NOT NULL,
    id_curso       INTEGER NOT NULL,
    data_matricula DATE    NOT NULL,
    status         VARCHAR(15) NOT NULL DEFAULT 'ATIVA'
        CHECK (status IN ('ATIVA', 'CANCELADA', 'CONCLUIDA')),
    PRIMARY KEY (id_matricula),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);
 
CREATE TABLE Ministra (
    id_professor INTEGER NOT NULL,
    id_curso     INTEGER NOT NULL,
    PRIMARY KEY (id_professor, id_curso),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (id_curso)     REFERENCES Curso(id_curso)
);
 

INSERT INTO Aluno (id_aluno, nome, cpf, email, data_nascimento)
VALUES (1, 'Flavio', '09874585612', 'flavio@gmail.com', '2004-08-08'),
       (2, 'Felipe', '14569875630', 'felipe@gmail.com', '2004-09-08'),
       (3, 'Lucas',  '52478963502', 'fLucas@gmail.com', '2003-10-08');
 

INSERT INTO Curso (id_curso, nome, carga_horaria, valor_mensalidade)
VALUES (1, 'Banco de dados',         40, 425.60),
       (2, 'FRONTEND',               80, 150.00),
       (3, 'POO',                   250, 231.50),
       (4, 'Logica de programacao',  50, 150.21);
 

INSERT INTO Professor (id_professor, nome, cpf, email, especialidade)
VALUES (1, 'Josivan Eleno', '01236478956', 'Josivaneleno@gmail.com', 'Python'),
       (2, 'Igor Cardoso',  '52436978410', NULL, 'Banco de dados'),
       (3, 'Claudy',        '01498751520', NULL, 'Desenvolvimento Web');
 

INSERT INTO Ministra (id_professor, id_curso)
VALUES (2, 1),
       (3, 2),
       (3, 3),
       (1, 4);
 

INSERT INTO Matricula (id_matricula, id_aluno, id_curso, data_matricula, status)
VALUES (1,  1, 1, '2026-02-10', 'ATIVA'),
       (2,  1, 2, '2026-02-10', 'ATIVA'),
       (3,  1, 3, '2025-08-15', 'CONCLUIDA'),
       (4,  1, 4, '2026-02-12', 'ATIVA'),
       (5,  2, 1, '2026-02-11', 'ATIVA'),
       (6,  2, 3, '2026-03-01', 'CANCELADA'),
       (7,  3, 2, '2026-02-20', 'ATIVA'),
       (8,  3, 3, '2026-03-05', 'CANCELADA'),
       (9,  3, 4, '2026-02-25', 'ATIVA'),
       (50, 1, 1, '2026-02-15', 'CONCLUIDA'),
       (51, 2, 1, '2026-02-15', 'CANCELADA'),
       (52, 3, 1, '2024-02-15', 'CONCLUIDA');

