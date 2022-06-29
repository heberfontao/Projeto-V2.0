BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "usuario" (
	"id"	INTEGER NOT NULL,
	"username"	VARCHAR NOT NULL,
	"email"	VARCHAR NOT NULL,
	"senha"	VARCHAR NOT NULL,
	"foto_perfil"	VARCHAR,
	"cursos"	VARCHAR NOT NULL,
	PRIMARY KEY("id"),
	UNIQUE("email")
);
CREATE TABLE IF NOT EXISTS "post" (
	"id"	INTEGER NOT NULL,
	"titulo"	VARCHAR NOT NULL,
	"corpo"	TEXT NOT NULL,
	"data_criacao"	DATETIME NOT NULL,
	"id_usuario"	INTEGER NOT NULL,
	PRIMARY KEY("id"),
	FOREIGN KEY("id_usuario") REFERENCES "usuario"("id")
);
CREATE TABLE IF NOT EXISTS "taxas" (
	"id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"aliquota"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "apuracao" (
	"id"	INTEGER NOT NULL UNIQUE,
	"id_usuario"	INTEGER NOT NULL,
	"data"	TEXT NOT NULL,
	"data_compra"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "acoes" (
	"id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"ticker"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "estoque" (
	"id"	INTEGER NOT NULL,
	"id_acao"	INTEGER NOT NULL,
	"id_usuario"	INTEGER NOT NULL,
	"saldo_inicial"	INTEGER,
	"entradas"	INTEGER,
	"saidas"	INTEGER,
	"saldo_final"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "vendas" (
	"id"	INTEGER,
	"id_acao"	INTEGER NOT NULL,
	"id_usuario"	INTEGER NOT NULL,
	"data"	TEXT NOT NULL,
	"quantidade"	INTEGER NOT NULL,
	"valor_unitario"	REAL NOT NULL,
	"total_taxas"	REAL NOT NULL,
	"total_venda"	REAL NOT NULL,
	"resultado"	REAL NOT NULL DEFAULT 0,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id_acao") REFERENCES "acoes"("id"),
	FOREIGN KEY("id_usuario") REFERENCES "usuario"("id")
);
CREATE TABLE IF NOT EXISTS "compras" (
	"id"	INTEGER,
	"id_acao"	INTEGER NOT NULL,
	"id_usuario"	INTEGER NOT NULL,
	"data"	TEXT NOT NULL,
	"quantidade"	INTEGER NOT NULL,
	"valor_unitario"	REAL NOT NULL,
	"total_taxas"	REAL NOT NULL,
	"custo"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id_usuario") REFERENCES "usuario"("id"),
	FOREIGN KEY("id_acao") REFERENCES "acoes"("id")
);
INSERT INTO "usuario" VALUES (1,'heberbbf','heberbbf@gmail.com','$2b$12$pPfffnWn.QrEie2BZ6CrAu9qkGND2aTslCYaQw9lN/uuGlB8J5Iry','images3e7b50599efa847e.png','');
INSERT INTO "usuario" VALUES (2,'Heber Teste','heber@teste.com','$2b$12$sMFob63w1LXpHkHrGWfK0Ob/QZWswvcZBcdlZUu7nKpMef6y3TXHy','default.jpg','Excel;Power BI;Python');
INSERT INTO "usuario" VALUES (3,'Murilo','mmissura@gmail.com','$2b$12$afKes5PZBrRae0TDMkTA..JLjN5COe/axWFc6vMwlRUdUov0XLC7W','default.jpg','');
INSERT INTO "usuario" VALUES (4,'marcelo','marcelotmagalhaes@gmail.com','$2b$12$BNcvA0ZKh.PFsrptun7rSO9idIJR6M3RcV9kcaQZcwOQpOvvUW5Ie','default.jpg','Não Informado');
INSERT INTO "usuario" VALUES (5,'Luciano','dsibr@hotmail.com','$2b$12$nxyf4kseLWiv1uALlK7Qce6ngvmATPRnwaXzdFYW65//.NPQRfdOC','antiga_e0493252fb889e30.jpg','Não Informado');
INSERT INTO "post" VALUES (1,'post teste','fkdjfklakladnbk','2021-11-10 22:52:59.285666',3);
INSERT INTO "post" VALUES (2,'Teste BD','Teste','2021-11-17 13:45:43.210605',2);
INSERT INTO "post" VALUES (3,'Testando o sistema','Post realizado para testes','2021-11-17 19:54:35.603027',1);
INSERT INTO "post" VALUES (4,'Teste Usuário','Teste ','2021-11-17 19:57:08.418768',1);
INSERT INTO "post" VALUES (5,'Receita','Ingredientes
Massa do Bolo de Cenoura
3 cenouras médias (250g)
4 ovos
meia xícara (chá) de óleo
2 e meia xícaras (chá) de farinha de trigo
2 xícaras (chá) de açúcar
1 colher (sopa) de fermento em pó
Cobertura de Brigadeiro
1 Leite MOÇA® (lata ou caixinha) 395g
1 colher (sopa) de manteiga
meia xícara (chá) de Chocolate em Pó NESTLÉ® DOIS FRADES®
meia xícara (chá) de chocolate granulado
Modo de preparo
Massa do Bolo de Cenoura
Em um liquidificador, bata as cenouras, os ovos e o óleo.

Despeje a mistura em um recipiente e misture o açúcar e a farinha de trigo peneirada com o fermento.

Coloque em uma fôrma retangular (20 x 30 cm) untada, e leve ao forno médio (180°C), preaquecido, por 40 minutos.

Enquanto isso, prepare a cobertura de brigadeiro.

Cobertura de Brigadeiro
Em uma panela coloque o Leite MOÇA, o Chocolate em Pó DOIS FRADES e a manteiga e leve ao fogo baixo, mexendo sempre, até começar a desprender da panela.

Despeje ainda quente sobre o bolo, distribua o chocolate granulado e deixe esfriar.','2021-11-17 19:59:08.536638',1);
INSERT INTO "acoes" VALUES (1,' Petroleo Brasileiro SA - Petrobras','PETR3');
INSERT INTO "acoes" VALUES (2,'Magazine Luiza','MGLU3');
INSERT INTO "acoes" VALUES (3,'VALE S.A.','VALE3');
INSERT INTO "acoes" VALUES (4,'Itaú Unibanco S.A.','ITUB4');
INSERT INTO "acoes" VALUES (5,'Bradesco S.A.','BBDC4');
INSERT INTO "acoes" VALUES (6,'Banco do Brasil S.A.','BBAS3');
INSERT INTO "acoes" VALUES (7,'Via Varejo','VIIA3');
INSERT INTO "acoes" VALUES (8,'Embraer S.A.','EMBR3');
INSERT INTO "vendas" VALUES (15,4,2,'2021-01-10',100,25.0,5.0,2495.0,0.0);
INSERT INTO "vendas" VALUES (16,7,2,'2021-01-15',40,28.0,2.0,1118.0,0.0);
INSERT INTO "vendas" VALUES (17,8,2,'2021-02-22',100,25.5,5.0,2545.0,0.0);
INSERT INTO "vendas" VALUES (18,6,2,'2021-02-25',100,29.0,5.0,2895.0,0.0);
INSERT INTO "vendas" VALUES (19,3,2,'2021-03-15',1000,29.5,20.0,29480.0,0.0);
INSERT INTO "vendas" VALUES (20,2,2,'2021-03-12',600,28.5,12.0,17088.0,0.0);
INSERT INTO "vendas" VALUES (21,1,2,'2021-04-10',300,30.58,10.0,9164.0,0.0);
INSERT INTO "vendas" VALUES (22,7,2,'2021-04-11',150,24.8,10.0,3710.0,0.0);
INSERT INTO "vendas" VALUES (23,6,2,'2021-04-05',350,45.0,10.0,15740.0,0.0);
INSERT INTO "vendas" VALUES (24,4,1,'2021-11-10',10,8.0,90.0,-10.0,0.0);
INSERT INTO "compras" VALUES (20,4,2,'2021-01-01',100,20.0,5.0,2005.0);
INSERT INTO "compras" VALUES (21,7,2,'2021-01-05',80,30.0,2.0,2402.0);
INSERT INTO "compras" VALUES (22,8,2,'2021-02-01',100,25.0,5.0,2505.0);
INSERT INTO "compras" VALUES (23,6,2,'2021-02-20',200,30.0,10.0,6010.0);
INSERT INTO "compras" VALUES (24,3,2,'2021-03-01',1000,28.0,25.0,28025.0);
INSERT INTO "compras" VALUES (25,2,2,'2021-03-02',800,30.0,15.0,24015.0);
INSERT INTO "compras" VALUES (26,1,2,'2021-04-01',300,30.0,10.0,9010.0);
INSERT INTO "compras" VALUES (27,7,2,'2021-04-02',300,22.0,15.0,6615.0);
INSERT INTO "compras" VALUES (28,6,2,'2021-04-01',400,40.0,40.0,16040.0);
INSERT INTO "compras" VALUES (29,4,2,'2021-05-01',100,100.0,10.0,10010.0);
INSERT INTO "compras" VALUES (30,1,1,'2021-01-01',5,80.0,10.0,410.0);
INSERT INTO "compras" VALUES (31,1,5,'2022-05-10',100,100.0,2.0,10002.0);
COMMIT;
