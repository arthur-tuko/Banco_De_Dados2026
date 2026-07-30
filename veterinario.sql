-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/07/2026 às 17:27
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `veterinario`
--
CREATE DATABASE IF NOT EXISTS `veterinario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `veterinario`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `animais`
--

CREATE TABLE `animais` (
  `idanimal` int(11) NOT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `nomeanimal` varchar(255) NOT NULL,
  `raca` varchar(100) NOT NULL,
  `datanascimento` date NOT NULL,
  `especie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `animais`
--

INSERT INTO `animais` (`idanimal`, `idcliente`, `nomeanimal`, `raca`, `datanascimento`, `especie`) VALUES
(7, NULL, 'luna', 'pelo-curto', '2018-03-14', ''),
(8, NULL, 'milla', 'siames', '2023-01-15', ''),
(9, NULL, 'rex', 't-rex', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimentos`
--

CREATE TABLE `atendimentos` (
  `idatendimento` int(11) NOT NULL,
  `idani` int(11) DEFAULT NULL,
  `idveterinario` int(11) DEFAULT NULL,
  `dataatendimento` date NOT NULL,
  `horaatendimento` time NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nome`, `tel`, `email`, `cpf`, `endereco`) VALUES
(1, 'Brunão', '11 95186-4677', 'bruvvanel@gmail.com', '536-673-743-42', 'Rua primeiro de junho 522'),
(2, 'Arthur G', '11 97146-5623', 'gomeswga6967@hmail.com', '467-435-658-65', 'Rua Tabarana'),
(3, 'Arthur F', '11 99530-3847', 'francoarthur058@gmail.com', '473-286-868-12', 'Rua joão aleto 112');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `idvent` int(11) NOT NULL,
  `nomevet` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `crmv` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `animais`
--
ALTER TABLE `animais`
  ADD PRIMARY KEY (`idanimal`),
  ADD KEY `idcliente` (`idcliente`);

--
-- Índices de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD PRIMARY KEY (`idatendimento`),
  ADD KEY `idani` (`idani`),
  ADD KEY `idveterinario` (`idveterinario`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`idvent`),
  ADD UNIQUE KEY `crmv` (`crmv`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animais`
--
ALTER TABLE `animais`
  MODIFY `idanimal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `atendimentos`
--
ALTER TABLE `atendimentos`
  MODIFY `idatendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `idvent` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `animais`
--
ALTER TABLE `animais`
  ADD CONSTRAINT `animais_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`);

--
-- Restrições para tabelas `atendimentos`
--
ALTER TABLE `atendimentos`
  ADD CONSTRAINT `atendimentos_ibfk_1` FOREIGN KEY (`idani`) REFERENCES `animais` (`idanimal`),
  ADD CONSTRAINT `atendimentos_ibfk_2` FOREIGN KEY (`idveterinario`) REFERENCES `veterinario` (`idvent`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
