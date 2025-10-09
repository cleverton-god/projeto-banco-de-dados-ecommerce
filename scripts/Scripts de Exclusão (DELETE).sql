-- Remover um cupom
DELETE FROM Cupom
WHERE codigo = 'NOVOCLIENTE';

-- Remover um item do pedido
DELETE FROM ItemPedido
WHERE id_pedido = [ID_DO_PEDIDO] AND id_produto = [ID_DO_PRODUTO];

-- Remover um cliente 
DELETE FROM Cliente
WHERE id_cliente = 2;