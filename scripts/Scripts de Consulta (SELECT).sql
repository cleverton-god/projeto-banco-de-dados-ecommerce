-- Listar todos os clientes
SELECT
    c.id_cliente,
    c.nome,
    c.email,
    c.telefone,
    e.rua AS endereco_rua,
    e.numero AS endereco_numero,
    e.cidade AS endereco_cidade,
    e.estado AS endereco_estado,
    e.cep AS endereco_cep
FROM
    Cliente c
LEFT JOIN
    Endereco e ON c.id_cliente = e.id_cliente;

-- Consultar produtos por categoria
SELECT
    p.nome AS produto,
    c.nome AS categoria,
    p.preco,
    p.estoque
FROM
    Produto p
JOIN
    ProdutoCategoria pc ON p.id_produto = pc.id_produto 
JOIN
    Categoria c ON pc.id_categoria = c.id_categoria; 

-- Consultar pedidos de um cliente
SELECT
    o.id_pedido,
    o.status,
    o.data_pedido,
    SUM(i.quantidade * i.preco_unitario) AS total
FROM
    Pedido o
JOIN
    ItemPedido i ON o.id_pedido = i.id_pedido
WHERE
    o.id_cliente = 1
GROUP BY
    o.id_pedido, o.status, o.data_pedido;

-- Consultar pagamentos aprovados
SELECT
    p.id_pagamento,
    p.id_pedido,
    p.valor,
    p.status
FROM
    Pagamento p
WHERE
    p.status = 'Aprovado';

-- Consultar entregas pendentes
SELECT
    e.id_entrega,
    e.id_pedido,
    e.status
FROM
    Entrega e
WHERE
    e.status IN ('Preparando','Enviado');