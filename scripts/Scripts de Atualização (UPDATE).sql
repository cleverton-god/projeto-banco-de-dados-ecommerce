-- Atualizar status do pedido
UPDATE Pedido
SET status = 'Pago'
WHERE id_pedido = 2;

-- Atualizar estoque após venda
UPDATE Produto
SET estoque = estoque - 2
WHERE id_produto = 2;

-- Atualizar status de entrega
UPDATE Entrega
SET status = 'Enviado', data_envio = CURRENT_TIMESTAMP
WHERE id_pedido = 1;