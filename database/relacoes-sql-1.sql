-- Active: 1696284547876@@127.0.0.1@3306

-- Práticas

CREATE TABLE licenses (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE drivers (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY(license_id) REFERENCES licenses(id)
);

SELECT * FROM licenses;
SELECT * FROM drivers;

INSERT INTO licenses
VALUES ('L001', '11111111', 'B'), 
('L002', '22222222', 'A'), 
('L003', '33333333', 'AB');

INSERT INTO drivers
VALUES ('D001', 'Fulano', 'fulano@email.com', '1234', 'L002'),
    ('D002', 'Ciclano', 'ciclano@email.com', '4567', 'L001'),
    ('D003', 'Beltrano', 'beltrano@email.com', '8975', 'L003');

SELECT * FROM licenses
INNER JOIN drivers
ON drivers.license_id = licenses.id;

SELECT drivers.name, licenses.register_number, licenses.category FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO users
VALUES('001','Fulano','fulano@email.com','1234'), 
('002','Ciclano','Ciclano@email.com','5678');

INSERT INTO phones
VALUES('p001', '912345678', '002'), 
    ('p002', '900002211', '002'), 
    ('p003', '911110041', '001');

SELECT * FROM users;
SELECT * FROM phones;

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id

SELECT phones.phone_number, users.name FROM users
INNER JOIN phones
ON phones.user_id = users.id
WHERE users.name LIKE 'Ci%'

INSERT INTO users VALUES 
    ('003','Beltrano','beltrano@email.com','8422');

CREATE TABLE jogadores (
    id TEXT UNIQUE NOT NULL,
    name TEXT PRIMARY KEY NOT NULL,
    position TEXT NOT NULL
);

CREATE TABLE sosias (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT UNIQUE NOT NULL,
    jogadores_name TEXT NOT NULL,
    FOREIGN KEY(jogadores_name) REFERENCES jogadores(name)
);

INSERT INTO jogadores 
VALUES('001','Gabigol','ata'), 
('002','Bruno Henrique','ata'),
('003','Pedro', 'ata');

INSERT INTO sosias
VALUES('s001', 'Marcelo', 'Gabigol'), 
    ('s002', 'Adriano', 'Bruno Henrique'), 
    ('s003', 'Bruno', 'Pedro');

SELECT jogadores.name, sosias.name FROM jogadores
INNER JOIN sosias
ON jogadores.name = sosias.jogador_name;