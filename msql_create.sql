-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Criando DATABASE
CREATE DATABASE IF NOT EXISTS `loja`;

--- Indicando o Banco onde serão criadas as tabelas

USE `loja`; 

-- Criando tabela anexos
CREATE TABLE IF NOT EXISTS `anexos` (
  `idAnexos` int NOT NULL AUTO_INCREMENT,
  `anexo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `thumb` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `os_id` int NOT NULL,
  PRIMARY KEY (`idAnexos`),
  KEY `fk_anexos_os1` (`os_id`),
  CONSTRAINT `fk_anexos_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Criando tabela  anotacoes_os
CREATE TABLE IF NOT EXISTS `anotacoes_os` (
  `idAnotacoes` int NOT NULL AUTO_INCREMENT,
  `anotacao` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `data_hora` datetime NOT NULL,
  `os_id` int NOT NULL,
  PRIMARY KEY (`idAnotacoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `idCategorias` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Criando tabela  ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Criando tabela  clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `idClientes` int NOT NULL AUTO_INCREMENT,
  `asaas_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nomeCliente` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `sexo` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pessoa_fisica` tinyint(1) NOT NULL DEFAULT '1',
  `documento` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `dataCadastro` date DEFAULT NULL,
  `rua` varchar(70) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bairro` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cep` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contato` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `complemento` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fornecedor` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela cobrancas
CREATE TABLE IF NOT EXISTS `cobrancas` (
  `idCobranca` int NOT NULL AUTO_INCREMENT,
  `charge_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `conditional_discount_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `custom_id` int DEFAULT NULL,
  `expire_at` date NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_method` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_delivery_address` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `total` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `pdf` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vendas_id` int DEFAULT NULL,
  `os_id` int DEFAULT NULL,
  `clientes_id` int DEFAULT NULL,
  PRIMARY KEY (`idCobranca`),
  KEY `fk_cobrancas_os1` (`os_id`),
  KEY `fk_cobrancas_vendas1` (`vendas_id`),
  KEY `fk_cobrancas_clientes1` (`clientes_id`),
  CONSTRAINT `fk_cobrancas_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `fk_cobrancas_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`),
  CONSTRAINT `fk_cobrancas_vendas1` FOREIGN KEY (`vendas_id`) REFERENCES `vendas` (`idVendas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Criando tabela   configuracoes
CREATE TABLE IF NOT EXISTS `configuracoes` (
  `idConfig` int NOT NULL AUTO_INCREMENT,
  `config` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`idConfig`),
  UNIQUE KEY `config` (`config`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  contas
CREATE TABLE IF NOT EXISTS `contas` (
  `idContas` int NOT NULL AUTO_INCREMENT,
  `conta` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banco` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `tipo` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idContas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Criando tabela   documentos
CREATE TABLE IF NOT EXISTS `documentos` (
  `idDocumentos` int NOT NULL AUTO_INCREMENT,
  `documento` varchar(70) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_general_ci,
  `file` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `path` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `categoria` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tamanho` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idDocumentos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Criando tabela   email_queue
CREATE TABLE IF NOT EXISTS `email_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `to` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cc` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('pending','sending','sent','failed') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `headers` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  emitente
CREATE TABLE IF NOT EXISTS `emitente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cnpj` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ie` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rua` varchar(70) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bairro` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uf` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url_logo` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cep` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  equipamentos
CREATE TABLE IF NOT EXISTS `equipamentos` (
  `idEquipamentos` int NOT NULL AUTO_INCREMENT,
  `equipamento` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `num_serie` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modelo` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cor` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descricao` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tensao` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `potencia` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `voltagem` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `marcas_id` int DEFAULT NULL,
  `clientes_id` int DEFAULT NULL,
  PRIMARY KEY (`idEquipamentos`),
  KEY `fk_equipanentos_marcas1_idx` (`marcas_id`),
  KEY `fk_equipanentos_clientes1_idx` (`clientes_id`),
  CONSTRAINT `fk_equipanentos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `fk_equipanentos_marcas1` FOREIGN KEY (`marcas_id`) REFERENCES `marcas` (`idMarcas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  equipamentos_os
CREATE TABLE IF NOT EXISTS `equipamentos_os` (
  `idEquipamentos_os` int NOT NULL AUTO_INCREMENT,
  `defeito_declarado` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `defeito_encontrado` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `solucao` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `equipamentos_id` int DEFAULT NULL,
  `os_id` int DEFAULT NULL,
  PRIMARY KEY (`idEquipamentos_os`),
  KEY `fk_equipamentos_os_equipanentos1_idx` (`equipamentos_id`),
  KEY `fk_equipamentos_os_os1_idx` (`os_id`),
  CONSTRAINT `fk_equipamentos_os_equipanentos1` FOREIGN KEY (`equipamentos_id`) REFERENCES `equipamentos` (`idEquipamentos`),
  CONSTRAINT `fk_equipamentos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Criando tabela  garantias
CREATE TABLE IF NOT EXISTS `garantias` (
  `idGarantias` int NOT NULL AUTO_INCREMENT,
  `dataGarantia` date DEFAULT NULL,
  `refGarantia` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `textoGarantia` text COLLATE utf8mb4_general_ci,
  `usuarios_id` int DEFAULT NULL,
  PRIMARY KEY (`idGarantias`),
  KEY `fk_garantias_usuarios1` (`usuarios_id`),
  CONSTRAINT `fk_garantias_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Criando tabela  itens_de_vendas
CREATE TABLE IF NOT EXISTS `itens_de_vendas` (
  `idItens` int NOT NULL AUTO_INCREMENT,
  `subTotal` decimal(10,2) DEFAULT '0.00',
  `quantidade` int DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT '0.00',
  `vendas_id` int NOT NULL,
  `produtos_id` int NOT NULL,
  PRIMARY KEY (`idItens`),
  KEY `fk_itens_de_vendas_vendas1` (`vendas_id`),
  KEY `fk_itens_de_vendas_produtos1` (`produtos_id`),
  CONSTRAINT `fk_itens_de_vendas_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`idProdutos`),
  CONSTRAINT `fk_itens_de_vendas_vendas1` FOREIGN KEY (`vendas_id`) REFERENCES `vendas` (`idVendas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  lancamentos
CREATE TABLE IF NOT EXISTS `lancamentos` (
  `idLancamentos` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT '0.00',
  `desconto` decimal(10,2) DEFAULT '0.00',
  `valor_desconto` decimal(10,2) DEFAULT '0.00',
  `tipo_desconto` varchar(8) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `baixado` tinyint(1) DEFAULT '0',
  `cliente_fornecedor` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `forma_pgto` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `anexo` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8mb4_general_ci,
  `clientes_id` int DEFAULT NULL,
  `categorias_id` int DEFAULT NULL,
  `contas_id` int DEFAULT NULL,
  `vendas_id` int DEFAULT NULL,
  `usuarios_id` int NOT NULL,
  PRIMARY KEY (`idLancamentos`),
  KEY `fk_lancamentos_clientes1` (`clientes_id`),
  KEY `fk_lancamentos_categorias1_idx` (`categorias_id`),
  KEY `fk_lancamentos_contas1_idx` (`contas_id`),
  KEY `fk_lancamentos_usuarios1` (`usuarios_id`),
  CONSTRAINT `fk_lancamentos_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`idCategorias`),
  CONSTRAINT `fk_lancamentos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `fk_lancamentos_contas1` FOREIGN KEY (`contas_id`) REFERENCES `contas` (`idContas`),
  CONSTRAINT `fk_lancamentos_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  logs
CREATE TABLE IF NOT EXISTS `logs` (
  `idLogs` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tarefa` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idLogs`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  marcas
CREATE TABLE IF NOT EXISTS `marcas` (
  `idMarcas` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cadastro` date DEFAULT NULL,
  `situacao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idMarcas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Criando  migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Criando tabela  os
CREATE TABLE IF NOT EXISTS `os` (
  `idOs` int NOT NULL AUTO_INCREMENT,
  `dataInicial` date DEFAULT NULL,
  `dataFinal` date DEFAULT NULL,
  `garantia` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descricaoProduto` text COLLATE utf8mb4_general_ci,
  `defeito` text COLLATE utf8mb4_general_ci,
  `status` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `observacoes` text COLLATE utf8mb4_general_ci,
  `laudoTecnico` text COLLATE utf8mb4_general_ci,
  `valorTotal` decimal(10,2) DEFAULT '0.00',
  `desconto` decimal(10,2) DEFAULT '0.00',
  `valor_desconto` decimal(10,2) DEFAULT '0.00',
  `tipo_desconto` varchar(8) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `clientes_id` int NOT NULL,
  `usuarios_id` int NOT NULL,
  `lancamento` int DEFAULT NULL,
  `faturado` tinyint(1) NOT NULL,
  `garantias_id` int DEFAULT NULL,
  PRIMARY KEY (`idOs`),
  KEY `fk_os_clientes1` (`clientes_id`),
  KEY `fk_os_usuarios1` (`usuarios_id`),
  KEY `fk_os_lancamentos1` (`lancamento`),
  KEY `fk_os_garantias1` (`garantias_id`),
  CONSTRAINT `fk_os_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `fk_os_lancamentos1` FOREIGN KEY (`lancamento`) REFERENCES `lancamentos` (`idLancamentos`),
  CONSTRAINT `fk_os_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  permissoes
CREATE TABLE IF NOT EXISTS `permissoes` (
  `idPermissao` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `permissoes` text COLLATE utf8mb4_general_ci,
  `situacao` tinyint(1) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `idProdutos` int NOT NULL AUTO_INCREMENT,
  `codDeBarra` varchar(70) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `unidade` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `precoCompra` decimal(10,2) DEFAULT NULL,
  `precoVenda` decimal(10,2) NOT NULL,
  `estoque` int NOT NULL,
  `estoqueMinimo` int DEFAULT NULL,
  `saida` tinyint(1) DEFAULT NULL,
  `entrada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  produtos_os
CREATE TABLE IF NOT EXISTS `produtos_os` (
  `idProdutos_os` int NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `descricao` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT '0.00',
  `os_id` int NOT NULL,
  `produtos_id` int NOT NULL,
  `subTotal` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`idProdutos_os`),
  KEY `fk_produtos_os_os1` (`os_id`),
  KEY `fk_produtos_os_produtos1` (`produtos_id`),
  CONSTRAINT `fk_produtos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`),
  CONSTRAINT `fk_produtos_os_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  resets_de_senha
CREATE TABLE IF NOT EXISTS `resets_de_senha` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `data_expiracao` datetime NOT NULL,
  `token_utilizado` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  servicos
CREATE TABLE IF NOT EXISTS `servicos` (
  `idServicos` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idServicos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  servicos_os
CREATE TABLE IF NOT EXISTS `servicos_os` (
  `idServicos_os` int NOT NULL AUTO_INCREMENT,
  `servico` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quantidade` double DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT '0.00',
  `os_id` int NOT NULL,
  `servicos_id` int NOT NULL,
  `subTotal` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`idServicos_os`),
  KEY `fk_servicos_os_os1` (`os_id`),
  KEY `fk_servicos_os_servicos1` (`servicos_id`),
  CONSTRAINT `fk_servicos_os_os1` FOREIGN KEY (`os_id`) REFERENCES `os` (`idOs`),
  CONSTRAINT `fk_servicos_os_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`idServicos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `idUsuarios` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `rg` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cpf` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_general_ci NOT NULL,
  `rua` varchar(70) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numero` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bairro` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `situacao` tinyint(1) NOT NULL,
  `dataCadastro` date NOT NULL,
  `permissoes_id` int NOT NULL,
  `dataExpiracao` date DEFAULT NULL,
  `url_image_user` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `fk_usuarios_permissoes1_idx` (`permissoes_id`),
  CONSTRAINT `fk_usuarios_permissoes1` FOREIGN KEY (`permissoes_id`) REFERENCES `permissoes` (`idPermissao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Criando tabela  vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `idVendas` int NOT NULL AUTO_INCREMENT,
  `dataVenda` date DEFAULT NULL,
  `valorTotal` decimal(10,2) DEFAULT '0.00',
  `desconto` decimal(10,2) DEFAULT '0.00',
  `valor_desconto` decimal(10,2) DEFAULT '0.00',
  `tipo_desconto` varchar(8) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `faturado` tinyint(1) DEFAULT NULL,
  `observacoes` text COLLATE utf8mb4_general_ci,
  `observacoes_cliente` text COLLATE utf8mb4_general_ci,
  `clientes_id` int NOT NULL,
  `usuarios_id` int DEFAULT NULL,
  `lancamentos_id` int DEFAULT NULL,
  PRIMARY KEY (`idVendas`),
  KEY `fk_vendas_clientes1` (`clientes_id`),
  KEY `fk_vendas_usuarios1` (`usuarios_id`),
  KEY `fk_vendas_lancamentos1` (`lancamentos_id`),
  CONSTRAINT `fk_vendas_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`idClientes`),
  CONSTRAINT `fk_vendas_lancamentos1` FOREIGN KEY (`lancamentos_id`) REFERENCES `lancamentos` (`idLancamentos`),
  CONSTRAINT `fk_vendas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`idUsuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;