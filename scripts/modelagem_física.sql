-- ======================================
-- Tabela Cliente
-- ======================================
CREATE TABLE Cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco_rua VARCHAR(100),
    endereco_numero VARCHAR(10),
    endereco_cidade VARCHAR(50),
    endereco_estado VARCHAR(50),
    endereco_cep VARCHAR(20),
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ======================================
-- Tabela Categoria
-- ======================================
CREATE TABLE Categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

-- ======================================
-- Tabela Produto
-- ======================================
CREATE TABLE Produto (
    id_produto SERIAL PRIMARY KEY,
    id_categoria INT NOT NULL REFERENCES Categoria(id_categoria),
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10,2) NOT NULL CHECK (preco >= 0),
    estoque INT DEFAULT 0 CHECK (estoque >= 0),
    peso NUMERIC(10,2),
    dimensao_l NUMERIC(10,2),
    dimensao_a NUMERIC(10,2),
    dimensao_p NUMERIC(10,2),
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ======================================
-- Tabela Pedido
-- ======================================
CREATE TABLE Pedido (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL REFERENCES Cliente(id_cliente),
    data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Aberto','Pago','Cancelado','Enviado','Entregue'))
);

-- ======================================
-- Tabela ItemPedido
-- ======================================
CREATE TABLE ItemPedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL REFERENCES Pedido(id_pedido),
    id_produto INT NOT NULL REFERENCES Produto(id_produto),
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10,2) NOT NULL CHECK (preco_unitario >= 0)
);

-- ======================================
-- Tabela Pagamento
-- ======================================
CREATE TABLE Pagamento (
    id_pagamento SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL REFERENCES Pedido(id_pedido),
    forma_pagamento VARCHAR(50) NOT NULL CHECK (forma_pagamento IN ('Cartão','Boleto','Pix','Dinheiro')),
    valor NUMERIC(10,2) NOT NULL CHECK (valor >= 0),
    data_pagamento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Pendente','Aprovado','Recusado'))
);

-- ======================================
-- Tabela Entrega
-- ======================================
CREATE TABLE Entrega (
    id_entrega SERIAL PRIMARY KEY,
    id_pedido INT NOT NULL UNIQUE REFERENCES Pedido(id_pedido),
    data_envio TIMESTAMP,
    data_entrega TIMESTAMP,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Preparando','Enviado','Entregue','Atrasado'))
);

-- ======================================
-- Tabela Cupom
-- ======================================
CREATE TABLE Cupom (
    id_cupom SERIAL PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    valor_desconto NUMERIC(10,2) NOT NULL CHECK (valor_desconto >= 0),
    data_validade TIMESTAMP NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

-- ======================================
-- Tabela PedidoCupom (N:N)
-- ======================================
CREATE TABLE PedidoCupom (
    id_pedido INT NOT NULL REFERENCES Pedido(id_pedido),
    id_cupom INT NOT NULL REFERENCES Cupom(id_cupom),
    PRIMARY KEY (id_pedido, id_cupom)
);

-- ======================================
-- Tabela HistoricoEstoque
-- ======================================
CREATE TABLE HistoricoEstoque (
    id_historico SERIAL PRIMARY KEY,
    id_produto INT NOT NULL REFERENCES Produto(id_produto),
    quantidade INT NOT NULL,
    tipo_movimento VARCHAR(50) NOT NULL CHECK (tipo_movimento IN ('Entrada','Saida','Ajuste')),
    data_movimento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacao TEXT
);

-- ======================================
-- Tabela AvaliacaoProduto
-- ======================================
CREATE TABLE AvaliacaoProduto (
    id_avaliacao SERIAL PRIMARY KEY,
    id_produto INT NOT NULL REFERENCES Produto(id_produto),
    id_cliente INT NOT NULL REFERENCES Cliente(id_cliente),
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
