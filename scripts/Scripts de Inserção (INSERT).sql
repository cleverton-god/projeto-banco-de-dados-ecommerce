    -- Inserir clientes
    INSERT INTO Cliente (nome, email, telefone)
    VALUES 
    ('João Silva', 'joao@email.com', '11999999999'),
    ('Maria Oliveira', 'maria@email.com', '11988888888');

    -- Inserir endereços
    INSERT INTO Endereco (id_cliente, rua, numero, cidade, estado, cep, tipo)
    VALUES 
    (1, 'Rua A', '123', 'São Paulo', 'SP', '01001-000', 'Entrega'),
    (2, 'Rua B', '456', 'Rio de Janeiro', 'RJ', '20010-000', 'Entrega');

    -- Inserir categorias
    INSERT INTO Categoria (nome, descricao)
    VALUES 
    ('Eletrônicos', 'Produtos eletrônicos em geral'),
    ('Roupas', 'Moda masculina e feminina');

    -- Inserir produtos
    INSERT INTO Produto (nome, descricao, preco, estoque, peso, dimensao_l, dimensao_a, dimensao_p)
    VALUES
    ('Smartphone X', 'Smartphone top de linha', 3500.00, 50, 0.180, 7.0, 14.5, 0.8),
    ('Camisa Polo', 'Camisa masculina azul', 120.00, 100, 0.200, 0, 0, 0);

    -- Inserir associação Produto-Categoria (N:N)
    INSERT INTO ProdutoCategoria (id_produto, id_categoria)
    VALUES
    (1, 1),
    (2, 2);

    -- Inserir pedidos
    INSERT INTO Pedido (id_cliente, status)
    VALUES 
    (1, 'Aberto'),
    (2, 'Aberto');

    -- Inserir itens de pedido
    INSERT INTO ItemPedido (id_pedido, id_produto, quantidade, preco_unitario)
    VALUES
    (1, 1, 1, 3500.00),
    (2, 2, 2, 120.00);

    -- Inserir pagamentos
    INSERT INTO Pagamento (id_pedido, forma_pagamento, valor, status)
    VALUES
    (1, 'Cartão', 3500.00, 'Aprovado'),
    (2, 'Pix', 240.00, 'Pendente');

    -- Inserir entregas
    INSERT INTO Entrega (id_pedido, status)
    VALUES
    (1, 'Preparando'),
    (2, 'Preparando');

    -- Inserir cupons
    INSERT INTO Cupom (codigo, valor_desconto, data_validade)
    VALUES
    ('PROMO10', 10.00, '2025-12-31'),
    ('NOVOCLIENTE', 15.00, '2025-12-31');

    -- Aplicar cupom ao pedido
    INSERT INTO PedidoCupom (id_pedido, id_cupom)
    VALUES
    (1, 1),
    (2, 2);

    -- Inserir histórico de estoque
    INSERT INTO HistoricoEstoque (id_produto, quantidade, tipo_movimento, observacao)
    VALUES
    (1, 50, 'Entrada', 'Estoque inicial do smartphone X'),
    (2, 100, 'Entrada', 'Estoque inicial camisa polo');

    -- Inserir avaliações de produtos
    INSERT INTO AvaliacaoProduto (id_produto, id_cliente, nota, comentario)
    VALUES
    (1, 1, 5, 'Excelente smartphone!'),
    (2, 2, 4, 'Camisa boa, tamanho correto.');