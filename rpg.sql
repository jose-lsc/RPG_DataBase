-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/10/2024 às 22:37
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rpg`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `arma`
--

CREATE TABLE `arma` (
  `id_arma` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `id_raridade` int(11) DEFAULT NULL,
  `dano` float NOT NULL,
  `durabilidade` float NOT NULL,
  `nivelnecessario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `atributo`
--

CREATE TABLE `atributo` (
  `id_personagem` int(11) DEFAULT NULL,
  `forca` int(11) NOT NULL,
  `destreza` int(11) NOT NULL,
  `vida` int(11) NOT NULL,
  `mana` int(11) NOT NULL,
  `inteligencia` int(11) NOT NULL,
  `fe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consumiveis`
--

CREATE TABLE `consumiveis` (
  `id_consumiveis` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `id_personagem` int(11) DEFAULT NULL,
  `valordecura` decimal(7,2) NOT NULL,
  `valordemana` decimal(7,2) NOT NULL,
  `nivel` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta`
--

CREATE TABLE `conta` (
  `id_conta` int(11) NOT NULL,
  `nick` varchar(50) NOT NULL,
  `servidor` int(11) NOT NULL,
  `tempodejogo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta`
--

INSERT INTO `conta` (`id_conta`, `nick`, `servidor`, `tempodejogo`) VALUES
(1, 'jogador1', 55, 120),
(2, 'jogador2', 55, 70),
(3, 'jogador3', 1, 235);

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamento`
--

CREATE TABLE `equipamento` (
  `id_equipamento` int(11) NOT NULL,
  `durabilidade` float NOT NULL,
  `defesafisica` float NOT NULL,
  `defesamagica` float NOT NULL,
  `id_raridade` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `nivelnecessario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens`
--

CREATE TABLE `itens` (
  `id_itens` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `magia`
--

CREATE TABLE `magia` (
  `id_magia` int(11) NOT NULL,
  `id_personagem` int(11) DEFAULT NULL,
  `nome` varchar(20) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `customania` float NOT NULL,
  `dano` int(11) NOT NULL,
  `cura` float NOT NULL,
  `nivelnecessario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mao`
--

CREATE TABLE `mao` (
  `id_personagem` int(11) DEFAULT NULL,
  `mao` varchar(10) NOT NULL,
  `id_arma1` int(11) DEFAULT NULL,
  `id_arma2` int(11) DEFAULT NULL,
  `id_arma3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personagem`
--

CREATE TABLE `personagem` (
  `id_personagem` int(11) NOT NULL,
  `id_conta` int(11) DEFAULT NULL,
  `nome` varchar(30) NOT NULL,
  `elmo` int(11) DEFAULT NULL,
  `peitoral` int(11) DEFAULT NULL,
  `luvas` int(11) DEFAULT NULL,
  `calcas` int(11) DEFAULT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `raridade`
--

CREATE TABLE `raridade` (
  `id_raridade` int(11) NOT NULL,
  `nome` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `raridade`
--

INSERT INTO `raridade` (`id_raridade`, `nome`) VALUES
(1, 'comum'),
(2, 'raro'),
(3, 'lendário'),
(4, 'mítico');

-- --------------------------------------------------------

--
-- Estrutura para tabela `slotbolsa`
--

CREATE TABLE `slotbolsa` (
  `id_personagem` int(11) DEFAULT NULL,
  `id_arma` int(11) DEFAULT NULL,
  `id_equipamento` int(11) DEFAULT NULL,
  `id_consumivel` int(11) DEFAULT NULL,
  `id_item` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo`
--

CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo`
--

INSERT INTO `tipo` (`id_tipo`, `nome`) VALUES
(1, 'elmo'),
(2, 'armadura'),
(3, 'calças'),
(4, 'botas'),
(5, 'arcano'),
(6, 'piromancia'),
(7, 'milagres');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `arma`
--
ALTER TABLE `arma`
  ADD PRIMARY KEY (`id_arma`),
  ADD KEY `id_raridade` (`id_raridade`);

--
-- Índices de tabela `atributo`
--
ALTER TABLE `atributo`
  ADD KEY `id_personagem` (`id_personagem`);

--
-- Índices de tabela `consumiveis`
--
ALTER TABLE `consumiveis`
  ADD PRIMARY KEY (`id_consumiveis`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `id_personagem` (`id_personagem`);

--
-- Índices de tabela `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`id_conta`);

--
-- Índices de tabela `equipamento`
--
ALTER TABLE `equipamento`
  ADD PRIMARY KEY (`id_equipamento`),
  ADD KEY `id_raridade` (`id_raridade`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Índices de tabela `itens`
--
ALTER TABLE `itens`
  ADD PRIMARY KEY (`id_itens`);

--
-- Índices de tabela `magia`
--
ALTER TABLE `magia`
  ADD PRIMARY KEY (`id_magia`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `id_personagem` (`id_personagem`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Índices de tabela `mao`
--
ALTER TABLE `mao`
  ADD KEY `id_personagem` (`id_personagem`),
  ADD KEY `id_arma1` (`id_arma1`),
  ADD KEY `id_arma2` (`id_arma2`),
  ADD KEY `id_arma3` (`id_arma3`);

--
-- Índices de tabela `personagem`
--
ALTER TABLE `personagem`
  ADD PRIMARY KEY (`id_personagem`),
  ADD KEY `id_conta` (`id_conta`),
  ADD KEY `elmo` (`elmo`),
  ADD KEY `peitoral` (`peitoral`),
  ADD KEY `luvas` (`luvas`),
  ADD KEY `calcas` (`calcas`);

--
-- Índices de tabela `raridade`
--
ALTER TABLE `raridade`
  ADD PRIMARY KEY (`id_raridade`);

--
-- Índices de tabela `slotbolsa`
--
ALTER TABLE `slotbolsa`
  ADD KEY `id_personagem` (`id_personagem`),
  ADD KEY `id_arma` (`id_arma`),
  ADD KEY `id_equipamento` (`id_equipamento`),
  ADD KEY `id_consumivel` (`id_consumivel`),
  ADD KEY `id_item` (`id_item`);

--
-- Índices de tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arma`
--
ALTER TABLE `arma`
  MODIFY `id_arma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consumiveis`
--
ALTER TABLE `consumiveis`
  MODIFY `id_consumiveis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `conta`
--
ALTER TABLE `conta`
  MODIFY `id_conta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `equipamento`
--
ALTER TABLE `equipamento`
  MODIFY `id_equipamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itens`
--
ALTER TABLE `itens`
  MODIFY `id_itens` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `magia`
--
ALTER TABLE `magia`
  MODIFY `id_magia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personagem`
--
ALTER TABLE `personagem`
  MODIFY `id_personagem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `raridade`
--
ALTER TABLE `raridade`
  MODIFY `id_raridade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `arma`
--
ALTER TABLE `arma`
  ADD CONSTRAINT `arma_ibfk_1` FOREIGN KEY (`id_raridade`) REFERENCES `raridade` (`id_raridade`);

--
-- Restrições para tabelas `atributo`
--
ALTER TABLE `atributo`
  ADD CONSTRAINT `atributo_ibfk_1` FOREIGN KEY (`id_personagem`) REFERENCES `personagem` (`id_personagem`);

--
-- Restrições para tabelas `consumiveis`
--
ALTER TABLE `consumiveis`
  ADD CONSTRAINT `consumiveis_ibfk_1` FOREIGN KEY (`id_personagem`) REFERENCES `personagem` (`id_personagem`);

--
-- Restrições para tabelas `equipamento`
--
ALTER TABLE `equipamento`
  ADD CONSTRAINT `equipamento_ibfk_1` FOREIGN KEY (`id_raridade`) REFERENCES `raridade` (`id_raridade`),
  ADD CONSTRAINT `equipamento_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`);

--
-- Restrições para tabelas `magia`
--
ALTER TABLE `magia`
  ADD CONSTRAINT `magia_ibfk_1` FOREIGN KEY (`id_personagem`) REFERENCES `personagem` (`id_personagem`),
  ADD CONSTRAINT `magia_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`);

--
-- Restrições para tabelas `mao`
--
ALTER TABLE `mao`
  ADD CONSTRAINT `mao_ibfk_1` FOREIGN KEY (`id_personagem`) REFERENCES `personagem` (`id_personagem`),
  ADD CONSTRAINT `mao_ibfk_2` FOREIGN KEY (`id_arma1`) REFERENCES `arma` (`id_arma`),
  ADD CONSTRAINT `mao_ibfk_3` FOREIGN KEY (`id_arma2`) REFERENCES `arma` (`id_arma`),
  ADD CONSTRAINT `mao_ibfk_4` FOREIGN KEY (`id_arma3`) REFERENCES `arma` (`id_arma`);

--
-- Restrições para tabelas `personagem`
--
ALTER TABLE `personagem`
  ADD CONSTRAINT `personagem_ibfk_1` FOREIGN KEY (`id_conta`) REFERENCES `conta` (`id_conta`),
  ADD CONSTRAINT `personagem_ibfk_2` FOREIGN KEY (`elmo`) REFERENCES `equipamento` (`id_equipamento`),
  ADD CONSTRAINT `personagem_ibfk_3` FOREIGN KEY (`peitoral`) REFERENCES `equipamento` (`id_equipamento`),
  ADD CONSTRAINT `personagem_ibfk_4` FOREIGN KEY (`luvas`) REFERENCES `equipamento` (`id_equipamento`),
  ADD CONSTRAINT `personagem_ibfk_5` FOREIGN KEY (`calcas`) REFERENCES `equipamento` (`id_equipamento`);

--
-- Restrições para tabelas `slotbolsa`
--
ALTER TABLE `slotbolsa`
  ADD CONSTRAINT `slotbolsa_ibfk_1` FOREIGN KEY (`id_personagem`) REFERENCES `personagem` (`id_personagem`),
  ADD CONSTRAINT `slotbolsa_ibfk_2` FOREIGN KEY (`id_arma`) REFERENCES `arma` (`id_arma`),
  ADD CONSTRAINT `slotbolsa_ibfk_3` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamento` (`id_equipamento`),
  ADD CONSTRAINT `slotbolsa_ibfk_4` FOREIGN KEY (`id_consumivel`) REFERENCES `consumiveis` (`id_consumiveis`),
  ADD CONSTRAINT `slotbolsa_ibfk_5` FOREIGN KEY (`id_item`) REFERENCES `itens` (`id_itens`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
