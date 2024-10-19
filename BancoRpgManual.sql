CREATE DATABASE RPG;

CREATE TABLE conta (
  id_conta    INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nick        VARCHAR(50) NOT NULL UNIQUE,
  servidor    INT NOT NULL,
  tempodejogo INT NOT NULL
);

INSERT INTO conta (nick, servidor, tempodejogo) 
VALUES  ('jogador1', 55, 120),
        ('jogador2', 55, 70),
        ('jogador3', 1, 235);

CREATE TABLE raridade (
  id_raridade INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome        VARCHAR(10) NOT NULL
);

INSERT INTO raridade (nome) 
VALUES ('comum'), ('raro'), ('lendário'), ('mítico');

CREATE TABLE arma (
  id_arma         INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome            VARCHAR(30) NOT NULL UNIQUE,
  id_raridade     INT ,
  dano            FLOAT NOT NULL,
  durabilidade    FLOAT NOT NULL,
  nivelnecessario INT NOT NULL,
  FOREIGN KEY (id_raridade) REFERENCES raridade(id_raridade)
);

CREATE TABLE tipo (
  id_tipo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome    VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO tipo (nome) 
VALUES ('elmo'), ('armadura'), ('calças'), ('botas'), ('arcano'), ('piromancia'), ('milagres');

CREATE TABLE atributo (
  id_personagem INT,
  forca         INT NOT NULL,
  destreza      INT NOT NULL,
  vida          INT NOT NULL,
  mana          INT NOT NULL,
  inteligencia  INT NOT NULL,
  fe            INT NOT NULL,
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem)
);

CREATE TABLE equipamento (
  id_equipamento  INT   PRIMARY KEY AUTO_INCREMENT NOT NULL,
  durabilidade    FLOAT NOT NULL,
  defesafisica    FLOAT NOT NULL,
  defesamagica    FLOAT NOT NULL,
  id_raridade     INT,
  id_tipo         INT,
  nivelnecessario INT,
  FOREIGN KEY (id_raridade) REFERENCES raridade(id_raridade),
  FOREIGN KEY (id_tipo)     REFERENCES tipo(id_tipo)
);

CREATE TABLE personagem (
   id_personagem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   id_conta      INT,
   nome          VARCHAR(30) NOT NULL,
   elmo          INT,
   peitoral      INT,
   luvas         INT,
   calcas        INT,
   nivel         INT NOT NULL,
   FOREIGN KEY (id_conta) REFERENCES conta(id_conta),
   FOREIGN KEY (elmo)     REFERENCES equipamento(id_equipamento),
   FOREIGN KEY (peitoral) REFERENCES equipamento(id_equipamento),
   FOREIGN KEY (luvas)    REFERENCES equipamento(id_equipamento),
   FOREIGN KEY (calcas)   REFERENCES equipamento(id_equipamento)
);

CREATE TABLE mao (
  id_personagem   INT,
  mao VARCHAR(10) NOT NULL,
  id_arma1 INT,
  id_arma2 INT,
  id_arma3 INT,
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_arma1)      REFERENCES arma(id_arma),
  FOREIGN KEY (id_arma2)      REFERENCES arma(id_arma),
  FOREIGN KEY (id_arma3)      REFERENCES arma(id_arma)
);

CREATE TABLE magia (
  id_magia        INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_personagem   INT,
  nome            VARCHAR(20) NOT NULL UNIQUE,
  id_tipo         INT,
  customania      FLOAT NOT NULL,
  dano            INT   NOT NULL,
  cura            FLOAT NOT NULL,
  nivelnecessario INT   NOT NULL,
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_tipo)       REFERENCES tipo(id_tipo)
);

CREATE TABLE consumiveis (
  id_consumiveis INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome           VARCHAR(30) NOT NULL UNIQUE,
  id_personagem  INT,
  valordecura    DECIMAL(7,2) NOT NULL,
  valordemana    DECIMAL(7,2) NOT NULL,
  nivel          INT NOT NULL,
  quantidade     INT NOT NULL,
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem)
);

CREATE TABLE itens (
  id_itens INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome     VARCHAR(30) NOT NULL
);

CREATE TABLE slotbolsa (
  id_personagem  INT,
  id_arma        INT,
  id_equipamento INT,
  id_consumivel  INT,
  id_item        INT,
  FOREIGN KEY (id_personagem) REFERENCES personagem(id_personagem),
  FOREIGN KEY (id_arma)       REFERENCES arma(id_arma),
  FOREIGN KEY (id_equipamento) REFERENCES equipamento(id_equipamento),
  FOREIGN KEY (id_consumivel)  REFERENCES consumiveis(id_consumiveis),
  FOREIGN KEY (id_item)        REFERENCES itens(id_itens)
);
