CREATE DATABASE  db_cds1;
USE db_cds1;

CREATE TABLE tb_Artista(
	CodArt INT NOT NULL,
    NomeArt VARCHAR (100) NOT NULL UNIQUE,
    CONSTRAINT pk_CodArt PRIMARY KEY (CodArt)
);  
insert into tb_artista values('1', 'Pedro');
insert into tb_artista values('2', 'Ramon');
insert into tb_artista values('3', 'Wesley');
insert into tb_artista values('4', 'Diogo');
insert into tb_artista values('5', 'Heloisa');

create table tb_Gravadora(
	CodGrav int not null,
    NomeGrav varchar(50) not null unique,
    constraint pk_CodGrav primary key (CodGrav)
);
INSERT INTO tb_gravadora VALUES ('1', 'MK Music');
INSERT INTO tb_gravadora VALUES ('2', 'SONY');
INSERT INTO tb_gravadora VALUES ('3', 'Casarão');
INSERT INTO tb_gravadora VALUES ('4', 'DJ Markinho');
INSERT INTO tb_gravadora VALUES ('5', 'Portugal Records');

CREATE TABLE tb_Categoria(
	CodCat INT NOT NULL,
    NomeCat VARCHAR (50) NOT NULL UNIQUE,
    CONSTRAINT pk_CodCat PRIMARY KEY (CodCat)
);
insert into tb_categoria values('1','Trap');
insert into tb_categoria values('2','MPB');
insert into tb_categoria values('3','Gospel');
insert into tb_categoria values('4','RAP');
insert into tb_categoria values('5','Samba');

CREATE TABLE  tb_Estado(
	SiglaEst CHAR(2) NOT NULL,
    NomeEst VARCHAR (50) NOT NULL UNIQUE,
    CONSTRAINT pk_SiglaEst PRIMARY KEY (SiglaEst)
);
INSERT INTO tb_estado VALUES('SP','São Paulo');
INSERT INTO tb_estado VALUES('RJ','Rio de Janeiro');
INSERT INTO tb_estado VALUES('AL','Alagoas');
INSERT INTO tb_estado VALUES('PE','Pernambuco');
INSERT INTO tb_estado VALUES('SC','Santa Catarina');

CREATE TABLE tb_Cidade(
	CodCid INT NOT NULL,
    SiglaEst CHAR(2) NOT NULL,
    NomeCid VARCHAR(100),
    CONSTRAINT pk_CodCid PRIMARY KEY (CodCid),
	CONSTRAINT fk_Estado_Cidade FOREIGN KEY (SiglaEst) REFERENCES tb_Estado (SiglaEst)
);
INSERT INTO tb_cidade VALUES ('1', 'SP', 'São Paulo');
INSERT INTO tb_cidade VALUES ('2', 'RJ', 'Rio de Janeiro');
INSERT INTO tb_cidade VALUES ('3', 'PE', 'Pernambuco');
INSERT INTO tb_cidade VALUES ('4', 'AL', 'Alagoas');
INSERT INTO tb_cidade VALUES ('5', 'SC', 'Balneário Camboriú');

CREATE TABLE tb_Cliente(
	CodCli INT NOT NULL,
    CodCid INT NOT NULL,
    NomeCli VARCHAR (100) NOT NULL,
    EndCli VARCHAR (200) NOT NULL,
    RendaCli DECIMAL (10,2) NOT NULL default 0,
    SexoCli ENUM ('F', 'M') NOT NULL,
    CONSTRAINT pk_CodCli PRIMARY KEY (CodCli),
    CONSTRAINT fk_Cliente_Cidade FOREIGN KEY (CodCid) REFERENCES tb_Cidade (CodCid)
);
INSERT INTO tb_cliente VALUES ('1', '1', 'Julia Maria', 'Rua Bogotá, 543', '4545.20', 'F');
INSERT INTO tb_cliente VALUES ('2', '1', 'Pedro Souza', 'R. Amarildo, 234', '1545.20', 'M');
INSERT INTO tb_cliente VALUES ('3', '4', 'Heloisa Guerra', 'Rua Colombia, 543', '1756.79', 'F');
INSERT INTO tb_cliente VALUES ('4', '3', 'João Augusto', 'Av. Brasil, 543', '4561.50', 'M');
INSERT INTO tb_cliente VALUES ('5', '5', 'Keven Rodrigues', 'Rua Holanda, 543', '7895.49', 'M');

CREATE TABLE tb_Conjuge(
	CodCli INT NOT NULL,
    NomeConj VARCHAR (100) NOT NULL,
    RendaConj DECIMAL (10,2) NOT NULL,
    SexoConj ENUM ('F', 'M'), 
    CONSTRAINT fk_Conjuge_Cliente FOREIGN KEY (CodCli) REFERENCES tb_Cliente (CodCli)
);
INSERT INTO tb_Conjuge VALUES ('1', 'Maiara Josefina', '554.99', 'F');
INSERT INTO tb_Conjuge VALUES ('2', 'Caio Vitor', '7845.95', 'M');
INSERT INTO tb_Conjuge VALUES ('3', 'Bruna Vitoria', '3614.32', 'F');
INSERT INTO tb_Conjuge VALUES ('4', 'Maria Joaquina', '486.82', 'F');
INSERT INTO tb_Conjuge VALUES ('5', 'Marcio Fagundes', '1659.99', 'M');

CREATE TABLE tb_Funcionario(
	CodFunc INT NOT NULL,
    NomeFunc VARCHAR(100) NOT NULL,
    EndFunc VARCHAR(200) NOT NULL,
    SalFunc DECIMAL (10,2) NOT NULL DEFAULT 0,
    SexoFunc ENUM ('F', 'M') NOT NULL,
    CONSTRAINT pk_CodFunc PRIMARY KEY (CodFunc)
);
INSERT INTO tb_funcionario VALUES ('1', 'Pedro Garcia', 'Rua Skenaro, 968', '19876.65', 'M');
INSERT INTO tb_funcionario VALUES ('2', 'Gustavo Veiga', 'Rua Marcondes II, 7845', '50956.24', 'M');
INSERT INTO tb_funcionario VALUES ('3', 'Rafaela Moura', 'Rua Arigatô, 9563', '3146.69', 'F'); 
INSERT INTO tb_funcionario VALUES ('4', 'Lucas Moura', 'Rua Josefino da Silva', '5989.55', 'M');
INSERT INTO tb_funcionario VALUES ('5', 'Roberto Firmino', 'Rua Augusto Fagundes', '6268.98', 'M');

CREATE TABLE tb_Dependente(
	CodDep INT NOT NULL,
    CodFunc INT NOT NULL,
    NomeDep VARCHAR (100)NOT NULL,
    SexoDep ENUM ('F', 'M') NOT NULL,
    CONSTRAINT pk_CodDep PRIMARY KEY (CodDep), 
    CONSTRAINT fk_Dependente_Funcionario FOREIGN KEY (CodFunc) REFERENCES tb_Funcionario (CodFunc)
);
INSERT INTO tb_dependente VALUES ('1', '1', 'FMiguel Barbosa', 'M');
INSERT INTO tb_dependente VALUES ('2', '2', 'Ricardo Salles', 'M');
INSERT INTO tb_dependente VALUES ('3', '3', 'Maria Silva', 'F');
INSERT INTO tb_dependente VALUES ('4', '4', 'Augusta Souza', 'F');
INSERT INTO tb_dependente VALUES ('5', '4', 'Dory Souza', 'F');

CREATE TABLE tb_Titulo(
    ValCD DECIMAL (10,2) NOT NULL default 0,
    QuantEstq INT NOT NULL default 0,
    CONSTRAINT pk_CodTit PRIMARY KEY (CodTit),
    CONSTRAINT fk_Titulo_Categoria FOREIGN KEY (CodCat) REFERENCES tb_Categoria (CodCat)
);
INSERT INTO tb_titulo VALUES ('1', '1', '1', 'Amado Batista', '15.99','500');
INSERT INTO tb_titulo VALUES ('2', '2', '2', 'Cantos da Torcida do Palmeiras', '26.99','1500');
INSERT INTO tb_titulo VALUES ('3', '3', '3', 'Flamingo', '12.85','39');
INSERT INTO tb_titulo VALUES ('4', '4', '4', 'Mineirinho', '0.75','789');
INSERT INTO tb_titulo VALUES ('5', '5', '5', 'Carros Trilogia', '55.36','648');
ALTER TABLE tb_titulo CHANGE fk_CodGrav CodGrav INT NOT NULL;
ALTER TABLE tb_titulo ADD CONSTRAINT fk_Titulo_Gravadora FOREIGN KEY (CodGrav) REFERENCES tb_Gravadora (CodGrav);
SELECT *FROM tb_titulo;

CREATE TABLE tb_Pedido(
	NumPed INT NOT NULL,
    CodCli INT NOT NULL,
    CodFunc INT NOT NULL, 
    DataPed DATE NOT NULL,
    ValPed DECIMAL (10,2) NOT NULL DEFAULT 0,
    CONSTRAINT pk_NumPed PRIMARY KEY  (NumPed),
    CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (CodCli) REFERENCES tb_Cliente (CodCli),
    CONSTRAINT fk_Pedido_Funcionario FOREIGN KEY (CodFunc) REFERENCES tb_Funcionario (CodFunc)
);
INSERT INTO tb_pedido VALUES ('1', '1','1','2012-05-21', '153.36');
INSERT INTO tb_pedido VALUES ('2', '2','2', '2015-09-20', '973.48');
INSERT INTO tb_pedido VALUES ('3', '3','3', '2020-02-06', '746.23');
INSERT INTO tb_pedido VALUES ('4', '4','4', '2020-04-18', '75.85');
INSERT INTO tb_pedido VALUES ('5', '5','5', '2018-05-03', '14.37');

CREATE TABLE tb_TituloPedido(
	NumPed INT NOT NULL,
    CodTit INT NOT NULL,
    QuantCD INT NOT NULL,
    ValCD DECIMAL (10,2) not null,
    CONSTRAINT fk_TituloPedido_Pedido FOREIGN KEY (NumPed) REFERENCES tb_Pedido (NumPed),
    CONSTRAINT fk_TituloPedido_Titulo FOREIGN KEY (CodTit) REFERENCES tb_Titulo (CodTit)
);
INSERT INTO tb_tituloPedido VALUES ('1', '1', '200', '145.45');
INSERT INTO tb_tituloPedido VALUES ('2', '2', '100', '320.45');
INSERT INTO tb_tituloPedido VALUES ('3', '3', '150', '250.54');
INSERT INTO tb_tituloPedido VALUES ('4', '4', '74', '36.88');
INSERT INTO tb_tituloPedido VALUES ('5', '5', '98', '75.85');

CREATE TABLE tb_TituloArtista(
	CodTit INT NOT NULL,
    CodArt INT NOT NULL,
    CONSTRAINT fk_TituloArtista_Titulo FOREIGN KEY (CodTit) REFERENCES tb_Titulo (CodTit),
    CONSTRAINT fk_TituloArtista_Artista FOREIGN KEY (CodTit) REFERENCES tb_Artista (CodArt)
); 
INSERT INTO tb_tituloArtista VALUES ('1', '1');
INSERT INTO tb_tituloArtista VALUES ('2', '2');
INSERT INTO tb_tituloArtista VALUES ('3', '3');
INSERT INTO tb_tituloArtista VALUES ('4', '4');
INSERT INTO tb_tituloArtista VALUES ('5', '5');

/*1. Exibir o nome da Categoria e o Nome de seus Titulos*/
SELECT tb_categoria.NomeCat , tb_titulo.NomeCD 
FROM tb_categoria 
JOIN tb_titulo 
ON tb_categoria.CodCat = tb_titulo.CodTit;

/*2. EXIBIR O NÚMERO DO PEDIDO E O NOME DO CLIENTE*/
SELECT tb_Pedido.NumPed , tb_Cliente.NomeCli 
FROM tb_Pedido 
JOIN tb_Cliente 
ON tb_Pedido.NumPed = tb_Cliente.CodCli;

/*3. EXIBIR O NOME DO FUNCIONÁRIO E O NOME DE SEU DEPENDENTE COM ALIAS */
SELECT func.NomeFunc , depen.NomeDep 
FROM tb_Funcionario as func
JOIN tb_Dependente as depen
ON func.CodFunc = depen.CodDep;

/*4. EXIBIR O NOME DO FUNCIONÁRIO E O VALOR DE SEUS PEDIDOS COM OS TÍTULOS NOME DO FUNCIONÁRIO E VALOR DOS SEUS PEDIDOS. */
SELECT f.NomeFunc as Nome_Funcionario , p.ValPed as Valor_Dos_Pedidos
FROM tb_Funcionario as f
JOIN tb_Pedido as p
ON f.CodFunc = p.NumPed;

/*5.EXIBIR O NOME DO CLIENTE E O NOME DE SUA CIDADE DO SEXO FEMININO */
SELECT cli.NomeCli AS Nome_Cliente , cid.NomeCid AS Nome_Cidade
FROM tb_Cliente as cli
JOIN tb_Cidade as cid
ON cli.CodCli = cid.CodCid
WHERE cli.SexoCli='F';

/*6. EXIBIR O NOME DO CD E O NOME DE SUA GRAVADORA COMEÇADOS COM R ou T.*/
SELECT t.NomeCD AS Nome_CD, g.NomeGrav AS Nome_Gravadora
FROM tb_Titulo AS t
JOIN tb_Gravadora AS g ON t.CodGrav = g.CodGrav
WHERE t.NomeCD LIKE 'R%' OR t.NomeCD LIKE 'T%';

/*7. EXIBIR O NOME DA GRAVADORA, O NOME DO CD, O VALOR UNITÁRIO E A QTDE EM ESTOQUE ABAIXO DE 500 UNIDADES*/
SELECT g.NomeGrav AS Nome_Gravadora, t.NomeCD AS Nome_CD, t.ValCD AS Valor_CD, t.QuantEstq AS No_Estoque
FROM tb_Gravadora AS g
JOIN tb_Titulo AS t 
ON t.CodGrav = g.CodGrav
WHERE t.QuantEstq <500;

/*8. Exibir o nome do cliente feminino e o valor de seus pedidos no ano de 2002, no mês de junho. */
SELECT c.NomeCli AS Nome_Cliente , p.ValPed AS Valor_Pedido, p.DataPed AS Data_Pedido
FROM tb_Cliente as c
JOIN tb_Pedido as p
ON c.CodCli = p.CodCli
WHERE c.SexoCli='F' AND YEAR(p.DataPed) = 2002 AND MONTH(p.DataPed)=06;

/*9. EXIBIR O NÚMERO DO PEDIDO, O VALOR DO PEDIDO, DATA DO PEDIDO E O  NOME DO FUNCIONARIO COM PEDIDOS NO ANO DE 2003 
E QUE TENHAM SEUS NOMES COMEÇADOS POR PAULA.*/
SELECT p.NumPed AS Num_Pedido, p.ValPed AS Valor_Pedido, p.DataPed AS Data_Pedido, f.NomeFunc AS Nome_Funcionario
FROM tb_Pedido AS p
JOIN tb_Funcionario AS f
ON p.CodFunc = f.CodFunc
WHERE YEAR(p.DataPed) = 2003 AND f.NomeFunc LIKE 'Paula%';

/*10. EXIBIR O NÚMERO DO PEDIDO E O NOME DO CLIENTE QUE FEZ O MAIOR PEDIDO */
SELECT p.NumPed AS Num_Pedido, c.NomeCli AS Nome_Cliente
FROM tb_Pedido AS p
JOIN tb_Cliente AS c
ON p.CodCli = c.CodCli
WHERE p.ValPed=(
 SELECT MAX(ValPed) 
 FROM tb_Pedido) 
 LIMIT 1;

/*11.EXIBIR OS NOME DO ARTISTA E O NOME DE SUA CATEGORIA (DISTINCT)*/ 
SELECT DISTINCT a.NomeArt AS Artista, c.NomeCat AS Categoria
FROM tb_artista AS A
JOIN tb_categoria AS c ON a.CodArt = c.CodCat;

/*12. Exibir o nome do cliente e o nome do funcionário*/
SELECT c.CodCli AS Codigo_Cliente, c.NomeCli AS Nome_Cliente, f.CodFunc AS Codigo_Funcionario, f.NomeFunc AS Nome_Funcionario
FROM tb_Cliente AS c
JOIN tb_Funcionario AS f
ON c.CodCli = f.CodFunc;

/*13.Exibir o nome do cliente e o nome do cd que comprou*/
SELECT c.NomeCli AS Nome_Cliente, t.NomeCD AS Nome_CD
FROM tb_Cliente AS c
JOIN tb_titulo AS t
ON c.CodCli = t.CodTit;

/*14. EXIBIR O NOME DO CD, NOME DA GRAVADORA E O NOME DA CATEGORIA */
SELECT t.nomeCD AS Nome_CD, g.NomeGrav AS Gravadora, c.NomeCat AS Categoria
FROM tb_titulo AS t
JOIN tb_gravadora AS g ON t.CodTit = g.CodGrav
JOIN tb_categoria AS c ON g.CodGrav = c.CodCat;

/*15. EXIBIR O NOME DO FUNCIONARIO, NOME DE SEUS DEPENDENTES, NOME DO CLIENTE E NOME DE SEUS CONJUGES*/
SELECT f.NomeFunc AS Funcionario, d.NomeDep AS Dependente, c.NomeCli AS Cliente, conj.NomeConj AS Conjuge
FROM tb_Funcionario AS f
JOIN tb_Dependente AS d ON f.CodFunc = d.CodDep
JOIN tb_Cliente AS c ON d.CodDep=c.CodCli
JOIN tb_Conjuge AS conj ON c.CodCli=conj.CodCli;

/*16. EXIBIR O NOME DO CLIENTE, NOME DO FUNCIONÁRIO, NOME DO CD, NOME DA CATEGORIA E O NOME DA GRAVADORA*/
SELECT c.NomeCli AS Cliente, f.NomeFunc AS Funcionario, t.nomeCD AS Nome_CD, cat.NomeCat AS Categoria, g.NomeGrav AS Gravadora
FROM tb_Cliente AS c
JOIN tb_Funcionario AS f ON c.CodCli=f.CodFunc
JOIN tb_titulo AS t ON f.CodFunc= t.CodTit
JOIN tb_categoria AS cat ON t.CodTit=cat.CodCat
JOIN tb_gravadora AS g ON cat.CodCat = g.CodGrav;