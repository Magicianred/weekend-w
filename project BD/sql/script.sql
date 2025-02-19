--
-- Estrutura da tabela `Fabricante`
--
DROP TABLE IF EXISTS `fabricante`;
CREATE TABLE `fabricante` (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,  
  nome VARCHAR(50) NOT NULL   
);

--
-- Estrutura da tabela `eventos`
--

DROP TABLE IF EXISTS `evento`;
CREATE TABLE IF NOT EXISTS `evento` (
  `id` INTEGER AUTO_INCREMENT PRIMARY KEY,  
  `nome` VARCHAR(50) NOT NULL, 
  `idFabricante` INTEGER,  
  `imagem` VARCHAR(50),
  `LocalEvento` VARCHAR(50),
  `dataEvento` DATETIME,
  `descricao` TEXT,
  `qtde` integer,
  `valor` real,

  FOREIGN KEY (idFabricante) REFERENCES fabricante(id) 
);

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login` VARCHAR(50) NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
);




--
-- Estrutura da tabela `ingressos`
--

DROP TABLE IF EXISTS `ingressos`;
CREATE TABLE IF NOT EXISTS `ingressos` (
    `idIngresso` INTEGER AUTO_INCREMENT PRIMARY KEY,
    `qtd` INTEGER, 
    `idCliente` INTEGER,
    `idEvento` INTEGER,
    `dataPedido` DATETIME,
    FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    FOREIGN KEY (idEvento) REFERENCES evento(id)
);

-- INSERT das tabelas ou melhor dizendo, adicionando valores pro BD

INSERT INTO cliente (idCliente, nome, email, login, senha) VALUES ('11','Rafa Arruda', 'rafa@gmail.com', 'rafa', md5("12345")),
                                                        ('12','Dani Takeda', 'takeda@gmail.com', 'dani', md5("67890")),
                                                        ('13','Mateus Koppe', 'matkoppe@gmail.com', 'koppe', md5("11223"));




INSERT INTO `fabricante`(`id`, `nome`) VALUES (101,'Spotify'), 
                                         (102,'Brazilian'), 
                                         (103,'Trap'), 
                                         (104,'KondZilla');


INSERT INTO evento (id,nome, idFabricante, imagem, LocalEvento,dataEvento, descricao, qtde, valor) VALUES (8,'Calourada CC', 101, 'aa.png','UFFS','2019-12-12','Computer error em CC',  60, 10),
                                                                                (6,'Open Bar', NULL, 'bb.png', 'UFSC','2019-12-25','Prepare o copo', 70, 30),
                                                                                (2,'Rafis Chuchu', 102, 'she.jpg','Av. Vitoria','2020-02-25', 'Deu a louca na rave', 100, 5),
                                                                                (4,'False Alfter', 103, NULL,'Voz clube','2020-01-15', 'teste',  25, 25);
                                                                               

INSERT INTO ingressos(idIngresso,qtd,idCliente,idEvento,dataPedido) VALUES(1,2,11,8,'2019-12-03');


